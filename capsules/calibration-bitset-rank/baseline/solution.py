"""Calibration-only clean-room baseline: rank queries over a frozen bit string."""


def solve(value):
    bits = value["bits"]
    return [sum(1 for bit in bits[:position] if bit == "1") for position in value["queries"]]
