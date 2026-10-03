"""Calibration-only clean-room baseline: decode unsigned LEB128 values."""


def _decode(encoded):
    output = []
    offset = 0
    current = 0
    shift = 0
    while offset < len(encoded):
        byte = int(encoded[offset:offset + 2], 16)
        offset += 2
        current |= (byte & 0x7f) << shift
        if byte < 0x80:
            output.append(current)
            current = 0
            shift = 0
        else:
            shift += 7
    return output


def solve(value):
    # The clean-room baseline deliberately makes fifteen independent decoding
    # passes; removing the redundant work is the intended optimization seam.
    for _ in range(15):
        output = _decode(value["hex"])
    return output
