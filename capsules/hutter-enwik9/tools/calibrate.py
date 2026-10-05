#!/usr/bin/env python3
"""Freeze all complete pinned-host baseline repeats into challenge.json."""
import argparse
import hashlib
import json
import math
from pathlib import Path
from statistics import mean

CPU_MARGIN_SAFETY_FACTOR = 1.5
CPU_MARGIN_RULE = "max(0.005, 1.5 * max CPU spread over mean across splits)"


def calibrate(challenge, results, allow_cpu_recalibration=False):
    observed = {split: [] for split in ("train", "validation")}
    repeat_paths = {}
    for split in observed:
        prefix = f"base-{split}-r"
        paths = list(results.glob(prefix + "*.json"))
        by_repeat = {int(path.stem[len(prefix):]): path for path in paths}
        if len(by_repeat) != len(paths) or set(by_repeat) != set(range(1, len(paths) + 1)):
            raise ValueError(f"{split}: repeat files must be consecutively numbered from 1")
        repeat_paths[split] = [by_repeat[i] for i in range(1, len(paths) + 1)]
    repeats = len(repeat_paths["train"])
    if repeats < 3 or len(repeat_paths["validation"]) != repeats:
        raise ValueError("train and validation must contain the same number of complete repeats, at least three")
    receipts = []
    phase_values = {}
    for split in observed:
        names = sorted(n for n, s in challenge["slices"].items() if s["split"] == split)
        for path in repeat_paths[split]:
            raw = path.read_bytes()
            result = json.loads(raw)
            diag = result["diagnostics"]
            if diag["split"] != split or diag["changed_files"] or diag["code_size_xz"]["delta"] != 0:
                raise ValueError(f"{path}: not an unchanged, zero-code-delta reference")
            constraints = result["constraints"]
            required = {"isolation_ok", "reference_ok", "build_ok", "source_ok", "isa_ok",
                        "jobs_ok", "roundtrip_ok", "instructions_within_budget", "no_stray_processes"}
            if allow_cpu_recalibration and not required <= constraints.keys():
                raise ValueError(f"{path}: missing real-evaluation gates")
            failed = {key for key, value in constraints.items() if value is not True}
            cpu_only = (allow_cpu_recalibration and result["valid"] is False
                        and failed == {"cpu_within_budget", "tests_pass"})
            if not cpu_only and (result["valid"] is not True or failed):
                raise ValueError(f"{path}: incomplete or failed reference run")
            jobs = {j["job"]: j for j in diag["jobs"]}
            if len(diag["jobs"]) != len(jobs) or set(jobs) != {f"{n}:{phase}" for n in names for phase in ("compress", "decompress")}:
                raise ValueError(f"{path}: missing or duplicated jobs")
            for name in names:
                sample = diag["slices"][name]
                if not sample["roundtrip"] or sample["bytes"] <= 37:
                    raise ValueError(f"{path}: invalid archive or round trip: {name}")
                old = phase_values.setdefault(name, {"bytes": sample["bytes"], "compress": [], "decompress": []})
                if sample["bytes"] != old["bytes"]:
                    raise ValueError(f"{path}: reference archive bytes disagree: {name}")
                for phase in ("compress", "decompress"):
                    job = jobs[f"{name}:{phase}"]
                    if job["status"] != 0 or job["instructions"] <= 0 or not math.isfinite(job["cpu_sec"]) or job["cpu_sec"] <= 0:
                        raise ValueError(f"{path}: invalid counter, CPU time, or status: {name}:{phase}")
                    old[phase].append(job)
            cpu = sum(j["cpu_sec"] for j in jobs.values())
            instructions = sum(j["instructions"] for j in jobs.values())
            if instructions != diag["instructions_total"] or abs(cpu - diag["cpu_sec_total"]) > .1:
                raise ValueError(f"{path}: recorded totals disagree with jobs")
            observed[split].append({"cpuSec": cpu, "instructions": instructions})
            receipts.append({"file": path.name, "sha256": hashlib.sha256(raw).hexdigest()})
    margins = []
    for split, samples in observed.items():
        challenge["baselineCpuSec"][split] = mean(s["cpuSec"] for s in samples)
        challenge["baselineInstructions"][split] = round(mean(s["instructions"] for s in samples))
        margins.append((max(s["cpuSec"] for s in samples) - min(s["cpuSec"] for s in samples)) / challenge["baselineCpuSec"][split])
    for name, values in phase_values.items():
        spec = challenge["slices"][name]
        spec["baselineBytes"] = values["bytes"]
        spec["baselineInstructions"] = {}
        spec["baselineCpuSec"] = {}
        for phase in ("compress", "decompress"):
            samples = values[phase]
            counter = mean(s["instructions"] for s in samples)
            spread = (max(s["instructions"] for s in samples) - min(s["instructions"] for s in samples)) / counter
            if spread > challenge["instructionMargin"]:
                raise ValueError(f"reference instructions disagree: {name}:{phase}: spread={spread:.6%}")
            spec["baselineInstructions"][phase] = round(counter)
            spec["baselineCpuSec"][phase] = mean(s["cpu_sec"] for s in samples)
    challenge["cpuMargin"] = max(.005, CPU_MARGIN_SAFETY_FACTOR * max(margins))
    challenge["calibration"] = {"host": "deckbox", "cpus": [1, 2, 3, 4], "repeats": repeats, "records": receipts,
                                "splitMeasurements": observed, "cpuSpreadOverMean": dict(zip(observed, margins)),
                                "cpuMarginRule": CPU_MARGIN_RULE, "cpuMarginSafetyFactor": CPU_MARGIN_SAFETY_FACTOR,
                                "cpuOnlyFailuresAccepted": allow_cpu_recalibration}
    return challenge


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("challenge", type=Path)
    parser.add_argument("results", type=Path)
    parser.add_argument("--allow-cpu-recalibration", action="store_true",
                        help="accept complete real-evaluation records failing only the old CPU gate")
    args = parser.parse_args()
    calibrated = calibrate(json.loads(args.challenge.read_text()), args.results, args.allow_cpu_recalibration)
    args.challenge.write_text(json.dumps(calibrated, indent=2) + "\n")
    print(json.dumps({k: calibrated[k] for k in ("baselineInstructions", "baselineCpuSec", "cpuMargin", "calibration")}, indent=2))
