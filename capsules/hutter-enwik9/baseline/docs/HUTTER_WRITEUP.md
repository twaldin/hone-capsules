# cmix-lex-transformer / 10 GB edition — how it works (Hutter Prize documentation draft, updated 2026-09-11)

This document accompanies the Hutter Prize entry package (`HUTTER_SUBMISSION.md`) and the LTCB package
(`LTCB_SUBMISSION.md`). It explains the algorithmic ideas, what is inherited, and what is new.

## 1. Lineage (all GPL-3, all enwik9-specific by design, as the rules allow)
1. **paq8 / cmix (Byron Knoll)** — bit-level context mixing: hundreds of context models predict the next bit, a
   gated neural mixer combines them, SSE/APM stages refine, an arithmetic coder writes the bits.
2. **cmix-hp / STARLIT (Artemiy Margaritov, 2021)** — the Hutter-Prize recipe: phda9-style preprocessing
   (article reordering by similarity, WRT dictionary transform with `english.dic`), a memory-trimmed cmix, and
   a self-extracting `archive9`.
3. **fx2-cmix (Kaido Orav & Byron Knoll, 2024 winner)** — Kaido's fxcm context-mixing core (`fxcmv1.cpp`) inside
   cmix, an LSTM byte mixer, PPMD as a byte model.
4. **fx2-cmix-transformer (Vladimir Ivanov, 2026)** — the online LSTM replaced by a *pretrained* 6M-parameter
   transformer (12 layers, d=192, 9 Kimi-linear + 3 sliding-window attention layers, int4 weights / int8
   activations, AVX2 inference), trained offline on enwik9 itself with the PPMD distribution as an input; the
   weights (2.9 MB) ship inside the program and the archive.
5. **cmix-lex (Ibrahim Marcouch, 2026)** — fxcm_v26 (a later fxcm), an updated article order, the `payload_lex`
   tail transform.
6. **cmix-lex-transformer (this work)** — 3-way merge of 4 and 5 (documented in `work/sota/MERGE_NOTES.md`):
   cmix-lex's CM + the transformer byte mixer, fixed 205-byte transformer vocabulary with PPMD fallback for
   out-of-vocabulary bytes, portable AVX2 build (`-march=x86-64-v3 -mrecip=none`, objdump guards).

## 2. What is new in the 10 GB edition
- **PPMD sub-allocator bug fix** (`src/models/ppmd.cpp`). The model's 32-bit compressed pointers were defined
  relative to `UnitsStart`, a boundary the allocator moves when the heap fills. cmix-lex's 14 GB heap never fills
  on enwik9 (12.4 GB used), so the bug was latent; any smaller heap corrupted the model at the first fill
  (segfault at 9 % of enwik9). The mapping is now anchored to the initial boundary (`UnitsBase`); output is
  byte-identical for runs in which the boundary never moves.
- **Small, pruned PPMD instead of a memory-mapped 14 GB one.** With the fix, PPMd's cut-off (`RestoreModelRare`:
  frequencies halved, rare contexts dropped) works, and it turns out to *improve* the PPMD (coder output on the
  full 587 MB stream −0.30 % with a 1,300 MB heap vs 14 GB). So the whole model fits in ~9.6 GB of ordinary RAM:
  no memory mapping, no page eviction, full speed on the judges' 12 GB WSL2 machine (where the 14 GB-mmap design of
  fx2-cmix-transformer took 8 days).
- **Retrained, smaller transformer** (same architecture family; `work/sota/train/`): trained on 4×H100 on the enwik9
  stream *with the pruned PPMD's distributions as input* (the priors the decoder actually sees), longer schedule
  (pretrain 640 epochs, QAT 256, cooldown 16). Because the prize counts the weights twice and the judges' Intel
  laptop leaves little time margin, the Hutter edition uses 8 layers (6 Kimi-linear + 2 sliding-window attention)
  with d_mlp 512 and a 2048-token attention window: ≈ −1.3 MB of weights per copy, ≈ −12 % run time, for a
  +4.1 % transformer loss at equal training (20-epoch A/Bs: 10 layers +3.00 %, 8 layers +4.44 %, W=2048 −0.37 %;
  measured against the 12/768/W1024 model) [run #7, training; pending].
- **Pruned cmix mixer ensemble.** cmix-lex mixes its 590 model inputs with 23 layer-0 mixers (each selected by a
  different context) and one layer-1 mixer. Leave-one-out on enwik8 showed every single mixer is worth ≤ 0.008 %
  of the output, and the ensemble costs ≈ 22 % of the run time; keeping the 12 (or 6) most useful mixers costs
  +0.024 % (+0.070 %) on enwik8 and saves 10 % (16 %) of the time (same-host measurement). The shipped set is
  chosen from position-matched enwik9 runs [pending].
- **Memory split under the 10 GB rule.** The 13 large fxcm hash maps take 4.35 GB, the PPMD heap 1.3 GB. Position-
  matched enwik9 runs measure halving the maps to give the PPMD 3.5 GB (same RSS): PPMD +2.2 GB alone −0.24 % at
  35 % of enwik9, maps ÷2 alone +0.11 %, both −0.17 % [running; decided before the final build].
- Rejected with measurements (kept here so nobody repeats them): int3 MLP weights (+3.7 % QAT loss vs a 1.9 %
  break-even), QAT knowledge distillation from the fp32 model (no gain at α=0.5, worse at α=0.9/T=2),
  prior-logit mixing, an online LSTM beside the transformer, per-group weight scales, 5-bit weights, 4096 window.
- **Mixer learning-rate scales** (cmix layer-0 mixers ×0.6, layer-1 ×0.25) and the transformer/CM interface fixes
  inherited from the LTCB work.
- **Verification protocol**: every archive is decoded in a fresh sandbox under a 9,800 MiB memory cgroup and
  `cmp`'d against enwik9; clean-room decodes (bare OS image, only `archive9`) and Intel/AMD cross-vendor decodes.

## 3. Resource use (measured on Modal AMD EPYC Zen 4 cores; judge-machine estimates in HUTTER_SUBMISSION.md)
- Time: single-threaded, ≈ 41–46 h CPU per direction for the 12/768 model on Modal Zen 4 hosts (host scatter ±9 %;
  gdb profile: transformer 48 %, fxcm 29 %, cmix mixers 15 %, PPMD 2 %; the same-host A/B puts the mixer ensemble
  at ≈ 22 %). The 8/512/W2048 model saves ≈ 12 %, the pruned mixer set another 10–16 % → target ≈ 30–36 h.
- Memory: fxcm context maps 6.1 GB, cmix tables ~1.6 GB, PPMD heap 1.3 GB, transformer < 0.1 GB → peak ≈ 9.6 GB.
- Disk: ~3 GB of temporary files.

## 4. Reproducibility
Deterministic build from source (`build_and_construct_comp.sh`: clang-17, PGO on a fixed profile input, LTO,
`-march=x86-64-v3 -mrecip=none`, upx 5.1.1); the transformer objects are compiled without fast-math so the
probability stream is bit-exact IEEE; the same binary compresses and decompresses.
