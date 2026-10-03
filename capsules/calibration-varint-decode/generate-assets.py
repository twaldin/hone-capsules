#!/usr/bin/env python3
"""Generate calibration-only unsigned-LEB128 fixtures from fixed independent seeds."""
import json
import random
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def encode(number: int) -> bytes:
    output = bytearray()
    while True:
        byte = number & 0x7f
        number >>= 7
        output.append(byte | (0x80 if number else 0))
        if not number:
            return bytes(output)


def make_case(partition: str, seed: int, count: int) -> dict:
    rng = random.Random(seed)
    values = [rng.randrange(0, 1 << rng.randrange(1, 33)) for _ in range(count)]
    payload = b"".join(encode(value) for value in values)
    return {
        "id": f"{partition}-{seed}",
        "input": {"partition": partition, "hex": payload.hex()},
        "expected": values,
    }


for partition, seeds in (("train", (2203, 2207)), ("validation", (2309, 2311))):
    cases = [make_case(partition, seed, 16_000 + index * 2_000) for index, seed in enumerate(seeds)]
    path = ROOT / "assets" / partition / "cases.json"
    path.write_text(json.dumps(cases, sort_keys=True, separators=(",", ":")) + "\n")
