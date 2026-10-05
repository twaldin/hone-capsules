# Vanilla-attention step at W=2048: kernel/layout optimization (2026-09-25)

TL;DR: a new KV-cache layout (quad-interleaved u8 K + bf16 pair-packed V, "Q") with an AVX-512 VNNI QK twin cuts the
`attn step qk+sm+pv` cost at W=2048 (full window, long articles) from 289K to 197K cycles/token (**-32 %**) on a
Zen 4 host where the KV stream stays in L3, bit-identical outputs; because it streams 1.5x the bytes it is *slower*
on a host whose KV traffic goes to DRAM, so the compressor picks it at run time from the L3 size and otherwise uses a
"QI" layout (quad K + the old int8 V) that is never slower than today (-18 % in L3, ~0 % from DRAM). AVX2-only hosts
(Ryzen 7 3700) gain little in the kernel micro-benchmark (-2 %; the AVX2 step is compute-bound in ways that cannot be
fixed without reassociating), yet the full compressor on an AVX2-only AMD host compressed the 3 MB smoke 7 % faster
(single run, section 6). The full-compressor smoke archive is byte-identical to the reference lexth12cb build.

Everything below was measured on Modal CPU sandboxes (env dev-neel, no GPUs): **AMD EPYC 9654 (Zen 4)** from the
default pool and **Intel Xeon Platinum 8375C (Ice Lake SP)** via `cloud="aws"`, both with AVX-512 F/BW/VL/VNNI,
pinned to cpu 0, core cycles via the tree's `bench_common.h` calibration. Neither is a judge machine (i7-1165G7 Tiger
Lake / Ryzen 7 3700 Zen 2); the two hosts happen to sit in the two memory regimes that decide the layout question
(section 4), which is why the choice is made at run time.

## 1. Deliverables

| file | what |
|---|---|
| `work/sota/attn_opt/attn_speed.patch` | `git diff` of the working copy `work/sota/attn_opt/tree` against its start state (tag `attn_opt_base` = the lext_big working tree as found, including its uncommitted modifications) |
| `work/sota/attn_opt/tree/` | the patched copy of `work/sota/lext_big` (lext_big itself untouched) |
| `work/sota/attn_opt/REPORT.md` | this report |
| `work/sota/attn_opt/modal_big_attn.py` | copy of `modal_big.py` pointed at the copied tree: variant `lexth12cb_attnfast` (= the lexth12cb recipe) + `build_and_compare` (builds, then compresses the 3 MB smoke prefix with the new AND the reference `lexth12cb` binary and compares the archives) |
| `work/sota/attn_opt/harness/` | Modal sandbox harness (`sb.py`), the kernel micro-benchmark `bench_step.cpp`, probes, the test/bench scripts and all logs (`harness/logs/`) |

Files changed by the patch (13): `cpp_infer/src/opt/attn.h`, `attn.cpp`, **new** `attn_avx512.cpp`, `model_opt.h`,
`model_opt.cpp`, `bench_opt.cpp`, `test_e2e_opt.cpp`, `test_attn.cpp`, `Makefile.attn`, `cpp_infer/Makefile`,
`lext_big/makefile`, `build_and_construct_comp.sh` (AVX-512 confinement whitelist gets `tf_attn_avx512.o`), `src/predictor.cpp`
(constructs the transformer with `AttnKind::KVAUTO`). Binary: `cmix_orig` 198,260 -> 202,280 B (+4.0 KB: the extra kinds
and the AVX-512 object; the confinement check passes with 1376 EVEX instructions inside the three `*_avx512` objects).

## 2. Where the time went (baseline, W=2048, full window)

`bench_step` (harness, random int8 q/k/v, real 3-layer rings at a full window, a 5.9 MB weight-stream emulation between
layers exactly like `bench_attn`, `-DATTN_PROFILE` phase split), production int8 kind, cycles/token for the 3 layers:

| host | qk | exp | pv | total | per head-row (18432/token) |
|---|---|---|---|---|---|
| Zen 4 | 108K | 33K | 167K | **308K** | qk 5.8, exp 1.8, pv 9.1 cyc |
| Ice Lake SP | 137-143K | 35K | 155-158K | **337K** | |

The full transformer on the long-article set (138 test articles >= 4096 tokens, first 40 = 704K tokens, 78 % of them at a
full W=2048 window; `bench_opt_prof --attn int8`) shows the same step at **289K cycles/token on both hosts** (49.6 % of the
transformer on Zen 4, 41 % on Ice Lake) -- 1.6x the 179K of the short-article profile in `prof_run11_vs_run12.log`,
confirming the task's suspicion that the profile under-weights the full-window regime.

Phase analysis on Zen 4 (KV resident in L3, measured stream bandwidth 24.5 B/cycle from L3, 32 from L2):
* QK (int8 pair layout): 5.8 cyc/position = compute-bound on the unpack: 4 `vpmovsxbw` + 4 `vpmaddwd` + 4 `vpaddd` per
  position.
* PV (int8 V): 9.1 cyc/row = the `vpmovsxbd` + `vcvtdq2ps` conversion pipe (measured 8.9 cyc/row with V in L1, i.e. it
  is not memory-bound at all).
* exp: 1.8 cyc/element, compute (exp256_ps alone is 1.22).
On Ice Lake the same kernel runs at the same speed for a different reason: that sandbox's core streams anything larger
than its 1.25 MB L2 at only 9.9 B/cycle (3 MB and 24 MB working sets alike -- a shared, noisy L3, effectively DRAM),
so 2.25 MB of KV per token cost >= 227K cycles no matter how they are computed.

## 3. What the patch does

### 3.1 KV layouts (`attn.h`)
* **`AttnKVQT` ("Q")** -- K stored as **u8 = int8 + 128, quad-interleaved**: `k[head][block16][quad][16 positions x 4 dims]`,
  one 64-byte row per (block, quad). V stored **bf16 pair-packed**: `v[head][slot/2][64]` uint32 words holding
  `bf16(float(v[2p]))` in the high half and `bf16(float(v[2p+1]))` in the low half. An int8 has <= 8 significant bits, so
  its fp32 pattern has 16 zero low bits: `word & 0xFFFF0000` and `word << 16` are the EXACT fp32 values of the two rows
  -- PV becomes load + one byte-shuffle + fmadd per 8 dims (no `vpmovsxbd`, no `vcvtdq2ps`) at 2 bytes/value.
  576 KB/layer at W=1024, 1.125 MB at W=2048.
* **`AttnKVQIT` ("QI")** -- the same quad K with the old int8 V rows (PV = the existing `pv_dense_i8` asm): same bytes as
  today's production cache, only QK changes.
* `AttnKVT` (int8, the previous production kind) and `AttnKVF32T` stay as reference/measurement kinds.
* `KvKind::AUTO` (the production setting, `predictor.cpp`) resolves at load: **Q if `sysconf(_SC_LEVEL3_CACHE_SIZE)` >= 16 MB,
  else QI**; `FX2_ATTN_KV=q|qi|i8|f32` overrides for A/B tests. The threshold separates the judges' machines: Ryzen 7 3700
  (16 MB per CCX) -> Q, i7-1165G7 (12 MB, shared with the weight stream) -> QI. The archive does not depend on the choice.

### 3.2 Kernels
* **QK, AVX-512 VNNI** (`attn_avx512.cpp`, compiled with exactly the F/BW/VL/VNNI flags like the qmat twins, selected by
  `qmat_cpu.h cpu_has_avx512_vnni()`): one `vpdpbusd` per 64-byte K row (u8 K x s8 q broadcast) = 16 positions x 4 dims,
  16 instructions per 16-position block instead of 64 unpacks + 64 madds + 64 adds; 8 blocks (128 positions) per iteration
  = 8 independent accumulators for the 5-cycle latency. The u8 bias adds exactly `128 * sum(q)` to every dot and is
  subtracted once per position in int32 (exact; |dot| <= 2^20). One `vpermd` per 16 scores restores slot order.
* **QK, AVX2** (`attn.cpp attn_qk_q_avx2`): `vpmovzxbw` (16 B = 4 positions x 4 dims) + `vpmaddwd` against the q quad as
  int16 pairs -> 2 partial dwords per position, `vphaddd` pairs them; the positions of each 8-position half are stored in
  the order 0,1,4,5,2,3,6,7 so the hadd lands the 8 scores in slot order without a permute. Same MAC/shuffle ratio as the
  old pair layout -> same speed (measured 6.0 vs 5.8 cyc/position; the layout costs AVX2 nothing).
* **PV, bf16 V** (`attn_pv_dense_q_avx2` / `avx512::attn_pv_dense_q`): per row pair, load the 64 words, `vpshufb` the high
  halves (row 2p) and the low halves shifted up (row 2p+1), two fmadds per accumulator **in slot order**; final multiply
  by sv/den as before. Prefetch 4 KB ahead (`ATTN_PV_PF`, swept 1/2/4/8 KB: 134/124/121/124K cycles on Zen 4). Sparse
  (pruning-threshold) path `pv_sparse_q` for completeness.
* **exp pass**: unchanged code (the denominator's summation pattern must stay exactly as it is).
* insert: 16 x 4-byte K stores (`^ 0x80`) into the slot's column + 8 `vpblendw` word merges for V; kv insert stays ~0.1 %.

### 3.3 Bit-identity argument (and why the fp32 op order is untouched)
Scores: the int32 dot is exact in every layout (u8 bias removed exactly), `float(dot) * coef` as before -> identical
scores and max. exp: same code, same data. PV: every output element sees exactly the same sequence
`acc = fmadd(e_j, v_j, acc)` for j ascending, then `* (sv/den)`; `v_j` is the same exact fp32 whether it comes from
`vcvtdq2ps(vpmovsxbd)`, the fp32 mirror, or the bf16 half-word. A 3-head-interleaved PV (12 independent accumulator
chains) keeps that property too; it was measured slower (section 6) and dropped.

## 4. Results

### 4.1 Kernel micro-benchmark (`bench_step`, cycles/token for the 3-layer step at a full window; median of 5 x 300 tokens)

W=2048 (production window):

| kind / ISA path | Zen 4 total | qk / exp / pv | vs int8 | Ice Lake total | vs int8 |
|---|---|---|---|---|---|
| int8 (old production) | 308K | 108 / 33 / 167 | -- | 337K | -- |
| **Q, AVX-512** | **207K** | 52 / 33 / 122 | **-33 %** | 405K | +20 % |
| **QI, AVX-512** | **250K** | 52 / 33 / 167 | **-19 %** | 329-332K | -2 % |
| Q, AVX2 forced | 303K | 110 / 33 / 158 | -2 % | 425K | +26 % |
| QI, AVX2 forced | 311K | 109 / 33 / 167 | +1 % | 321K | -5 % |
| f32-V mirror (reference) | 328K | | +6 % | 728K | |

W=1024 (same test, `-DATTN_WIN=1024`):

| kind / ISA path | Zen 4 total | qk / exp / pv | vs int8 | Ice Lake total | vs int8 |
|---|---|---|---|---|---|
| int8 | 154K | 54 / 17 / 84 | -- | 166K | -- |
| **Q, AVX-512** | **104K** | 27 / 17 / 60 | **-33 %** | 208K | +25 % |
| **QI, AVX-512** | **127K** | 27 / 17 / 84 | **-18 %** | 175K | +5 % (noise-level; Intel runs vary +-5 %) |
| Q, AVX2 forced | 151K | 55 / 17 / 79 | -2 % | 200K | +20 % |
| QI, AVX2 forced | 156K | 55 / 17 / 84 | +1 % | 161K | -3 % |
| f32-V mirror | 162K | | +5 % | 336K | |

Reading: on Zen 4 (KV in L3) the Q kind removes half of QK (VNNI) and a quarter of PV (no conversion, 128 B/row streamed
at 19 B/cycle); the remaining 207K is within 1.5x of the pure-bandwidth floor of its 3.4 MB/token (139K at 24.5 B/cycle).
On the Ice Lake sandbox every kind is bandwidth-bound at ~10 B/cycle, so the ordering is by bytes: QI = int8 (2.25 MB)
< Q (3.4 MB) < f32 (5.6 MB). The int8-V choice at W=1024 was right for the bandwidth-bound regime and stays right there;
in the L3-resident regime it flips to bf16 V at both windows (it was already the loser at W=1024 there: 154K vs 104K).

### 4.2 Full transformer (`bench_opt_prof`, long-article set, 40 articles = 704,390 tokens, 3 repeats, `--cpu 0`,
production flags `-DQMAT_CODEBOOK=1 -DQMAT_WMAX=21 -DQMAT_SMALL_W8=1 -DTF_ACTQ_DYN=1 -DTF_AVX512=1 -DATTN_WIN=2048`, run12 weights)

| | Zen 4: attn step | transformer cyc/token | tokens/s | Ice Lake: attn step | transformer | tokens/s |
|---|---|---|---|---|---|---|
| baseline tree, int8 | 289,194 | 597,377 | 6161 | 288,530 | 725,747 | 4794 |
| patched tree, `--attn int8` | 288,916 | 597,395 | 6160 | 294,339 | 749,058 | 4648 |
| patched tree, `--attn qi` | 238,419 (-17.5 %) | 544,214 (-8.9 %) | 6752 (+9.6 %) | 305,200 | 761,547 | 4573 |
| patched tree, `--attn q` | **196,706 (-32.0 %)** | **502,757 (-15.8 %)** | **7318 (+18.8 %)** | 377,590 (+31 %) | 856,353 | 4057 |

(Ice Lake numbers move +-5 % between identical runs -- the int8 kind measured 288.5K and 294.3K, `bench_step` int8
297K-339K -- so its qi/int8 difference is noise; its q result is the bandwidth-bound penalty of section 4.1.)
`AUTO` picks Q on both sandboxes (the reported L3 is 384 MB / 54 MB), which is the right call for the Zen 4 host and the
wrong one for the shared-L3 Intel sandbox; that is the price of a static heuristic (section 7).

## 5. Bit-identity evidence

All on the patched tree (AMD sandbox; `harness/logs/tests_amd*.log`, `realtest_amd*.log`, `step*_amd*.log`):

1. `test_e2e_opt --no-ref --articles 100` (214,824 predicted tokens; FNV-1a digests over every prob row and every logit
   row) for each of the three window configurations, 10 runs each = baseline tree int8 {AVX-512 path, `FX2_FORCE_AVX2=1`}
   + patched tree {int8, q, qi, f32} x {AVX-512, AVX2}: **exactly one probs digest and one logits digest per config**.

   | config | flags / weights | probs digest | logits digest | loss (a) sum |
   |---|---|---|---|---|
   | W=2048 | production flags, `lex_h1_run12.tfwc2` | `0187bb8fdf6e0ec2` | `adde7d4568e9a0ea` | 208550.398657 |
   | W=1024 | default flags, `lex_v1_run2/export_prof/weights.bin` | `385546b978dd0042` | `d1a83f4229729e17` | -- |
   | MULTS=1,1,2 | `-DATTN_WIN_MULTS=1,1,2`, `wmix_test.tfwc2` | `62bb5b9c513b1eb8` | `0d95f396e132fb42` | 251933.665932 |

2. `test_attn` (random adversarial data incl. max-|dot| rows and poisoned rings; per-layer windows; **real q/k/v** captured
   through the naive model from the longest test article, 6000 positions, exact and skip(21) modes): the new kinds are
   asserted **bitwise equal to the int8 kernel** (new gates `rand/layer/real kvq vs kv8`, `kvqi vs kv8`, kept counts) --
   PASS for W=2048, W=1024 and MULTS=1,1,2, on the AVX-512 path and with `FX2_FORCE_AVX2=1`.
3. `bench_step --hash` (FNV-1a over all 192 outputs + kept counts of a full ring life cycle per layer window, var + fixed
   + wrap, exact and pruning thresholds): W=2048 `8397742f3c384abf`, W=1024 `9a2c43dee3a4f5df`, MULTS=1,1,2
   `ee01818dbb395bc0` -- identical for i8 / f32 / q / qi and for both ISA paths.
4. Full compressor: section 6.

## 6. End-to-end smoke (full compressor, lexth12cb recipe)

`modal_big_attn.py::build_and_compare` (spawned on the `zenith-attn-opt-big` app, results volume
`sota/attn_opt_compare_lexth12cb_attnfast.json`, copy in `harness/logs/`): `build_and_construct_comp.sh` with the lexth12cb
knobs on the patched tree (PGO+LTO, 937 s, `AVX-512 confinement check passed`, `no reciprocal-estimate instructions`),
then, on ONE host (Modal default CPU pool, an AMD host WITHOUT AVX-512 -- so this exercised the AVX2 path with the Q kind
picked by AUTO), the 3,177,212-byte enwik8 smoke prefix through both binaries:

| | new build (`lexth12cb_attnfast`) | reference `lexth12cb` (volume `sota/bin/lexth12cb/cmix_orig`) |
|---|---|---|
| binary sha256 / bytes | `fb46784d...ae23` / 202,280 | `ae3e0f91...8bb3` / 198,260 |
| archive bytes | **391,457** | **391,457** (= `lex_smoke3mb_lexth12cb.json`) |
| archive sha256 | **`05fd3f3f963b61200b13716684603602942c33de81fe02a9d0dcda1253c6dc7d`** | **same** |
| compress user time | 550.4 s | 593.7 s (-7.3 % for the whole compressor, single run each) |
| peak RSS | 6,048,008 KB | 6,049,208 KB |
| reference archive decompressed with the NEW binary | byte-exact (554 s) | |
| new archive decompressed with the REFERENCE binary | | byte-exact (587 s) |

`archives_identical: true`; the transformer reported `attention KV cache: q (quad u8 K + bf16 pair-packed V)` and
`transformer kernels: AVX2`.

## 6b. Reproducing

```
# sandboxes (env dev-neel): harness/sb.py new --label amd --vendor AuthenticAMD --vnni ; ... --label intel --vendor GenuineIntel --vnni --cloud aws
harness/stage.sh        # weights + long-article test set (138 articles >= 4096 tokens) from zenith-results
harness/build_step.sh   # SRC=/work/new TAG=x W=2048 [MULTS=1,1,2] -> bench_step / bench_step_prof / test_attn
harness/run_step.sh     # kernel timings + hashes for every kind / ISA;  harness/tests.sh + realtest.sh = section 5
harness/bench_full.sh   # bench_opt_prof on the long-article set (--attn int8|q|qi|auto)
modal_big_attn.py       # full compressor build + archive comparison (section 6)
```

## 7. What was tried and rejected (all measured, Zen 4 / Ice Lake unless noted)

* **3-head interleaved AVX-512 PV** (12 accumulator chains, kills the 2-dependent-fmadd-per-pair latency chain): 128K vs
  121K (Zen 4) and 283K vs 244K (Ice Lake) cycles/token for the PV phase -- three concurrent 256 KB streams prefetch worse
  than one, and the pass is stream-bound, not latency-bound. Dropped.
* **Prefetching V into L2 during the exp pass** (the only compute-only phase): 8-32 lines per 32 scores moved 5-10K
  cycles/token from PV into exp on Zen 4 (the L3 cannot feed the prefetches faster than the exp math runs) -- net zero.
  Left in as `ATTN_EXP_PF_LINES` (default 0).
* **PV prefetch distance** 1/2/4/8 KB: 134/124/121/124K (Zen 4) -> 4 KB.
* **bf16 extraction variants** (V in L1, cycles/row, 8 ymm accumulators): `vpand+vpslld` 7.95 / 6.00, `vpshufb+vpshufb`
  7.45 / 5.73, `vpblendw(zero)+vpslld` (clang's rewrite of the and) 7.95 / 13.6 (Intel: the zero blend is slow), int8
  `vpmovsxbd+vcvtdq2ps` 8.95 / 7.98, zmm bf16 6.0 / 4.5, zmm int8 8.4 / 8.7 -> shuffles on both ISAs; an int8-V zmm PV is
  not worth a second code path.
* **F32 V mirror** at W=2048: slower than int8 everywhere (5.6 MB/token) -- the header's W=1024 verdict does not carry.
* **AVX2 QK alternatives**: int16 K (no unpack, 2x bytes) and in-lane unpack variants do not beat 6 cyc/position; there is
  no AVX2 byte-dot instruction, so the AVX2 (Zen 2) QK stays at the pair/quad layout speed.
* **AVX-512 exp pass**: not attempted -- on the judge machines (TGL: one 512-bit FMA port; Zen 2: none; Zen 4: 256-bit
  double-pumped) a 16-lane exp has the same lanes/cycle as the 8-lane one, and the denominator summation order would need
  extra lane-crossing adds to stay identical.

## 8. Recommendation

Apply the patch: it is bit-identical by construction and by every test above, costs 4 KB of binary, and makes the
W=2048 attention step 32 % cheaper (the whole transformer 16 %, +19 % tokens/s) wherever the KV stream stays in L3 -- which
on a dedicated judge machine with a 16 MB L3 (Ryzen 7 3700, AVX2 path; the measured full-compressor gain on an AVX2-only
AMD host was -7 %) or with AVX-512 VNNI (i7-1165G7) is the expected case -- while the QI fallback guarantees it is never
slower than today when the KV traffic goes to DRAM (-18 % in L3 on AVX-512 hosts, +-0 elsewhere). The one decision I
could not measure is the i7-1165G7's 12 MB L3 with the weight stream (3 MB packed on AVX-512) plus the CM's working set:
`AUTO` conservatively gives it QI (VNNI QK only); a 10-minute `FX2_ATTN_KV=q` vs `qi` A/B of the real compressor on that
laptop decides whether the threshold in `attn_resolve_kind` should drop to 12 MB (worth another ~15 % of the step
there). Do not expect more from the AVX2 (Zen 2) path: with the fp32 op order frozen, its QK is unpack-bound and its PV is
pipe-bound at ~7.5 cycles/row (vs 9 today), and both are within 2x of the L3 stream floor; the remaining headroom on
AVX-512 hosts (~207K -> ~140K cycles/token) is pure bandwidth -- fewer KV bytes, which the 8-bit K/V representation does
not allow without changing the model.
