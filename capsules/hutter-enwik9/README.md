# hutter-enwik9

L1 hone capsule for lexth11c (cmix-lex-transformer, commit `653f64e5083e430503fbe3d885def946891e7ed0`, GPL-3.0-only). It scores frozen cold-start slices of the preprocessed enwik9 stream. It is not a full Hutter Prize run. License and upstream authorship are in `NOTICE` and `baseline/LICENSE`.

This file is the operator contract. `capsule.config.json` `objective` is what the optimizer sees. Final runtime GO and provisional admission are recorded below; this is not owner approval or formal M1 admission.

## Two fresh-container phases

`evalPhases` is exactly `["encode", "decode"]`. No other tuple is valid. The merged engine (hone `9df2e43953b99bf553411a88068d76dbb88181d4`) launches two containers for one evaluator invocation:

- Encode and decode do not share a container, IPC namespace, network namespace, or `/tmp`.
- The decoder has no `/workspace` mount. The root-only handoff carries the authenticated candidate executable, the archive bytes, and scorer metadata. Protected dictionary, weights, vocabulary, and the split assets come from immutable mounts. Candidate-produced mutable state other than the archive bytes does not cross; the executable is handed off because the scorer wrote it, not because worker side state is shared.
- Both phases share one invocation charge and one `evaluatorTimeoutSec` (3600). Decode gets only the time encode left.
- Encode may emit `{"honeEvalContinue":"decode"}` or an invalid final result. A valid score from encode alone fails closed.

Live `baseline/eval.py` is sha256 `24ab9f99e2b45c4eb89ffcb844657df59dcbc9366fae91f337bb9cc9186ebfce`. Live `baseline/hone/challenge.json` is sha256 `eac2801b1cf699eb46a702f7dd04c820ee2a75113f36fe1f1bed305f5e7e5664`. Embedded baseline commit is `7027bc622068fabbe9b6afc805c37364558dd739`. `tools/calibrate.py` is sha256 `4bed3b8db59a600835b66c535d53c5d51d0e5a6432fe245b6625d99a6504deb3`. Helper source, binary, allowlist, config, and kernels are unchanged.

## Gates

Primary gate: user-mode retired instruction count, `<=` calibrated baseline `x 1.005` (`instructionMargin`). A zero counter fails. This is the deterministic "no extra work" control.

Secondary gate: CPU seconds (user+sys) within calibrated noise, `<=` baseline `x (1 + cpuMargin)`. The recorded rule is `max(0.005, 1.5 * max CPU spread over mean across splits)`. Current `cpuMargin` is `0.01904996370829111`. It is not a flat 0.5% and not `1.0`. The instruction margin stays `0.005`. Shared-host CPU time moves by more than 0.5%, so CPU seconds are the noise gate, not the primary gate.

Also required: byte-exact round trip against the asset, build, source, ISA, jobs, no stray worker processes, 9.95 GB address space. Score is bytes saved versus lexth11c minus twice the xz growth of the stripped decompressor, amortised over the slice's original-enwik9 share. `perExample` of 1.0 is lexth11c.

## Cold start

Each slice starts a fresh predictor. Dictionary pretraining only. No warm state from the rest of the 587,138,826-byte stream. A higher learning rate, or dropping long-context models that have not paid for themselves on about 1.5 MB, can raise `bytes_saved` here and make the full stream worse. A slice win is not a Hutter Prize or full-stream result. Do not admit a winner on L1 alone if the claim is full-stream transfer.

The ordering `improved` overlay (layer-0 mixer rate x1.5, layer-1 rate `0.0003` to `0.0006`) is that kind of cold-start change. The passed official check measured combined `1.0011260294841675`, with both splits' tests passing. A slice win is still not a full-stream result.

## Provisional envelope

Scope is `provisional-private-apply-none`, not a formal M1 campaign. `capsule.config.json` `budget` is the ceiling hone enforces on a run:

| dimension | ceiling |
| --- | --- |
| evaluator invocations | 40 |
| tokens | 4,000,000 |
| USD | 25 |
| wall clock | 24 h (`86400` s) |

`apply` is `none`. One invocation is one split (train or validation), both phases. The pilot accounts an external validation inside the same 40 before it spends that invocation. Hone's own meter does not see `evalrun2.sh`; the pilot does.

## Historical driver-only calibration

Historical, not the current freeze. Do not hand-edit `baseline/hone/challenge.json`. `evidence/calibration/` holds the old driver-only repeats. Those bytes are not broker records and are not the ordering check. The old official rerun is `evidence/official-rerun-20261005/`. Train r1–r3 are `valid: true` with no failed constraints. Validation r1–r3 are `valid: false` and fail only `cpu_within_budget` and `tests_pass`. Train spread `0.0063844924168794` (0.638449%) was above the previous margin `0.006110845549819979` (0.611085%). A record was accepted under `--allow-cpu-recalibration` only when failed constraints were exactly `cpu_within_budget` and `tests_pass`. Every other failure was still rejected. Raw receipt hashes in that older freeze matched these files. They are preserved as history.

```sh
nice -n 10 python3 tools/calibrate.py --allow-cpu-recalibration \
  baseline/hone/challenge.json ~/hutter/capsule-dev/live-repeats-20261004
```

Recorded result, `cpuOnlyFailuresAccepted: true`, host deckbox, CPUs 1–4, three repeats. Rule: `max(0.005, (max CPU - min CPU) / mean CPU over each split)`.

| split | mean CPU-s | mean user instructions | spread over mean |
| --- | ---: | ---: | ---: |
| train | 2712.8233333333333 | 20319744658692 | 0.0063844924168794 |
| validation | 1173.5166666666667 | 10383998531436 | 0.0029057959693798542 |

`cpuMargin` is `0.0063844924168794`. Receipt sha256:

- `base-train-r1.json` `f839c0c54538e4fe16159e70f2f6d85beb861e55220c6d3202434440bd6137e3`
- `base-train-r2.json` `e0a09766d321819c5cae359f73d58704197b2e1571d9173c51954f5678c25e48`
- `base-train-r3.json` `3bc77cd2d74ca179924a2d4a75939195c9db23fe947ccaf4c14289ecfb777263`
- `base-validation-r1.json` `690db3ed366a9594533e9b2528ac2418eedbc43609a745e8bbda513e8b2b1177`
- `base-validation-r2.json` `a8bb1ba6731f49dbac86d16b7896cc49a0a82996f6371f4d822c9c2e2745165c`
- `base-validation-r3.json` `1bf20b5f136b127b387aa6ee53ae7532fa2f41a22b96462e8d666871f464f45e`

`evidence/calibration/input.sha256` (sha256 `744d5bc7f16e3e0532a1f8adb38ad9d0b4d087da80e9e4102db544e1937ee969`) pins the inputs of those repeats: evaluator `1960622476e7f0fc04d94e4f90fdbdb799d1996c393365a5c5af9e42be19c4af`, pre-recalibration challenge `8dceba7dc409d9c7673168faa0bc278c51efa7b76c0ed33e33ed2ce4f225653e`, helper `b23cce41ffe7ecbceeb1bf7f7f7d7a5104643dfeebd791f075267a88d351345b`, allowlist `530dc39f8168ac303db318adb1453d17e1a39a84d1205ead0016ab0735bf5104`. Its path column is the deckbox path used for the run. The live challenge after recalibration is a different file; do not treat `input.sha256` as its hash. `evidence/calibration/calibration-mode-smoke.py` (sha256 `ef6dec5635f63ac3c05f476042b95b4e9ef5decf84ee0d72e5ceb2bc24f259ba`) is the mode check for default rejection of these CPU failures and explicit-flag acceptance of only that failure. No result file was saved with it.

## Current broker calibration

The current freeze is the twelve broker records in `evidence/broker-calibration/`, six per split. Their sha256 values match `baseline/hone/challenge.json` `calibration.records` exactly. `evidence/calibration/` is the older driver-only history and is not this freeze. Extraction provenance says the records are exact outputs with no score or constraint changes. Driver-only repeats were excluded. `provenance-smoke.json` records that default mode rejects CPU-only failures, all 12 matching broker records were consumed, raw output hashes were preserved, and a non-CPU failure is still rejected.

Rule: `max(0.005, 1.5 * max CPU spread over mean across splits)`. Factor `1.5` is `CPU_MARGIN_SAFETY_FACTOR` in `tools/calibrate.py`. `cpuOnlyFailuresAccepted` is true.

| split | mean CPU-s | mean user instructions | spread over mean |
| --- | ---: | ---: | ---: |
| train | 2704.2366666666667 | 20319744602870 | 0.012325104681419622 |
| validation | 1177.955 | 10383998525263 | 0.012699975805527407 |

`cpuMargin` is `0.01904996370829111`. The records were extracted under evaluator `1960622476e7f0fc04d94e4f90fdbdb799d1996c393365a5c5af9e42be19c4af` and challenge-before `e01c62de1dbfa739526397a1b370c4e2943adb01bab55f93d2073ea112b96328`. The live evaluator and challenge hashes above are the current files.

Receipt sha256:

- `base-train-r1.json` `95dec5da00d998e989bf40a503c5f3b7e899e53a1b10440df3ca123f903d2785`
- `base-train-r2.json` `a1ccde8215655caa4e580fc2452e3aeb7b04081da23040c91199093b2e980a80`
- `base-train-r3.json` `22fe217d7e7f4c9719eb7351cc727855ba8aa94cc8034ddb3b26b8db99ab0256`
- `base-train-r4.json` `0427d5f8af496f7798540bd3c27d593a86d3bab3966c7bfad0b1c0a7d9763e4f`
- `base-train-r5.json` `3703d936c84a1bca7462ce66d0932c8aad0190f486e4c92a03c3204c056869ae`
- `base-train-r6.json` `d03608a4d9213d7b0e984eed64b8a3f2d64d3a9b6a8465de08ad78556008f946`
- `base-validation-r1.json` `18e81aefad0d9dc8db9f8e95e97baf68710ed6a1f3d78256f36f78fc768a6ff0`
- `base-validation-r2.json` `1ac72be87b4a985dba8b879fa3a5d7436da03436fb28d0dae80a23be41456868`
- `base-validation-r3.json` `c5f58111fd10afc78df62f3fa671c3a9e0835a8f36afebb1b1716b24184ef166`
- `base-validation-r4.json` `fc9cd7852f2c54e61bc130dda16ef34f0e52595f1e3e248a12b45e7e0bc3d936`
- `base-validation-r5.json` `bb73851e089deab68b81b23813c9e472a11460839cce41274247b35c3a4fa45e`
- `base-validation-r6.json` `792fc5e8f988879d3c92aa819aa76e5c1f10d518fda3a76b3d8b19955a02bcb9`

`extraction-provenance.json` sha256 `40393fe7be49fd56e99535fda532e177c6471e841f66d76e9769f0fa470d81ca`. `provenance-smoke.json` sha256 `4ea36eb5d1c26dd06a7d38fdce814744d05d73548d34d78d1ac8e0bc0cc3b97b`.

## Pins, exclusions, controls

Public bytes are not committed.

- `tools/fetch_enwik9.sh` downloads `http://mattmahoney.net/dc/enwik9.zip` and checks `tools/enwik9.md5` and `tools/enwik9.sha256` (zip and unpacked enwik9).
- `tools/make_stream.sh` checks those enwik9 pins, runs `FX_PREPARE_ONLY=1` `cmix -e`, checks stream sha256 `7826ff63dedd526c119dda08e6e044be8fa8f6e89a55f3d6b1f3447cdfc5c1ce` (`tools/stream.sha256`, 587,138,826 B), then `tools/derive_slices.py`.
- `tools/derive_slices.py` refuses any other stream hash. Slices: train 2%, 31%, 87.5% (census), tail; validation 18% and 85.5% (census). Holdout-66 (stream 387,513,009–388,990,491) is recorded and not cut.
- `tools/assets.sha256` pins the six slice files. `sha256sum -c` matched `assets/` on deckbox at package prep.
- `.gitignore` excludes `assets/`, `enwik9`, `enwik9.zip`, `lexth11c-stream.bin`, `*.cmix.temp`, `diagnostics/shortcut/src/models/train-memo.h`, and `__pycache__/`. The shortcut memo is rebuilt by `tools/make_diagnostics.py` from public train slices. `diagnostics/ordering-report.json` sha256 `cc6188e80db10d7bae2a6d6487bc5183e33347889a53ff8249e47aae79b8a4f0` is present. A byte copy is `evidence/ordering-final/ordering-report.json`.

Ordering overlays (required by ordering-check): `diagnostics/{broken,naive,shortcut,improved}`. Soundness overlays, not ordering variants: `diagnostics/{negative-control,filesystem-control,direct-io-control}`. `sha256sum -c tools/diagnostics.sha256` matched on deckbox at package prep:

- broken `7966a38244dba080b5e4386b111e1008d72ba39913b5d341e5611a7e7a8aa099`
- filesystem-control `ed01f85edecce7928efa54f03815c95ae02b0476f2a9cdb892e0ee1933ca8164`
- improved `2eb299f0c121a5b771fc99fb9af81015bf1be651a530c55a9db839d900e144f9`
- naive `90cd6e6cea3e576b180b3829d1e46e08cc5a81011a73b4e86fdefde7ace0cd27`
- negative-control `8b60bde9583f6493885005ea54b6fbe3e238a5cf4754a6fbf0af64a470c65459`
- shortcut predictor `c3a1323b5f7d697e6b2b9e0eacafd05e0a0d15c18b1307f361e4e2b3445cbd99`
- direct-io-control `55424c3d60585dd55c439300af14cd4ac9a527196f1810450444be264752e828`

Broken skew is a recorded FNV-1a of launch argc (`0x5b1137e2` for `-S` argc 7, `0xab3d76f3` for `-D` argc 6), not an 8-bit page hash. Negative-control may attempt SysV `shmget` and must still encode if that call is denied. Filesystem-control makes no IPC call. Both are meant to emit a tiny archive that fails round trip when the decoder is a fresh container. Scoped smoke, not a full split and not the final evaluator: `~/hutter/capsule-dev/evalfix/out/e2e-negative-control.json` (sha256 `e33b803a7b0c8215772169f0224abb8fc38a3a5df9186f6731741cac311caaab`) and `e2e-filesystem-control.json` (sha256 `ab726c28a8350c78196ac4a5b440bf2239aba8582d54a294a090a4becd420817`). Both scored `valid: false` with `isolation_ok: true`. Those files predate this evaluator and are not admission evidence.

Image pin: `hone-hutter-enwik9@sha256:2391980839f983b29a917f1842c66522ba0fa8c9ba9b3ad6685bcb2b42152d8d`. `docker image inspect` resolved that digest in the deckbox store. Dockerfile is `image/Dockerfile`. That file is the runtime image. It does not install `libclang-17-dev` or `llvm-17-dev`. Do not rebuild or retag it to add helper headers.

## Native helper

The single copies are `baseline/hone/asm_audit.cc`, `baseline/hone/asm-audit`, and `baseline/hone/asm-allowlist.json`. There is no second copy under `tools/`. The evaluator reads `hone/asm-allowlist.json` and `hone/asm-audit` next to `eval.py`. The allowlist is immutable. The provisional envelope and cold-start rule above are unchanged.

| path | sha256 |
| --- | --- |
| `baseline/hone/asm_audit.cc` | `1e2372b1300268b209b0c6240dc9ae799cd5362d0552490f9b4d722b9e652d34` |
| `baseline/hone/asm-audit` | `b23cce41ffe7ecbceeb1bf7f7f7d7a5104643dfeebd791f075267a88d351345b` |
| `baseline/hone/asm-allowlist.json` | `530dc39f8168ac303db318adb1453d17e1a39a84d1205ead0016ab0735bf5104` |
| `baseline/eval.py` | `24ab9f99e2b45c4eb89ffcb844657df59dcbc9366fae91f337bb9cc9186ebfce` |

`tools/asm-audit/derive_asm.py` (`e818d155b193a9ea0953997784b3e89466e4b264503294c33aebc0a22a8b97fa`) and `verify_asm.py` (`1a58fcdca0bfc51878f449e056770e6d2b045238be1df08807ea7ddb0337b1c7`) are the scripts named by the allowlist. They are unchanged. Inside the proof container they read `hone/asm-audit` from `/trusted/baseline`, which must be this capsule's `baseline/`. They do not read a tools copy.

The allowlist has 4 strict entries. Derivation recorded 43 protected-makefile translation units, 4 observed GCC asm statements, and an empty problem list. A statement passes only when the SHA256 of its normalized asm string, output and input constraint strings, clobbers, and volatile flag is one of those entries. Reuse and deletion are allowed. Added or changed assembly fails. `MSAsmStmt` and `FileScopeAsmDecl` fail and are not allowlist candidates. There is no upstream kernel refactor and no rebaseline.

Each entry has `branchesSameBlockBoundaries`, `noDataDirectives`, and `noForbiddenMnemonics` true. Baseline-identical numeric local labels, local branches, and `.p2align` are allowed only because every branch target was verified inside that same block at an assembled instruction boundary. Forbidden reciprocal mnemonics and `.byte`/`.inst` are not allowlisted. `entriesWithoutEmittedBlock` is empty. Emitted block counts: xgetbv 1, attn FMA loop 1, rdtsc 5, cpuid 3.

| sha256 | site | asm |
| --- | --- | --- |
| `1ee7199199f577b79a2c6a40e60916951e3afedc34d34a4a46d2829c23869b83` | `cpp_infer/src/opt/qmat_cpu.cpp:25` | volatile `xgetbv`, outputs `=a`/`=d`, input `c` |
| `4fa9504da56684a2e34ab82043295d981e32eb1f58aed74008fa88c06de2d33f` | `cpp_infer/src/opt/attn.cpp:304` | volatile `pv_dense_i8` FMA loop |
| `5fcf71e75ed00bfa45c47291c660cc72d50ff21d5b5d48a7d3c52912a33147e4` | `cpp_infer/src/opt/kda.cpp:43` | volatile `lfence` / `rdtsc`, clobber `memory` |
| `6c7a72c88bacf2d35530970fd80485087971060312345c109c94a3c4a9b2ced3` | `cpp_infer/src/opt/qmat_cpu.cpp:28` | `xchgq` / `cpuid` / `xchgq`, not volatile |

Assembled proof for `attn.cpp`, `kda.cpp`, and `qmat_cpu.cpp`: instrumented object code matched both `llvm-mc` and the real protected object code. That verifies the baseline statements. It does not permit new assembly.

### Evidence outside baseline

These records have no host paths. Source references are protected baseline paths (`cpp_infer/src/opt/*.cpp`, `src/coder/*.cpp`, and the other makefile units). Hashes match the protected helper, evaluator, and allowlist above.

| path | sha256 |
| --- | --- |
| `evidence/asm-verification.json` | `9f73ee1e7bd40494773d8de00ac1508ced561fdc62018340139b5c4e82c2c6fc` |
| `evidence/helper-derivation.json` | `787d95907821bf947c92b9e3ab02f7438d3db1403b3bd4e5b18fcbe9d45f20b2` |
| `evidence/ast-native-controls.json` | `d9ded9deec1d06ff619220eb1fd36a7858516245f84220e8292361a815f89989` |
| `evidence/raw-hit-classification.json` | `7f845588b9972960c6062f21ee43834948e8141f49997e3f5f0fac01a721666c` |
| `evidence/gate-proof.txt` | `ae637313afc6699d40de7dd796ab9f2cb5516f3e4bfd76654fae98d815d76f69` |

`evidence/make-plan.txt` and `evidence/asm-proof/` are the files named by the allowlist `evidence.files` map. The allowlist `evidence.root` remains the derivation workspace `~/hutter/capsule-dev/evalfix/asm-allowlist`. These copies are byte-identical to that map. Do not edit them; that would break `530dc39f…`.

### Operator rebuild

Dev headers exist only in a temporary image. The runtime image digest above stays unchanged. The script copies `baseline/hone/asm_audit.cc` into a temporary context, builds `hutter-asm-tool-build:1`, compares the result to `baseline/hone/asm-audit`, and deletes the context. It refuses if a tools-side source, binary, or allowlist copy exists. It does not retag `hone-hutter-enwik9` and does not install a second binary.

Do not run this on CPUs 5/8/10/17/20/22. The script refuses unless `HUTTER_ASM_REBUILD=1`.

```sh
cd ~/hutter/hone-capsules
HUTTER_ASM_REBUILD=1 nice -n 10 capsules/hutter-enwik9/tools/asm-audit/rebuild.sh
```

Expected hash, both the rebuild and `baseline/hone/asm-audit`: `b23cce41ffe7ecbceeb1bf7f7f7d7a5104643dfeebd791f075267a88d351345b`.

`tools/asm-audit/Dockerfile` starts `FROM` the runtime digest, installs `libclang-17-dev` and `llvm-17-dev`, and compiles with the producing command:

```
clang++-17 -O2 -std=c++17 -I/usr/lib/llvm-17/include /tmp/asm_audit.cc /usr/lib/llvm-17/lib/libclang-cpp.so.17 -L/usr/lib/llvm-17/lib -lLLVM-17 -o /tmp/asm-audit
```

The producing local tag was `hutter-asm-base:locked`, which is that same digest. The evaluator passes `-resource-dir=/usr/lib/llvm-17/lib/clang/17`.

The binary's dynamic dependencies, already in the runtime image, are `libclang-cpp.so.17` (`/usr/lib/llvm-17/lib/`, package `libclang-cpp17`) and `libLLVM-17.so.1` (`/usr/lib/x86_64-linux-gnu/`, package `libllvm17`). Their copyright files are Apache-2.0 WITH LLVM-exception. This capsule does not relicense them. The helper is distributed under GPL-3.0-only with the rest of the harness. See `NOTICE`.

## ISA boundary

No raw byte scan is enforced.

The native visitor walks every protected-makefile translation unit, including template instantiations and capsule macro expansions. System-header definitions are skipped. It rejects reciprocal-estimate references, target and optimize attributes, and object or integer to function-pointer casts. The protected build still uses `-mrecip=none` and `-march=x86-64-v3`. Linear objdump of executable sections and runtime W^X remain. Linear disassembly rejects `RCP*`/`RSQRT*` anywhere, and EVEX/zmm/mask code outside the two dispatched qmat `*_avx512` objects.

Residual general binary limitation, all targets: there is no sound static proof that every indirect jump-table or type-punned target in the stripped ELF is an instruction boundary. That residual is general. No raw rejection closes it. Residual risk is type-punning and undefined C++ control flow. `evidence/raw-hit-classification.json` is diagnostic only, never enforcement: baseline binary `2ae0877cb1c962094215206683e5ee59b7361e118d2b6ba76f98646fc8d451f2` has 69 broad EVEX raw hits and 0 instruction-boundary hits.

Native `ev.ast_source_gate` controls used a relative `control.cpp` and the same plan flags (`-std=c++17 -march=x86-64-v3 -mrecip=none`). Rejected: `_mm_rcp_ps`, a capsule macro expanding to it, an instantiated reciprocal template, unallowlisted inline asm, an integer-to-function-pointer cast, a `target` attribute, and file-scope asm. `optimize("O3")` and MS asm (`-fms-extensions`) were rejected because the helper exited non-zero. A safe function reference passed. Unexecuted baseline-identical `xgetbv` (outputs `=a`/`=d`, input `c`, volatile) passed. The same body with `xgetbv` changed to `nop`, or input constraint `c` changed to `r`, was rejected. Record: `evidence/ast-native-controls.json` (`notAdmission: true`). Source-spec SOURCE_PASS is not a runtime GO.

## Official ordering and scaffold

The official ordering check and scaffold passed. Evidence copies, exact bytes, are in `evidence/ordering-final/`.

| file | sha256 |
| --- | --- |
| `ordering-raw.json` | `8f8c6fe06d67567b63e0f212f2da6d581f37e4f3efe1e5b73dba75985799a6a3` |
| `ordering-partial.json` | `02d511ee979fa30edd13437f9110cbb36ea0379218478dabc7d811d8abdf5d21` |
| `ordering.log` | `c0ce7a0ab971f2338ce6e543022a530a9b7843d11678e7b707aef550cf22b073` |
| `scaffold.log` | `6f96a077979a74cce19facdaede9af03824c657a6e27293e924c6bce7fe3ca25` |
| `ordering-report.json` | `cc6188e80db10d7bae2a6d6487bc5183e33347889a53ff8249e47aae79b8a4f0` |
| `manifest.json` | `571b80c2997cb49f932a57e95aeeee286eee5e136d3be8c2f03d36dbd7fd8ed6` |

Fourteen logical evaluations, 28 physical containers, wall 12947.6 s. All six baseline measurements, seeds 0–2 train and validation, were `valid: true` with no failed constraints. Stability aggregates were `[1, 1, 1]`, spread 0, band 0.15. Scores: baseline combined `1`; naive combined `0.7553105054627377`; improved combined `1.0011260294841675`; shortcut validation `0.9869409257324708`. Broken scored 0, as required. Scaffold wrote capsule id `cap_ebf0f311bc34` and `manifest.json`. Baseline commit `7027bc622068fabbe9b6afc805c37364558dd739`.

Earlier copies remain for provenance: `evidence/official-rerun-20261005/` (seed provenance; all six baseline measurements passed, check failed only because the then naive score was above 1) and `evidence/official-cpu-flake-20261005/` (validation CPU flake at 1184.41 and 1182.44 against budget 1181.01). `evidence/naive-quantized-20261005/` is the quantized naive run whose diag sha256 is `90cd6e6cea3e576b180b3829d1e46e08cc5a81011a73b4e86fdefde7ace0cd27` and whose combined score is the `0.7553105054627377` above.

## Admission

Final runtime **GO** from Grok (`xai-oauth/grok-4.7`) and a fresh reviewer (`openai-codex/gpt-6.1-sol`) covers the exact evaluator, helper, allowlist, challenge, manifest, official ordering and final-hash controls. Reports and verified launch metadata are in `evidence/admission/`. Both reviewed this README at SHA256 `9267b1a309407f57e66590a486e5a4d93d3a7a76ad67020b62aef3cfc160cbff`; subsequent edits only record admission and correct diagnostic/provenance documentation, not the frozen runtime contract.

`evidence/controls-final/summary.json` SHA256 is `a93281ce462d8152d469500e63867f8bac5dbb0ff026c93e71f6212721622123`. Negative/filesystem controls reject at the AST source gate on both splits; downstream gates are not run. Direct-I/O reaches fresh decode and fails all six round trips plus instructions (train archives 277/277/277/278 B; validation 277/276 B), while isolation/reference/source/build/ISA/jobs/CPU/no-stray pass. These final-hash full-split records, not the historical smoke, are admission evidence.

Provisional receipts were appended with `appendAdmissionReceipt` on 2026-10-05. Capsule digest: `sha256:9e000e87d87778b0c23aaec59ffa40fcc3e751b538464acd6f45f5a2b01cc871`.

- Gate 1: `sha256:a916168b5dec4f417cdb8dd3ab65d92cd01ed8e28e0863f2213872de0ed40e55`.
- Gate 2: `sha256:dcf6359cf544785feedafcf49c652ed91ab64cddc12d9efb755b79148e7ab747`.

`evidence/admission/receipts.json` is the receipt companion. Final reviewer is **agent:omp-main**, delegated by **owner:tim**, scope **provisional-private-apply-none**, budget **$25**. No owner:tim approval is recorded. The fresh secondary reviewer shares the author's OpenAI family: that exception was explicitly authorized after Opus refused review, with Grok providing the other family. This does not authorize formal M1; Tim reviews the capsule before that. Probes stay blind and `apply:none`; operator-only exploratory findings are never supplied to mutation context.
