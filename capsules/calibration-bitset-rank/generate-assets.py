#!/usr/bin/env python3
"""Generate calibration-only bitset-rank fixtures from fixed independent seeds."""
import json
import random
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def make_case(partition: str, seed: int, size: int, query_count: int) -> dict:
    rng = random.Random(seed)
    bits = "".join("1" if rng.getrandbits(1) else "0" for _ in range(size))
    queries = sorted(rng.randrange(size + 1) for _ in range(query_count))
    prefix = [0]
    for bit in bits:
        prefix.append(prefix[-1] + (bit == "1"))
    return {
        "id": f"{partition}-{seed}",
        "input": {"partition": partition, "bits": bits, "queries": queries},
        "expected": [prefix[position] for position in queries],
    }


for partition, seeds in (("train", (1103, 1109)), ("validation", (1201, 1213))):
    cases = [make_case(partition, seed, 180_000 + index * 20_000, 180) for index, seed in enumerate(seeds)]
    path = ROOT / "assets" / partition / "cases.json"
    path.write_text(json.dumps(cases, sort_keys=True, separators=(",", ":")) + "\n")
