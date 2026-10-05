# Hutter Prize entry package — cmix-lex-transformer, 10 GB variant (`lexth1`) — DRAFT, numbers pending

Status 2026-09-10 11:30 ET: the 10 GB-RAM candidates `lexth1` (compress since Sep 9 23:17, ~24 %) and `lexth1b` (bf16-small weights,
since Sep 10 08:55) are compressing enwik9 on Modal (~45 h each, then ~45 h decode verification; lexth1 also gets a clean-room decode
on an Intel host). Everything below that is not yet measured is marked **[pending]**. Nothing has been sent; the submission
e-mail is the user's decision (rules: e-mail to Matt Mahoney, James Bowery, Marcus Hutter — see the itemized list at the end).

## Rules that bind (prize.hutter1.net/hrules.htm, hfaq.htm#addcomp, fetched 2026-09-09)
- Record L = **110,793,128** (fx2-cmix, Oct 2024). Award = 500,000 € × (L − S)/L, minimum 1 % (S ≤ 109,685,197).
- **S = size(comp9) + size(archive9)** where comp9 = the compressor executable (or zipped source+makefile) and archive9 = the
  self-extracting archive. The alternative form (comp9a + decomp9 + archive9.bhm) is scored L(C)+L(D)+L(A), so the program —
  including the transformer weights, dictionary and article order — is counted **twice** in every form (FAQ "addcomp").
- Each program: < 70,000/T hours on the judges' machines (Intel Core i7-1165G7: T≈1427 on the rules page → 49.06 h, but the LTCB
  page's footnote gives Matt's measured **T = 1499 → 46.7 h**, Linux under WSL2 with 12 GB; AMD Ryzen 7 3700, T=1310 → 53.4 h),
  **≤ 10 GB RAM**, ≤ 100 GB temp disk, 1 core, no GPU, no other inputs.
- Linux/Windows x86 executables; documented source under an OSI license before payout; ≥ 30-day public comment period;
  submissions handled in order. Queue ahead of us (none awarded yet as of Sep 9): cmix-lex (Jun 26; S = 109,825,546 = −0.87 %,
  below the 1 % minimum), cmix-obias (Jul 19; 108,469,823), fx2-cmix-transformer (Jul 24/Aug 21; **100,420,830**; 36.5 h on the
  AMD box, ~8 days on the Intel/WSL2 box — PPM heap memory-mapped to disk thrashes), forge-cmix (Jul 27/Aug 29; 109,541,185),
  fx-deepmix (Jul 28; 108,286,527). altxs (Aug 25) needs a GPU → ineligible.

## The candidate: `lexth1`
cmix-lex-transformer (see LTCB_SUBMISSION.md for the lineage) with three changes for the 10 GB rule:
1. PPMD sub-allocator heap **1,300 MB in plain RAM** (cmix-lex: 14,000 MB memory-mapped to a disk file with page eviction —
   the design that took 8 days on the judges' 12 GB box). The heap is pruned (PPMd cut-off, `RestoreModelRare`) about every
   11 % of enwik9 instead of never. Everything else in memory is unchanged: fxcm_v26 context maps (~6.1 GB), cmix models
   (~1.6 GB), transformer (<0.1 GB) → **peak RSS ≈ 9.0–9.6 GB [pending: measured at the end of the run]**, no memory mapping,
   no disk I/O beyond reading enwik9 and writing the archive → full speed on any machine.
2. Retrained transformer weights (`lex_v1_run2`, same 6M-parameter int4/int8 architecture, W = 1024, trained on enwik9 on
   4×H100: 320 pretrain + 128 QAT + 16 cooldown epochs; eval loss 0.9116 vs the authors' 0.9164).
3. Final-mixer learning-rate scales (cmix layer-0 mixers ×0.6, layer-1 ×0.25).
Binary: PGO+LTO, `-march=x86-64-v3 -mtune=generic -mrecip=none` (AVX2 baseline = both test machines; objdump guards against
AVX-512/AVX-VNNI and reciprocal-estimate instructions), upx 5.1.1. Build report `zenith-results:/sota/lex_build_lexth1.json`.

## Sizes
| component | bytes | in comp9 | in archive9 |
|---|---:|:-:|:-:|
| upx'd binary | 196,688 | ✓ | ✓ |
| compressed dictionary english.dic (`.dict.comp`) | 100,839 | ✓ | ✓ |
| compressed article order (`.new_article_order.comp`, compressor only) | 199,895 | ✓ | |
| transformer weights (`.tfweights`, FX2TFWC2) | 2,931,761 | ✓ | ✓ |
| header | 16 | ✓ | ✓ |
| cmix payload | **94,115,910** (measured 2026-09-12 02:00 ET) | | ✓ |
| **comp9 = `cmix`** | **3,429,199** | | |
| **archive9** | **97,345,214** (sha256 5242e557…7388e) | | |
| **S** | **100,774,413 = −9.04 % vs L (110,793,128)**; +353,583 B (+0.35 %) vs fx2-cmix-transformer's pending 100,420,830 | | |
Measured: payload 94,115,910 = **+0.94 % vs the 14 GB-PPMD reference lexth14 (93,239,355)** — the 1300 MB PPMD cut-off costs
≈ 877 KB, more than the +0.3–0.4 % the position-matched mid-run comparison suggested (the divergence grows in the last third of enwik9).
S = 100,774,413 qualifies against the current record (needs < 109,685,197 = 0.99 L; margin 8.1 %) but is **0.35 % behind** the pending
fx2-cmix-transformer entry (100,420,830) — if that entry is awarded first, lexth1 would not qualify (needs < 99,416,622). lexth1 is
therefore the fallback / calibration point; the candidate to submit is the run #7 variant `lexth7bw` (see HUTTER_NOTES.md).

**lexth1b (measured 2026-09-12 10:50 ET)** — identical to lexth1 except the transformer's small fp32 tensors are stored as bfloat16
(weights 2,874,900 B, comp9 3,372,578 B): payload 94,114,923 B (−987 B), archive9 **97,287,606 B**, **S = 100,660,184 = −9.15 % vs L**
(+0.24 % vs the pending fx2t), user CPU 46.05 h, peak RSS 9,658 MiB. **Round trip verified byte-exact (2026-09-14).** Best verified valid entry so far.

**lexth1c (measured 2026-09-17 04:21 ET) — current best.** lexth1b's transformer (run-2 weights, bf16-small) + the enwik9-measured
CM knobs (PPMD heap 3500 MB, fxcm context maps halved, 12 of 23 layer-0 mixers): comp9 = 3,372,336 B, payload 93,845,132 B,
archive9 = **97,017,490 B** (sha256 eceb1a5df72301df…), **S = 100,389,826 = −9.39 % vs L (110,793,128) and 31,004 B below
fx2-cmix-transformer's pending 100,420,830**. Compression 42.95 h CPU (46.5 h wall with relays) on a Modal Zen 4 core ≈ the judges'
Ryzen 7 (limit 53.4 h); peak RSS 9,537 MiB. **Decode VERIFIED 2026-09-20 00:37 ET**: `./archive9` in a fresh Modal sandbox
(12 GiB cgroup, ≈ 10 GB memcg) reproduced enwik9 byte-exactly — 1,000,000,000 B, sha256 159b85351e5f76e60cbe32e04c677847a9ecba3adc79addab6f4c6c7aa3744bc,
CMP_OK, 68.1 h wall on a slow host (RSS 9,373 MiB; the compress host did the forward pass in 42.95 h CPU — Modal hosts scatter ±25 %).
Not yet 1 % below fx2t (needs S < 99,416,622): the longer-trained transformers (run #10 → lexth10c, projected ≈ 99.5 MB; run #10
codebook QAT → lexth10cbA ≈ 99.2; run #11 → lexth11c ≈ 98.9; run #12/#13 (W=2048) → ≈ 98.3) are in flight, see HUTTER_NOTES.md ledger.

## Time and memory
Compression on Modal (AMD EPYC Zen 4 core, GB5 single-core ≈ 1361): **user 167,933 s + sys 53 s = 46.66 h CPU, wall 50.6 h**
(6 snapshot/restore relays; lexth14 on another host: 45.65 h). (lext-class: 41.0 h CPU = user+sys on one host; the live lexth1/lexth1b runs project 41–46 h — Modal hosts scatter about ±9 %). Judge-machine calibration (2026-09-10, LTCB
page): fx2-cmix-transformer measured **37.2 h (C) / 36.5 h (D) on the judges' Ryzen 7 3700** vs 33.6 h / 39.6 h user for our rebuild
of the same program on two Modal hosts → the Ryzen 7 ≈ an average Modal host → **lexth1-class ≈ 41–46 h on the Ryzen 7 (limit
53.4 h, margin 14–23 %)**. The i7-1165G7 laptop under-performs its GB5 score on memory-bound CM code (cmix-lex: 50.7 h CPU there vs
40.8 h on a 5900X, GB5 ratio only 1.10) → laptop ≈ 1.0–1.05 × the Ryzen 7 → **≈ 41–48 h vs the 46.7 h limit: marginal**. Historically
the judges accepted fx2-cmix at "99 % of the time limit" although its LTCB run on the laptop took 75 h wall (paging), i.e. the AMD box
has been the effective clock; nevertheless a faster variant (fewer transformer layers / narrower MLP: run #7) is being prepared so the
entry also fits the laptop with margin. Decompression: **verified 2026-09-14 12:56 ET — `./archive9` in a fresh 12 GiB sandbox reproduced enwik9 byte-exactly (sha256 159b8535…3744bc, CMP_OK)**, wall 58.8 h including one snapshot-restore rollback of ~3 h and 6 restores (steady rate identical to the compressor's). lexth1b's decode verified too (2026-09-14 12:12 ET, 49.3 h wall). Peak RSS **9,890,152 kB = 9,658 MiB = 10.13 GB (SI)**
(≤ 10 GB required; the judges accepted cmix-lex at 9,993 MB reading MiB as MB — 9,658 MiB is inside that reading with 335 MiB to spare). Temp disk: ~3 GB.

## Verification protocol (what we did / will do)
1. `./cmix -e enwik9 out.cmix` in a Modal CPU sandbox with a **9,800 MiB memory cgroup** (a kill = does not fit 10 GB),
   `/usr/bin/time -v` → wall, user+sys, peak RSS; archive9 sha256 recorded.
2. `./archive9` in a fresh sandbox (same cgroup) → `cmp` against enwik9 (byte-exact) + sha256, time, peak RSS.
3. Cross-vendor check: **DONE 2026-09-17 03:05 ET** — `archive9` decoded on GenuineIntel/AVX-512 Modal hosts (vendor-filtered on every snapshot restore, bare Debian image, no mounted data) → 1,000,000,000 B, sha256 159b8535…3744bc, HASH_OK; 61.9 h wall / 61.0 h CPU on those (slow, ~1.3× AMD) Intel server cores, peak RSS 9,498 MiB.

## E-mail items required by the rules (to be filled with the final numbers)
1. Direct link to archive9 (self-extracting, Linux x86-64) — [host the 96.x MB file; pending]
2. One line: `chmod +x archive9 && ./archive9` (reproduces enwik9 as `enwik9_uncompressed` in the current directory; needs ~10 GB RAM, ~3 GB temp disk)
3. Programs: cmix-lex-transformer `lexth1` (cmix-lex 370e698 + fx2-cmix-transformer-v1 cpp_infer, 10 GB variant), compressor `./cmix -e enwik9 out.cmix`
4. Sizes: comp9 = 3,429,199 B; archive9 = 97,345,214 B; S = 100,774,413
5. Times/memory: compression 46.7 h CPU (50.6 h wall), decompression ≈ the same (58.8 h wall incl. relay overhead), peak RSS 9,658 MiB, temp disk ~3 GB (Modal AMD EPYC Zen 4, GB5 ≈ 1361)
6. Test machine: Modal CPU sandbox, AMD EPYC 9654 (Zen 4) core, Debian 12, GB5 single-core 1361 (browser.geekbench.com/v5/cpu/24615364)
7. Links: executables (`cmix`, `archive9`), source tree (GPL-3; `work/sota/lext_big` + build script), documentation (this file,
   LTCB_SUBMISSION.md, work/sota/MERGE_NOTES.md, HUTTER_NOTES.md), build/usage instructions (README)

## Draft e-mail (ready to send once the decode of lexth1c is verified AND the user approves; nothing has been sent)

To: Matt Mahoney, Alexander (Alex) Rhatushnyak / Byron Knoll (judges per prize.hutter1.net), Marcus Hutter
Subject: Hutter Prize submission: cmix-lex-transformer lexth1c, S = 100,389,826 (−9.39 % vs the current record)

Dear Hutter Prize committee,

Please consider the following submission for the Hutter Prize (enwik9).

  comp9:    3,372,336 bytes (statically linked, upx-compressed Linux x86-64 executable "cmix" that includes the
            compressed dictionary, the article-order table and the int4 transformer weights)
  archive9: 97,017,490 bytes (self-extracting executable; sha256 eceb1a5df72301df…) [full hash + link to be filled in]
  S:        100,389,826 bytes  = 9.39 % below the current record (110,793,128, fx2-cmix)
  Round trip: ./archive9 → enwik9, byte-exact (sha256 159b85351e5f76e60cbe32e04c677847a9ecba3adc79addab6f4c6c7aa3744bc, verified 2026-09-20)
  Resources: compression 42.95 h CPU and decompression 68.1 h wall (slower host; same code path) on one AMD EPYC Zen 4 core (Modal cloud; our
            calibration against the published fx2-cmix-transformer times puts this at ≈ the same on a Ryzen 7 3700);
            peak RSS 9,537 MiB for both directions (< 10 GB); no GPU; temp disk ~3 GB; 1 thread.
  Lineage:  cmix-lex (Knoll/Orav) + fx2-cmix-transformer-v1 (Orav/Knoll) retrained; changes: bf16 storage of the small
            transformer tensors, PPMD heap 3500 MB in plain RAM with cut-off pruning (no memory mapping), fxcm context
            maps halved, 12 of 23 layer-0 mixers, layer-0/1 learning-rate scaling. Source + build script: [link].

The archive has also been decoded byte-exactly on GenuineIntel (AVX-512) hosts (the lexth1 variant; same code path).

Best regards,
[user]

## Status update 2026-09-24 13:40 ET — lexth11c measured, landscape changed (zmix), judging harness
- **lexth11c** (run11 W=1024 weights, lexth1c CM knobs): archive9 **95,836,613** B (sha256 a5b9c2e3fe000a0299606da20c4915d992ff09d8fd819f8ac6a640aa0eb0d956),
  comp9 **3,477,137** B (sha256 e77c9a659b31c1358368da0ef49a8683080197b9b14a11b1e6e80a43c94cb463) → **S = 99,313,750**. Compress on a Modal
  2-vCPU GenuineIntel sandbox: 55:24:11 wall, user 196,733 s, peak RSS 9,765,024 kB. Decode verification in progress: Intel clean-room leg
  (started 12:57 ET, ~80–90 h), AMD leg = 24 h partial decode on a no-AVX-512 AuthenticAMD host with the decoded stream compared byte-for-byte
  against the Intel leg every 20 min (Modal's snapshot pool is Intel-only and sandboxes cap at 24 h, so a full AMD decode is not possible there).
  Package: `outputs/artifacts/hutter_lexth11c/` (README, SHA256SUMS, archive9, comp9, logs, reports). Nothing sent.
- **New pending entries on the LTCB page (Sep 12–15):** `zmix 1.0` (James Byrne + Claude, Sep 14, "still undergoing testing"): archive9 96,096,261,
  comp9 3,216,163, **S = 99,312,424** — 1,326 B better than lexth11c. Its README states it will not meet the time limit on the Intel i7-1165G7
  (36.49 h on a Ryzen 9 5900X, T=1724 → W 62,905; LTCB lists an Intel run at 318,947 s). `rata-cmix 1.0.0` (Sep 12, not a prize candidate):
  archive 96,849,689, comp 3,369,432. If zmix is accepted, the next award needs S < 98,319,300; if it is rejected on time, fx2t's 100,420,830
  stays the reference and anything below 99,416,622 qualifies.
- **Successor lexth12cb** (run12: W=2048 on all attention layers, export validated 2026-09-24 11:51: tfwc2 2,977,661 B, e2e PASS, eval loss
  0.90139 vs run11 0.90483): build started 13:37 ET; projected S ≈ 98.9–99.0 M (clearly below zmix, ~0.6 % short of the 1 %-below-zmix bar).
  run13 (+640 pretrain epochs at W=2048) training since 11:54 ET on 4×H100 (≈ −150 KB more).
- **Judging is moving to an automated harness** (github.com/jabowery/HutterPrizeJudgingAssistant, alpha; zmix ships its manifest): the entry
  directory is `entry.env` + `archive9` + one source tar with a single top directory containing `install.sh` (root+network, dependencies only),
  `build.sh` (offline, UID 65532, source read-only at /entry, must write the declared COMPRESSOR into the cwd /work), `comp9.args` (one argument
  per line: `-e`, `enwik9`, `archive9`), `QUALIFICATION_OS` ∈ ubuntu-20.04/22.04/24.04; 16 GiB no-swap container, peak RSS ≤ 10 GiB, disk ≤ 100 GB,
  Geekbench-calibrated time limit; default runtime policy process-tree (UPX self-unpack OK). ~~TODO: install.sh/build.sh~~ → done, see the
  18:40 ET update below (`work/sota/hpja/`; note the argument file and QUALIFICATION_OS choice there supersede what this bullet says).
- Post-hoc entropy-constrained re-quantization of the weights (ECSQ, λ=0.05) was tested and rejected: −316 KB/copy but +7.5 % loss.

## Status update 2026-09-24 18:40 ET — HPJA packaging built and rehearsed (`work/sota/hpja/`, REPORT.md there)
- **Package:** `entry.env` (self-extracting, linux-x86_64, **QUALIFICATION_OS=ubuntu-22.04**, `COMPRESSOR=cmix` upx-overlay, `ARCHIVE=archive9`
  upx-overlay, `DECOMPRESSED_OUTPUT=enwik9_uncompressed`), `comp9.args` = `-e`/`enwik9`/`o` (**12 B**, counted in S), and one source tar
  `lexth11c-src.tar.gz` (5,502,159 B, sha256 1a552316…5bc6, single top dir, no symlinks; the tar itself is not scored) containing the lext_big
  tree + `models/lex_h1_run11.tfwc2` + `install.sh` (apt.llvm.org clang-17/lld-17/llvm-17 pinned over Ubuntu's own clang-17, libstdc++-12-dev,
  make/binutils/python3, UPX 5.1.1 sha256-verified) + `build.sh` (UID 65532, copies /entry → /work/src, runs the unmodified
  build_and_construct_comp.sh with the lexth11c knobs, writes /work/cmix). The compressor MUST be declared as `cmix`, not `comp9`: it opens itself
  by that literal name (self_extract.h `OpenSelf("cmix")`; the archive opens `archive9`). HPJA scores `S = rebuilt COMPRESSOR + generated ARCHIVE +
  argument bytes` off ITS OWN rebuild (harness commit 4c3deb2, 2026-09-22; QUALIFICATION_OS is now mandatory — zmix's published entry.env lacks it).
- **Rehearsal on Modal CPU (8 vCPU, ubuntu catalog images by digest, install as root → build as 65532 with /entry unwritable, offline):** three
  builds, all rc 0, peak RSS 6.0 GB (< 16 GiB build container), 16–24 min wall. comp_dict/comp_order/tfweights/header reproduce byte-for-byte in
  every run; only the UPX-packed stub depends on the qualification userspace: ubuntu-24.04 → 199,200 B (+964 B; libstdc++-13 headers/glibc 2.39
  inline ~14 KB more code; identical whether Ubuntu's or apt.llvm.org's clang-17 is used, so PGO is deterministic), **ubuntu-22.04 → 198,236 B =
  the record's size** (sha differs: 80 B drift in the unpacked ELF from glibc 2.35/libstdc++ 12.3 vs bookworm's 2.36/12.2; UPX packs both to the
  same length) → comp9 **3,477,137 B**, S unchanged at 99,313,762 incl. the 12 argument bytes (24.04 would cost ≈ 2×964 B because the archive
  embeds the stub too). Semantics: on a 3 MB enwik8 prefix every rebuilt compressor emits a stream **bit-identical** to the record comp9
  (392,251 B, sha256 bca832b6…) and round-trips byte-exactly; the harness's upx-overlay prefix detection (UPX 5.1.1) selects exactly the stub.
  Not rehearsed: the full judging_assistance.sh (Docker + Geekbench + the 55 h enwik9 run) and the `-e enwik9` path under Landlock. Nothing sent.

### 2026-09-25 04:50 ET — attention-window study (decides the Hutter-track successor of lexth11c)
- CPU profile (`work/sota/train/prof_run11_vs_run12.log`): run12's all-2048 weights cost +14.6 % transformer time and **all of it is the
  attention step** (107k → 179k cycles/token); MLP/KDA kernels are identical. So the window, not the weights, is the time cost of lexth12cb.
- Paired 8-epoch QATs from run12's checkpoint on one H100 (tail loss, nats/token; lower is better): (1,1,1) 0.93172 · (2,1,1) 0.93164 ·
  (1,1,4) 0.93026 · **(1,1,2) 0.92981** · (1,2,2) 0.92919 · all-2048 0.92802. The deepest vanilla-attention layer carries essentially the
  whole window gain; (1,1,2) keeps 52 % of it for one third of the extra attention cost (≈ +8–10 % end-to-end vs lexth11c → ≈ 15 % headroom
  on the judges' Intel laptop). W=4096 on that layer does not help without retraining.
- Plan: run13 (run12 + 640 more all-2048 pretrain epochs, ends ≈ Fri 09-26 22:00 ET) → all-2048 QAT/export = `lexth13cb` (LTCB candidate,
  S ≈ 98.8 M) → then a second QAT/export from the same pretrain at (1,1,2) = `lex_h1_run13m` (Hutter candidate; watcher
  `~/.codex/scratch/zenith/gpu/queue_watch_m.py`, expected S ≈ 99.0–99.1 M, time ≈ lexth11c + 10 %). Neither reaches the 98,319,300 needed if
  zmix is accepted; both qualify (S < 99,416,622) if zmix fails its time limit as its README predicts.
- 2026-09-25 11:15 ET — **attention KV-layout speedup adopted** (`work/sota/attn_opt/REPORT.md`, patch `work/sota/patches/attn_speed_20260925.patch`):
  quad-interleaved u8 K with an AVX-512 VNNI QK pass (+ optional bf16-packed V), bit-identical output (identical 3 MB archives, cross-decompression
  both ways, kernel digests). Measured whole-compressor time on 8 MB, same-host ABA: −1.2 % on a DRAM-bound Ice Lake host, +0.4 % (noise) on an
  AVX2-only Zen 3 host where the old layout is kept at run time; −16 % transformer time on a Zen 4 host with the KV cache resident in L3. Cost +4 KB
  of comp9. Runtime kind selection never changes the archive (FX2_ATTN_KV=q|qi|i8 for A/B on a judge machine).
- **2026-09-27 00:35 ET — lexth11c VERIFIED.** Clean-room Intel decode of `archive9` (Modal aws GenuineIntel sandbox, 12 GiB cgroup, 9 snapshot
  hops all Intel): `CMP_OK` vs enwik9 (sha256 159b8535…), 59:26:45 wall / 206,375 s user, peak RSS 9,597,984 kB, exit 0. AMD (no AVX-512)
  24 h partial leg: 292,667,392 B of the decoder stream byte-identical to the Intel leg. **S = 95,836,613 + 3,477,137 = 99,313,750** (1,326 B
  behind zmix's pending 99,312,424; below the 99,416,622 needed if zmix is rejected). LTCB: archive9 95,836,613 < zmix 96,096,261 → #1 by 259,648 B.
  Evidence: `outputs/artifacts/hutter_lexth11c/{lexth11c_enwik9.json,decode_intel/}`; HPJA package `work/sota/hpja/`. Nothing has been submitted.
