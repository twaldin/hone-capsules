# cmix-lex-transformer — LTCB enwik9 entry package (numbers final: decode verified 2026-09-08)

Status 2026-09-08 03:45 ET: archive9 = **96,684,800 B**, **byte-exact decompression verified** (fresh sandbox, `cmp` OK,
sha256 159b8535…3744bc = enwik9, 49.05 h, 20.5 GB RAM). Published #1 = 96,996,198 B → −311,398 B. A clean-room re-decode
(bare Debian image, no mounted data, only `archive9`) also verified (HASH_OK, 2026-09-08 18:07 ET). A stronger
archive (`lext3`, 96,443,644 B, retrained weights) **verified byte-exact on 2026-09-09 18:47 ET** (cmp OK, sha256 = enwik9,
48.07 h, 26.3 GB RAM; sha256 43ef805d…f34f) and **`lext3b` (96,442,860 B, verified 2026-09-10 04:23 ET, 48.19 h, 25.7 GB; sha256
f30cdc61dfba1af7f09c84607a65e5fe5e854e259c011eea126a866b058b7d43).
**Best verified: `lext5b` = 96,178,683 B (−817,515 B = −0.84 % vs the published #1; sha256
3b398d87c6c93ea8004c06129489e6c5675a4fe1a35810e19b95b034af303f43), decode verified byte-exact 2026-09-15 13:30 ET (CMP_OK, sha256 =
enwik9, 63.6 h wall on a slow host incl. relays; compress 66.3 h wall / 65.3 h CPU on the same slow host — the lext3b-class runs took
48 h on average hosts), peak RSS 25.8 GB. lext5b = lext3b's CM (2× fxcm maps, PPMD default) + the run-#5 W=2048 transformer weights
(2,933,748 B) — submit `lext5b`.** Ready to submit as far as the numbers go; the submission itself is the user's decision.

## What it is
`cmix-lex-transformer` = Ibrahim Marcouch's **cmix-lex** (cmix/fxcm_v26 context mixing, PPMD, phda9/WRT preprocessing,
enwik9 article reordering, `payload_lex` tail transform; GPL-3) with its online LSTM byte mixer replaced by the pretrained
6M-parameter int4/int8 transformer of Vladimir Ivanov's **fx2-cmix-transformer** (GPL-3; weights `6m-q4-fp32.tfwc2`,
2,930,652 B, trained by its author on enwik9 with PPMD priors). Our contribution (documented in `work/sota/MERGE_NOTES.md`):
the 3-way merge (base fx2-cmix), the fixed 205-byte transformer vocabulary with PPMD fallback for out-of-vocabulary bytes
(the `payload_lex` side blob), the portable build (`-march=x86-64-v3 -mrecip=none`, objdump guards for AVX-512 and
reciprocal-estimate instructions, upx 5.1.1), and the measurement infrastructure. Source: `work/sota/cmix-lex-transformer`
(git commit 39d2abc on top of cmix-lex 370e698; `git diff 370e698` is exactly the merge).

Like every top entry on this board, the model weights are trained on enwik9 itself; that is allowed and they are counted:
they are inside the self-extracting archive, whose total size is the ranked number.

## Sizes (LTCB counts a self-extracting archive as compressed size with decompressor = 0)
| component | bytes |
|---|---:|
| upx'd decompressor binary (`.decomp_bin`) | 195,888 |
| compressed dictionary (`.dict.comp`, english.dic) | 100,827 |
| transformer weights (`.tfweights`, FX2TFWC2, already entropy coded) | 2,930,652 |
| cmix payload (`out.cmix`: main stream 93,410,797 + payload_lex side blob + footer) | 93,457,417 |
| header | 16 |
| **archive9** | **96,684,800** |
sha256 a6f971c3865ebb372843ddfc3b458a8f19f7703f1be732132064d6b46fe19a3d. Input: canonical enwik9, 1,000,000,000 B,
md5 e206c3450ac99950df65bf70ef61a12d, sha256 159b85351e5f76e60cbe32e04c677847a9ecba3adc79addab6f4c6c7aa3744bc.
Published #1 (fx2-cmix-transformer, Jul 2026): 96,996,198 → −311,398 B (−0.32%). Our own rebuild of fx2-cmix-transformer
from its released source produced 96,984,236 (−0.012% vs published), which calibrates the comparison.

## Build (Debian 12 container, clang-17 from apt.llvm.org, llvm-profdata-17, binutils, upx 5.1.1)
```
cd work/sota/cmix-lex-transformer
sed -i 's/^bool mmap_to_disk = true;/bool mmap_to_disk = false;/' src/models/ppmd.cpp   # RAM instead of a disk-backed PPMD heap
./build_and_construct_comp.sh          # PGO (prof_gen -> ./cmix -c prof_input/input -> llvm-profdata merge -> prof_use, -flto),
                                       # objdump checks (AVX2-only; no RCPPS/RSQRTPS estimates), upx -9 --ultra-brute,
                                       # run/cmix = cmix_orig + comp_dict + comp_order + comp_tfweights + header.dat
```
Flags: `-O3 -flto -std=c++17 -ffp-model=fast -march=x86-64-v3 -mtune=generic -mrecip=none` for the CM;
the transformer objects `-O3 -fno-math-errno` without fast-math/PGO/LTO (bit-exact IEEE). Modal build function:
`work/sota/modal_lex.py::build --variant lext` (report `zenith-results:/sota/lex_build_lext.json`).

## Compress / decompress
```
# empty dir containing enwik9 and run/cmix
./cmix -e enwik9 out.cmix        # -> archive9 (self-extracting). 44.3 h wall on Modal (x86-64 host, model string hidden by Modal, AVX2, single-threaded coder), peak RSS 20.7 GB
# empty dir containing only archive9
./archive9                       # -> enwik9_uncompressed (the verification: cmp against enwik9). ~43 h, ~7–20 GB RSS
```
Memory exceeds the Hutter Prize's 10 GB (LTCB has no limit); with `mmap_to_disk = true` it would fit in the Prize's limits at
the cost of disk I/O — not tested.

## Runtime environment for the measurements
Modal (`dev-neel`) CPU sandboxes, `cpu=(2,4)`, memory 40–56 GiB, chained across the 24 h sandbox limit with memory snapshots
(`work/sota/longrun.py`, `SNAPSHOT_TEST.md`): 5 snapshot/restore cycles during compression, output deterministic
(the same binary decodes on a different host — see the verification row). Logs: `work/sota/results/lext/`.

## Verification (fill in)
- [x] `./archive9` on a clean sandbox → `enwik9_uncompressed`, `cmp` byte-exact: **DONE 2026-09-08 03:31 ET** (job `lext_v2`: 1,000,000,000 B, sha256 159b85351e5f76e60cbe32e04c677847a9ecba3adc79addab6f4c6c7aa3744bc, md5 e206c3450ac99950df65bf70ef61a12d, exit 0, 49.05 h wall, peak RSS 20,540,680 kB, 6 snapshot/restores; `work/sota/results/lext_v2/lext_v2_enwik9.json`)
- [x] Clean-room re-decode (bare `debian_slim` image, no volumes, only `archive9`; size+md5+sha256 check): **DONE 2026-09-08 18:07 ET** — HASH_OK, 1,000,000,000 B, sha256 159b8535…3744bc, md5 e206c345…, exit 0, 48.6 h (job `lext_cr`, `work/sota/results/lext_cr/`, environment record `dec_env_before.txt`)
- [x] Encoder/decoder transformer-loss checkpoints identical (sync monitor: 582/587 matched before the sandbox was collected; `work/sota/sync_lext_v2.log`)
- [x] Cross-vendor: the enwik8 artifact (compressed on AuthenticAMD) decoded byte-exactly on a GenuineIntel/AVX-512 host (Modal cloud=aws, 2026-09-05; `work/sota/modal_intel.py`, result `zenith-results:/sota/lex_enwik8_intel_lext.json`)

## How to get it listed
LTCB is curated by Matt Mahoney (mattmahoney.net/dc/text.html): entries are submitted by e-mail with the archive (or a
link), the decompressor, and a short description; he tests or records results reported by others ("I have not verified
results submitted by others"). That step is the user's call — it is an external action under the user's name.

## Draft e-mail (ready to send once the user approves; nothing has been sent)

To: Matt Mahoney (address on mattmahoney.net/dc/text.html)
Subject: LTCB enwik9 entry: cmix-lex-transformer "lext5b" — 96,178,683 bytes (self-extracting)

Hi Matt,

I'd like to submit an enwik9 result for the Large Text Compression Benchmark.

  Program:  cmix-lex-transformer, variant lext5b — a derivative of cmix-lex (Byron Knoll / Kaido Orav) with the
            fx2-cmix-transformer-v1 int4 transformer (Orav & Knoll), retrained (W=2048 sliding window, lex_w2048 run)
            and re-tuned CM (2x fxcm context maps, default PPMD heap, layer-0 LR x0.6 / layer-1 LR x0.25, PGO+LTO).
  archive9: 96,178,683 bytes, self-extracting Linux x86-64 executable (decompressor size therefore 0 by LTCB convention)
            sha256 3b398d87c6c93ea8004c06129489e6c5675a4fe1a35810e19b95b034af303f43
  Verified: ./archive9 in a fresh container reproduces enwik9 byte-exactly
            (1,000,000,000 bytes, sha256 159b85351e5f76e60cbe32e04c677847a9ecba3adc79addab6f4c6c7aa3744bc).
  Timing:   compression 65.3 h CPU / decompression 51.1 h CPU (user time; one AMD EPYC Zen 4 core on a shared cloud host
            that was measurably slower than average — comparable lext3b-class runs took ~45 h each on average hosts);
            peak RSS 25.8 GB (compress) / 25.7 GB (decompress); ~3 GB temp disk.
  Source:   [link to the repository / tarball with build script — to be filled in by the user]
  Download: [link to archive9 — to be filled in by the user; 96 MB]

The compressor is the same code path as the decompressor (a cmix-style CM with the transformer as one model); the
transformer weights (2.93 MB int4) are embedded in the archive. Happy to provide the Makefile, the exact commit, and the
per-run logs if useful.

Thanks,
[user]

## Status update 2026-09-24 13:40 ET
- The LTCB page (changelog Sep 15/19) now lists **zmix 1.0 at 96,096,261** (Sep 14) and rata-cmix 1.0.0 at 96,849,689 (Sep 12) above
  fx2-cmix-transformer (96,996,198). Our lext5b archive (96,178,683) is therefore no longer first: it is 82,422 B behind zmix.
- **lexth11c archive9 = 95,836,613 B** (sha256 a5b9c2e3fe000a0299606da20c4915d992ff09d8fd819f8ac6a640aa0eb0d956) — 259,648 B (0.27 %) below zmix
  → first place on enwik9 once its decode verification finishes (Intel clean-room leg running since 12:57 ET, ~80–90 h; AMD partial leg in
  parallel). Compress: 55:24:11 wall on a Modal 2-vCPU Intel sandbox, peak RSS 9,765,024 kB. Package: `outputs/artifacts/hutter_lexth11c/`.
- lexth12cb (W=2048 weights) is building (13:37 ET); projected archive ≈ 95.4–95.5 M.
- For the LTCB e-mail, Matt tests self-extracting archives himself on an AMD Ryzen 7 3700 (Zen 2, no AVX-512): our AVX2 fallback path is
  exercised by the AMD partial-decode leg (no-AVX-512 host) started 13:22 ET.

### 2026-09-27 00:35 ET — lexth11c verified: LTCB first-place claim
enwik9 → archive9 **95,836,613 B** (self-extracting; comp9 3,477,137 B), clean-room decode on an independent Intel host byte-exact (CMP_OK,
59:26:45 wall, 9.6 GB peak), plus an AMD partial decode byte-identical over 292.7 MB. Current LTCB top: zmix 1.0 96,096,261 → lexth11c is
259,648 B (0.27 %) smaller. Compress 55:24 h / decode 59:27 h on Modal Intel hosts (~0.5× a Zen 4 desktop). Package: `outputs/artifacts/hutter_lexth11c/`.
Successors in flight: lexth12cb (enwik9 compress 87 %, ≈ 95.5 M expected), lexth13cb (run13 QAT 380/512).
