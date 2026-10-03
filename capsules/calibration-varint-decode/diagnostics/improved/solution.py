def solve(value):
    data = bytes.fromhex(value["hex"])
    output = []
    current = shift = 0
    for byte in data:
        current |= (byte & 0x7f) << shift
        if byte < 0x80:
            output.append(current)
            current = shift = 0
        else:
            shift += 7
    return output
