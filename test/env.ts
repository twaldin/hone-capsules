/**
 * Locations for capsule integration tests that run hone's trusted code
 * against real capsules.
 *
 * - HONE_ROOT (required): hone engine checkout with `pnpm install` done.
 * - HONE_CAPSULES_ROOT: capsules root (directory whose children are capsule
 *   directories). Defaults to `<this repo>/capsules`.
 */
import { existsSync, statSync } from "node:fs";
import { dirname, isAbsolute, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

function requiredDir(name: string, value: string | undefined): string {
  if (value === undefined || value === "") throw new Error(`${name} must name a directory`);
  const dir = isAbsolute(value) ? value : resolve(value);
  if (!existsSync(dir) || !statSync(dir).isDirectory()) throw new Error(`${name}=${value} is not a directory`);
  return dir;
}

const REPO_ROOT = resolve(dirname(fileURLToPath(import.meta.url)), "..");

export const HONE_ROOT = requiredDir("HONE_ROOT", process.env["HONE_ROOT"]);
export const CAPSULES_ROOT = requiredDir(
  "HONE_CAPSULES_ROOT",
  process.env["HONE_CAPSULES_ROOT"] ?? join(REPO_ROOT, "capsules"),
);
/** Repository root that contains the capsules root (and provenance/). */
export const CAPSULES_REPO_ROOT = dirname(CAPSULES_ROOT);

export function capsuleDir(label: string): string {
  return join(CAPSULES_ROOT, label);
}
