# Reproducing the Hutter Prize candidates (cmix-lex-transformer, `lext_big` tree)

Status: written 2026-09-20 01:45 ET while the candidates train. Every number here is a build fact (knobs, toolchain, commands);
result sizes/times live in `outputs/HUTTER_SUBMISSION.md` and `work/sota/HUTTER_NOTES.md` (candidate ledger).

## Source
- `work/sota/lext_big/` — cmix-lex (Byron Knoll / Kaido Orav lineage, GPL-3) merged with fx2-cmix-transformer-v1's `cpp_infer`
  inference engine (`lext_big/cpp_infer/src`, kept byte-identical with `work/sota/fx2-cmix-transformer-v1/cpp_infer/src`).
  Our changes are documented in `lext_big/changes.md`, `work/sota/MERGE_NOTES.md`, `cpp_infer/SPEC.md` (§2a dynamic activation
  scales, §2b AVX-512 dispatch, §3.5 per-layer windows, §4 weights container incl. FX2TFWC3), `cpp_infer/src/opt/OPTLOG.md`.
- Training code (PyTorch): `work/sota/fx2-cmix-transformer-v1/pysrc`, `training_recipes`, `work/sota/train/train_lex.py`
  (A/B flags: `--wcodebook … --wbits-small 8 --actq-dynamic-mm --window 2048 --window-mults …`), Modal drivers `work/sota/train/modal_train.py`
  (`launch`, `export`), data dumps `lex_h1` (PPMD-3500 priors of the Hutter CM config over the reordered/WRT'd enwik9 stream).
- Data: enwik9 only. The dictionary `english.dic`, the article order `src/readalike_prepr/data/new_article_order` and the
  transformer weights are embedded in `comp9`; `archive9` embeds everything except the article order (the decoder re-sorts pages
  by their `<id>`).

## Toolchain (Modal image `zenith-lex-big`, Debian 12)
clang++-17 / lld-17 / llvm-profdata-17 (apt.llvm.org), `upx 5.1.1` (github release, LZMA `--ultra-brute`), GNU make, binutils
(objdump for the ISA gates). Build flags: `-O3` (hot CM objects `CM_OPT=-O2` since 2026-09-19), `-march=x86-64-v3 -mtune=generic
-mrecip=none`, PGO (`prof_gen` on `prof_input/input`, then `prof_use`) + LTO; the two AVX-512 translation units are compiled with
`-march=x86-64-v3 -mavx512f -mavx512bw -mavx512vl -mavx512vnni` outside PGO/LTO and the `check_avx512_confined` gate proves every EVEX
instruction of the final binary lies inside them (the AVX2 baseline is unchanged; `FX2_FORCE_AVX2=1` disables the dispatch at run time).

## One build = `build_and_construct_comp.sh` with knob environment variables
```
cd work/sota/lext_big
FORCE_SELFEXTRACT_REBUILD=1 <KNOBS> bash ./build_and_construct_comp.sh     # -> run/cmix (= comp9), run/cmix_orig, run/comp_*
./run/cmix -e enwik9 archive9                                              # compress (writes the self-extracting archive9)
./archive9                                                                  # decompress -> enwik9_uncompressed (byte-exact)
```
`work/sota/modal_big.py::build --variant <name>` runs exactly this inside the image (report `zenith-results:/sota/lex_build_<name>.json`,
binary `zenith-results:/sota/bin/<name>/cmix`); `::smoke` does a 3 MB round trip (`/sota/lex_smoke3mb_<name>.json`).

Knobs common to every Hutter candidate (the "lexth1c CM config", enwik9-measured):
| knob | value | meaning |
|---|---|---|
| `PPMD_MEM_MB` | 3500 | PPMd sub-allocator heap in plain RAM (no mmap), cut-off pruning when full |
| `FXCM_CM_DIV` | 2 | fxcm_v26 context maps halved (fits the 10 GB rule together with the heap) |
| `CMIX_L0_MIXER_MASK` | 0x42e72du | 12 of the 23 cmix layer-0 mixers kept (−10 % time, +0.05 % payload); reserve: 0x024528 = keep6 |
| `CMIX_L0_LR_SCALE` / `CMIX_L1_LR_SCALE` | 0.6 / 0.25 | final-mixer learning-rate scales |
| `CM_OPT` | -O2 | hot CM objects at -O2 (−6.4 KB binary, no measurable time cost) |
| `TF_AVX512` | 1 | AVX-512 VNNI matmul kernels, cpuid-dispatched, bit-identical output |
| `TFWEIGHTS` | path to the `.tfwc2` (FX2TFWC3 container since 2026-09-19) | transformer weights |

Transformer-recipe knobs (must match the checkpoint's export flags or the loader refuses the weights):
| knob | export flag | candidates |
|---|---|---|
| `TF_CODEBOOK=1` (`TF_WMAX` 21) | `--codebook` | lexth10cbA, lexth11c, lexth12cb, lexth13cb |
| `TF_SMALL_W8=1` | `--wbits-small 8` | same |
| `TF_ACTQ_DYN=1` | `--actq-dynamic-mm` | lexth11c, lexth12cb, lexth13cb |
| `TF_WINDOW=2048` | `--window 2048` | lexth12cb, lexth13cb (all three vanilla-attention layers) |
| `TF_WINDOW_MULTS=1,1,2` | `--window-mults 1,1,2` | (path validated, not used by a candidate) |
| `TF_NL` / `TF_DMLP` | `--n-layers` / `--d-mlp` | 12 / 768 for every candidate (defaults) |

The exact knob dictionaries are `VARIANTS[...]` in `work/sota/modal_big.py`; the longrun job descriptions (`JOBS[...]` in
`work/sota/longrun.py`, field `tool`) are the one-line summaries used in the reports.

## Transformer training → weights file
1. Pretrain (4×H100, flash-attention, Muon): `modal_train.py::launch --tag <tag> --name lex_h1 --phases pretrain --gpus 4 --extra
   "--n-layers 12 --d-mlp 768 --window 1024|2048 [--load-from <prev>/6m.tch --pretrain-epochs N --lr 3e-4 --warm-mult 1 --warmup-epochs 0]"`.
2. QAT + cooldown (8×H100): `--phases qat,cooldown --qat-epochs 512 --gpus 8 --extra "<arch> --wcodebook --codebook-max 5.25
   --codebook-grid 0.25 --codebook-max-int 21 --codebook-lr-mult 0 --codebook-snap --codebook-snap-frac 0.9 --wbits-small 8 --actq-dynamic-mm"`.
3. Export + gates (1 GPU): `modal_train.py::export --tag <tag> --name lex_h1 --window W --n-layers 12 --d-mlp 768 --bf16-small --codebook
   --wbits-small 8 --actq-dynamic-mm --tfwc3` → `runs/<tag>/export/<tag>.tfwc2`; gates: `test_weights_compressed` (bit-exact decode of the
   container), `test_e2e_opt` (C++ engine vs PyTorch on 1024 reference articles, |Δloss| < 0.1 %), Python `eval_loss.py` on 10 % of the
   stream. `test_components` is a per-component tolerance report (informational).

## Verification protocol for a candidate (what the pipelines do automatically)
1. 3 MB smoke round trip, byte-exact (`modal_big.py::smoke`).
2. enwik9 compress in a Modal CPU sandbox under a **12 GiB memcg** (`work/sota/longrun.py`, 8-h snapshot/restore legs, `/usr/bin/time -v`),
   archive9 sha256 recorded; then decode in a fresh sandbox → `cmp` against enwik9 + sha256 (`CMP_OK`).
3. Clean-room decode on a GenuineIntel host (bare Debian image, only archive9; `work/sota/intel_after.sh <job>` → job `<job>_intel`).
4. Same-host speed comparison against lexth1c (`work/sota/modal_speed_seq.py`), cross-vendor archive identity for the AVX-512 build
   (`work/sota/modal_xvendor.py`).
