# hone-capsules

These are the public task packages for [Hone](https://github.com/twaldin/hone), my experimental engine for improving code against a fixed, measurable objective. Each **capsule** pins a baseline, an evaluator, the data the optimizer may and may not see, an execution image and a budget, and a content-addressed `manifest.json` binds all of it together. Hone's optimizer proposes changes to a capsule's mutable files; Hone's trusted side runs the evaluator and decides whether anything got better.

The capsules used to live inside the Hone repository. In October 2026 I split them out so the engine stays small and its history stays about the engine. The bytes of every capsule directory are the same as in that tree, so capsule IDs and manifest digests did not change. This repository starts with a fresh history at the import; the earlier history is archived privately.

## What's here

**Development cohort.** The sixteen tasks the recursive (M2) campaigns trained and selected on:

| Capsule | Objective |
| --- | --- |
| `agentelo-scoring` | Classify no-diff attempts versus infrastructure junk, apply scoring precedence and deduplicate submissions in Agentelo's `core/scoring.js`. |
| `biome-parser-formatter` | Faster JavaScript, TypeScript and CSS parsing and formatting in Biome. |
| `bun-module-loader` | Faster module resolution in Bun on frozen ESM and TypeScript import graphs. |
| `esbuild-bundling` | Faster esbuild bundling of frozen TS, JSX, ESM and CommonJS graphs, with output and sourcemaps unchanged. |
| `floyd-block-search-render` | Cheaper Block Search rendering in Floyd with the exact command stream preserved. |
| `flt-dag-orphan-recovery` | Repair orphan retirement and spawn-failure stalls in FLT's workflow DAG. |
| `flt-text-input` | Correct TextInput editing state in FLT across Unicode, escape and state cases. |
| `harness-session-log-normalization` | Recover model, usage, cost and completion state from six agent CLIs' transcripts. |
| `hone-optimizer-mode-canonicalization` | Canonicalize file modes in Hone's optimizer source snapshots. |
| `monoagent-context-retention` | Keep the most useful structured records under Monoagent's context-window limit. |
| `orjson-serialization` | Faster orjson dumps and loads across dataclass, datetime, NumPy, Unicode and nested corpora. |
| `ripgrep-search` | Lower ripgrep latency across 28 literal, regex, Unicode, ignore-file and many-file cases. |
| `simdjson-parse` | Faster simdjson DOM and On-Demand parsing with event hashes and errors unchanged. |
| `simdutf-validate` | Faster simdutf UTF-8 validation and UTF-8 to UTF-16LE transcoding. |
| `tradeup-profit` | Higher fixed-capital expected profit from the trade-up candidate generation and selection policy. |
| `uv-resolver` | Faster cold and warm uv dependency resolution against a frozen offline index. |

**Calibration.** `calibration-bitset-rank`, `calibration-byte-escape`, `calibration-interval-merge` and `calibration-varint-decode` are small Python-stdlib latency tasks kept out of the cohort on purpose. They share the image in `calibration-runtime/`, and `m2-calibration-selection.json` is the 80-cell ladder the August 2026 calibration ran over them.

**Terminal source references.** `brotli-codec`, `duckdb-tpch`, `floyd-custom-scoreboard-render`, `flt-workflow-parser`, `harness-pi-readiness`, `mimalloc-allocator`, `node-url`, `quickjs-interpreter`, `sqlite-speedtest1`, `tradeup-query-latency` and `tree-sitter-parse` are the final test set of the recursive experiment. Each directory has the task source, the evaluator and a `manifest.reference.json` recording the original contract. Their inputs and answers are private so they stay a real test, which means these directories do not run on their own. Don't rename a reference manifest to `manifest.json` or mix the public baseline with other files to make one run.

**Other.**

- `seeded-astar`: a grid A* speedup, the first capsule written for the TypeScript rewrite. It is outside the cohort and is the default target of the ordering check.
- `leduc-cfr-exploitability/artifacts/`: two improved Leduc hold'em CFR+ solvers, under the upstream [`davidvayn/pokersolver`](https://github.com/davidvayn/pokersolver) MIT notice. `fixed-compute-best/` is the fixed-compute winner: it keeps the same number of sweeps and weights the average policy by iteration³ below 100 iterations (0.9677× baseline runtime, holdout q 0.7733 → 0.7899). `best/` is the earlier candidate that tripled sweeps below 100 iterations; it bought its gain with extra compute and does not meet the fixed-compute rule. The capsule itself and its sealed cases are private.
- `Dockerfile.task`: the generic `hone-task` image used by the early capsules.
- `provenance/source-manifests/`: the historical manifest versions that Hone's task contracts (`capsule-kit/contracts/` in the engine) cite as their source identities, exported from the pre-split history with the commit and path each came from.
- `test/`: integration tests that run Hone's trusted code against these capsules.

## Cloning

Several capsules embed a Git object store under `baseline/.gitdir`, and some upstream baselines carry their own `.gitattributes`. Those nested files take precedence over this repository's, so a plain clone can normalize binary objects and break the manifest digests. Install the rules at Git's highest local precedence before checking out:

```sh
git clone --no-checkout https://github.com/twaldin/hone-capsules.git
cd hone-capsules
git show HEAD:.gitattributes > .git/info/attributes
git checkout main
```

Keep those rules when you pull. The checkout is a few gigabytes because several baselines are complete upstream source trees.

## Running a capsule with Hone

Clone Hone next to this repository (from the directory that contains `hone-capsules`, not from inside it) and install it:

```sh
cd ..   # if you are inside hone-capsules
git clone https://github.com/twaldin/hone.git
cd hone
pnpm install --frozen-lockfile
```

Hone finds capsules through `--capsules-root <dir>`, then `HONE_CAPSULES_ROOT`, then `./capsules` under the directory it runs from. Point it at this repository's `capsules/` directory:

```sh
export HONE_CAPSULES_ROOT=../hone-capsules/capsules
node trusted/cli/bin/hone.js run ../hone-capsules/capsules/seeded-astar --headless
node trusted/cli/bin/hone.js best
node trusted/cli/bin/hone.js diff --stat

# or per command:
node trusted/cli/bin/hone.js --capsules-root ../hone-capsules/capsules \
  calibration --campaign ../hone-capsules/capsules/m2-calibration-selection.json --headless --dry-structure
```

A real run also needs Docker on a Linux host, the capsule's exact pinned image, an admission receipt in Hone's local `.hone-cas`, and a model endpoint set through `HONE_UPSTREAM_BASE_URL`. There is no public command yet that builds the image and admission for you; Hone's [Getting started](https://github.com/twaldin/hone/blob/main/docs/getting-started.md) and [Capsules](https://github.com/twaldin/hone/blob/main/docs/capsules.md) docs describe what each step checks. Run state stays in the Hone directory, never in this checkout.

To build or re-check a capsule, use Hone's `capsule-kit` (`scaffold` writes `manifest.json`; `ordering-check` runs the naive/improved/broken/shortcut diagnostics through the broker).

## Integration tests

`test/` checks the real capsules against Hone's trusted code: seeded A* evaluator security and validity, its ordering check, scaffold reproducing its committed manifest byte for byte, the task contracts against the capsule tree and `provenance/`, and an opt-in Linux proof that the FLT evaluator runs under isolated user IDs. There is no `package.json` here; the tests use Hone's installed vitest and resolve `@hone/*` from a Hone checkout:

```sh
export HONE_ROOT=/path/to/hone
HONE_CAPSULES_ROOT=$PWD/capsules \
  "$HONE_ROOT/node_modules/.bin/vitest" run --config vitest.config.ts --maxWorkers=1 --minWorkers=1
```

The seeded A* ordering and container-evaluator tests need Docker and the pinned image. The ordering check measures real container wall-clock time with a strict 15% spread bound, so test files run one at a time; run them on a quiet host and don't run another suite, build or CPU-heavy job alongside. A spread failure is a failed check, not a reason to retry until green or loosen the bound. The FLT isolation proof needs Linux, Docker, the reserved UID pool and `HONE_REAL_EVAL_UID_PROOF=1`.

## Licenses

Hone-authored and owner-approved derived material is MIT ([LICENSE](LICENSE)); [PUBLICATION.md](PUBLICATION.md) records which derived tasks are released and what stays private. Capsules built on upstream projects keep those projects' licenses and notices; [LICENSES.md](LICENSES.md) lists where each one is.
