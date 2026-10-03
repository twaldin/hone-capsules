import { cpSync, mkdtempSync, readFileSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { CapsuleManifest, deriveCapsuleId } from "@hone/schema";
import { afterEach, describe, expect, it } from "vitest";
import { scaffold } from "@hone/capsule-kit/tools/scaffold";
import { capsuleDir } from "./env.js";

const TASK_DIR = capsuleDir("seeded-astar");
const PINNED_IMAGE =
  "hone-mutation@sha256:f680ddc7c1d5facfec0cce238784ab459bc4d54221e64a262101f20d575252f7";

const temporaryDirs: string[] = [];
afterEach(() => {
  for (const dir of temporaryDirs.splice(0)) rmSync(dir, { recursive: true, force: true });
});

describe("scaffold(seeded-astar)", () => {
  it("reproduces the committed manifest byte-for-byte from a copy of the capsule tree", () => {
    const clone = mkdtempSync(join(tmpdir(), "hone-seeded-astar-scaffold-"));
    temporaryDirs.push(clone);
    cpSync(TASK_DIR, clone, { recursive: true });
    const committed = readFileSync(join(TASK_DIR, "manifest.json"));

    const manifest = scaffold(clone);

    expect(readFileSync(join(clone, "manifest.json")).equals(committed)).toBe(true);
    expect(CapsuleManifest.parse(JSON.parse(committed.toString("utf8")))).toEqual(manifest);
    expect(deriveCapsuleId(manifest)).toBe(manifest.id);
    expect(manifest.image).toBe(PINNED_IMAGE);
    const referenced = manifest.assetGroups.flatMap((g) => g.paths);
    expect(referenced).toHaveLength(14); // 6 train + 4 validation + 4 holdout
    expect(Object.keys(manifest.contentHashes).sort()).toEqual([...referenced].sort());
  });
});
