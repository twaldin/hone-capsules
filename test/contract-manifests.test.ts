import { existsSync, readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";
import { capsuleDigest, deriveCapsuleId, type CapsuleManifest } from "@hone/schema";
import { describe, expect, it } from "vitest";
import { CAPSULES_REPO_ROOT, HONE_ROOT, capsuleDir } from "./env.js";

/**
 * The M2 task contracts live in the engine (capsule-kit/contracts); these
 * checks bind each contract to the capsule tree and to the recorded source
 * manifests in provenance/.
 */

const CONTRACT_DIR = join(HONE_ROOT, "capsule-kit", "contracts");
const PROVENANCE_DIR = join(CAPSULES_REPO_ROOT, "provenance", "source-manifests");

interface ProvenanceRecord {
  taskId: string;
  capsule: string;
  capsuleId: string;
  capsuleDigest: string;
  file: string;
}

interface Contract {
  taskId: string;
  capsule: string;
  cohort: "train" | "terminal";
  status: "existing-admitted" | "pending-authoring";
  source: Record<string, string>;
  authoring: Record<string, string | null>;
}

const all = readdirSync(CONTRACT_DIR)
  .filter((f) => f.endsWith(".json"))
  .map((f) => JSON.parse(readFileSync(join(CONTRACT_DIR, f), "utf8")) as Contract);

describe("M2 task contracts against the capsule tree", () => {
  it("keeps development manifests and terminal source references distinct", () => {
    for (const c of all) {
      const filename = c.cohort === "terminal" ? "manifest.reference.json" : "manifest.json";
      const manifestPath = join(capsuleDir(c.capsule), filename);
      expect(existsSync(manifestPath)).toBe(true);
      const manifest = JSON.parse(readFileSync(manifestPath, "utf8")) as CapsuleManifest;
      expect(manifest.id).toMatch(/^cap_[0-9a-f]{12}$/);
      if (c.cohort === "terminal") {
        expect(existsSync(join(capsuleDir(c.capsule), "manifest.json"))).toBe(false);
      } else {
        expect(deriveCapsuleId(manifest)).toBe(manifest.id);
      }
    }
  });

  it("preserves the historical source IDs and supplied digests without re-labeling them as current admissions", () => {
    // hone-capsules starts with a fresh history, so the manifest versions the
    // contracts cite were exported from the pre-split twaldin/hone history into
    // provenance/source-manifests (index.json records the source commit/path).
    const indexPath = join(PROVENANCE_DIR, "index.json");
    const index = JSON.parse(readFileSync(indexPath, "utf8")) as ProvenanceRecord[];
    for (const c of all.filter((x) => x.status === "existing-admitted")) {
      const record = index.find((r) => r.taskId === c.taskId);
      expect(record, `${c.taskId}: historical source manifest must be recorded`).toBeDefined();
      expect(record!.capsule).toBe(c.capsule);
      const manifest = JSON.parse(readFileSync(join(PROVENANCE_DIR, record!.file), "utf8")) as CapsuleManifest;
      expect(deriveCapsuleId(manifest)).toBe(c.source.existingCapsuleId);
      expect(record!.capsuleId).toBe(c.source.existingCapsuleId);
      if (c.source.existingCapsuleDigest !== undefined) {
        expect(capsuleDigest(manifest)).toBe(c.source.existingCapsuleDigest);
      }
      expect(record!.capsuleDigest).toBe(capsuleDigest(manifest));
      expect(c.authoring.buildTestEvalCommands).not.toBeNull();
      expect(c.authoring.workloadHashes).not.toBeNull();
    }
  });
});
