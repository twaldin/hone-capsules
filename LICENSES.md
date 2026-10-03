# Licenses by capsule

Hone-authored and owner-approved derived material in this repository is MIT ([LICENSE](LICENSE), see [PUBLICATION.md](PUBLICATION.md)). Capsules built on an upstream project keep that project's license and notices next to its source. License files sit inside the capsule directories because those bytes are part of each capsule's identity; nothing was added or moved to make this table.

## Upstream projects

| Capsule | Upstream | License files |
| --- | --- | --- |
| `biome-parser-formatter` | Biome | `baseline/LICENSES/` (MIT and Apache-2.0, plus per-crate and Prettier notices) |
| `brotli-codec` | Brotli | `baseline/LICENSE` |
| `bun-module-loader` | Bun | `baseline/LICENSE.md` (Bun is MIT; the file lists bundled components such as LGPL JavaScriptCore) |
| `duckdb-tpch` | DuckDB | `baseline/LICENSE` |
| `esbuild-bundling` | esbuild | `baseline/LICENSE.md` |
| `mimalloc-allocator` | mimalloc | `baseline/LICENSE` |
| `node-url` | Node.js | `baseline/LICENSE`, `image-source/LICENSE` |
| `orjson-serialization` | orjson | `baseline/LICENSE-APACHE`, `baseline/LICENSE-MIT`, `baseline/LICENSE-MPL-2.0` |
| `quickjs-interpreter` | QuickJS | `baseline/LICENSE` |
| `ripgrep-search` | ripgrep | `baseline/COPYING`, `baseline/LICENSE-MIT`, `baseline/UNLICENSE` |
| `simdjson-parse` | simdjson | `baseline/LICENSE`, `baseline/LICENSE-MIT` |
| `simdutf-validate` | simdutf | `baseline/LICENSE-APACHE`, `baseline/LICENSE-MIT` |
| `sqlite-speedtest1` | SQLite | `baseline/LICENSE.md` (public domain) |
| `tree-sitter-parse` | tree-sitter | `baseline/LICENSE` |
| `uv-resolver` | uv | `baseline/LICENSE-APACHE`, `baseline/LICENSE-MIT`, `source/LICENSE-APACHE`, `source/LICENSE-MIT` |
| `leduc-cfr-exploitability` | [`davidvayn/pokersolver`](https://github.com/davidvayn/pokersolver) | `artifacts/best/LICENSE`, `artifacts/fixed-compute-best/LICENSE` (MIT) |

Vendored toolchains, crates, wheels and image sources under these capsules (`toolchain/`, `image/`, `image-source/`, `source/`, `.candidate-*/`) carry their own notices in place.

## Hone-authored and derived tasks

MIT, under this repository's [LICENSE](LICENSE) unless the capsule carries its own MIT notice:

| Capsule | Own notice |
| --- | --- |
| `agentelo-scoring` | `baseline/LICENSE` |
| `flt-text-input` | `LICENSE` |
| `flt-workflow-parser` | `baseline/LICENSE` |
| `calibration-bitset-rank`, `calibration-byte-escape`, `calibration-interval-merge`, `calibration-varint-decode`, `calibration-runtime` | none |
| `floyd-block-search-render`, `floyd-custom-scoreboard-render` | none |
| `flt-dag-orphan-recovery`, `harness-pi-readiness`, `harness-session-log-normalization`, `hone-optimizer-mode-canonicalization` | none |
| `monoagent-context-retention`, `seeded-astar`, `tradeup-profit`, `tradeup-query-latency` | none |
