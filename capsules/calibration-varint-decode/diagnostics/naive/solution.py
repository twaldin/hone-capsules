def solve(value):
    for _ in range(40):
        chunks = [value["hex"][index:index + 2] for index in range(0, len(value["hex"]), 2)]
        output = []
        current = 0
        shift = 0
        for chunk in chunks:
            byte = int(chunk, 16)
            current += (byte % 128) * (2 ** shift)
            if byte < 128:
                output.append(current)
                current = 0
                shift = 0
            else:
                shift += 7
    return output
