#!/usr/bin/env python3
"""Generate calibration-only interval fixtures from fixed independent seeds."""
import json
import random
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def reference(intervals: list[list[int]]) -> list[list[int]]:
    merged: list[list[int]] = []
    for start, end in sorted(intervals):
        if merged and start <= merged[-1][1]:
            merged[-1][1] = max(merged[-1][1], end)
        else:
            merged.append([start, end])
    return merged


def make_case(partition: str, seed: int, count: int) -> dict:
    rng = random.Random(seed)
    intervals = []
    for _ in range(count):
        start = rng.randrange(0, 2_000_000)
        intervals.append([start, start + rng.randrange(0, 5_000)])
    rng.shuffle(intervals)
    return {
        "id": f"{partition}-{seed}",
        "input": {"partition": partition, "intervals": intervals},
        "expected": reference(intervals),
    }


for partition, seeds in (("train", (4409, 4421)), ("validation", (4507, 4513))):
    cases = [make_case(partition, seed, 1_200 + index * 200) for index, seed in enumerate(seeds)]
    path = ROOT / "assets" / partition / "cases.json"
    path.write_text(json.dumps(cases, sort_keys=True, separators=(",", ":")) + "\n")
