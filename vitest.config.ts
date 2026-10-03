// Capsule integration tests run hone's trusted code from a separate engine
// checkout (HONE_ROOT) against the capsules in this repository. Plain object
// config: this repository has no node_modules of its own; run it with the
// engine's vitest (see "Integration tests" in README.md).
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const honeRoot = process.env["HONE_ROOT"];
if (honeRoot === undefined || honeRoot === "") {
  throw new Error("HONE_ROOT must name the hone engine checkout (with pnpm install done)");
}
const HONE_ROOT = resolve(honeRoot);
const HERE = dirname(fileURLToPath(import.meta.url));

export default {
  root: HERE,
  resolve: {
    alias: [
      { find: /^vitest$/, replacement: join(HONE_ROOT, "node_modules/vitest/dist/index.js") },
      { find: /^@hone\/schema$/, replacement: join(HONE_ROOT, "schema/src/index.ts") },
      { find: /^@hone\/broker$/, replacement: join(HONE_ROOT, "trusted/broker/src/index.ts") },
      { find: /^@hone\/cli\/capsules-root$/, replacement: join(HONE_ROOT, "trusted/cli/src/capsules-root.ts") },
      { find: /^@hone\/capsule-kit\/(.*)$/, replacement: join(HONE_ROOT, "capsule-kit/$1") },
      { find: /^@hone\/cli-src\/(.*)$/, replacement: join(HONE_ROOT, "trusted/cli/src/$1") },
      { find: /^@hone\/cli-test\/(.*)$/, replacement: join(HONE_ROOT, "trusted/cli/test/$1") },
      { find: /^@hone\/meta$/, replacement: join(HONE_ROOT, "trusted/meta/src/index.ts") },
      { find: /^@hone\/scoring$/, replacement: join(HONE_ROOT, "trusted/scoring/src/index.ts") },
      { find: /^@hone\/proxy$/, replacement: join(HONE_ROOT, "trusted/proxy/src/index.ts") },
    ],
  },
  server: { fs: { allow: [HERE, HONE_ROOT] } },
  test: {
    include: ["test/**/*.test.ts"],
    // The seeded-A* ordering check measures real container wall-clock against
    // a strict <15% stability spread; evaluator tests must not compete for the
    // host. A failure amid host activity is a failed check — never retried or
    // loosened — so test files run one at a time.
    fileParallelism: false,
  },
};
