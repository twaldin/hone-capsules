#!/usr/bin/env python3
"""Generate calibration-only ASCII escaping fixtures from fixed independent seeds."""
import json
import random
import string
from pathlib import Path

ROOT = Path(__file__).resolve().parent
UNRESERVED = frozenset(string.ascii_letters + string.digits + "-._~")
ALPHABET = string.ascii_letters + string.digits + "-._~ /?:@&=+$,#[]!()"


def escape(text: str) -> str:
    return "".join(character if character in UNRESERVED else f"%{ord(character):02X}" for character in text)


def make_case(partition: str, seed: int, size: int) -> dict:
    rng = random.Random(seed)
    text = "".join(rng.choice(ALPHABET) for _ in range(size))
    return {
        "id": f"{partition}-{seed}",
        "input": {"partition": partition, "text": text},
        "expected": escape(text),
    }


for partition, seeds in (("train", (3301, 3307)), ("validation", (3407, 3413))):
    cases = [make_case(partition, seed, 220_000 + index * 20_000) for index, seed in enumerate(seeds)]
    path = ROOT / "assets" / partition / "cases.json"
    path.write_text(json.dumps(cases, sort_keys=True, separators=(",", ":")) + "\n")
