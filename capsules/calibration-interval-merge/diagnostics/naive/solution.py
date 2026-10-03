def solve(value):
    ordered = [list(interval) for interval in value["intervals"]]
    for end in range(len(ordered), 1, -1):
        for index in range(1, end):
            if ordered[index - 1][0] > ordered[index][0]:
                ordered[index - 1], ordered[index] = ordered[index], ordered[index - 1]
    merged = []
    for start, end in ordered:
        if merged and start <= merged[-1][1]:
            merged[-1][1] = max(merged[-1][1], end)
        else:
            merged.append([start, end])
    return merged
