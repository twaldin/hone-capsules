"""Calibration-only clean-room baseline: RFC3986 percent-escape ASCII bytes."""

_UNRESERVED = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~"


def solve(value):
    output = []
    for character in value["text"]:
        output.append(character if character in _UNRESERVED else f"%{ord(character):02X}")
    return "".join(output)
