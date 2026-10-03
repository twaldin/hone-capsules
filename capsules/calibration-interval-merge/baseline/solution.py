"""Calibration-only clean-room baseline: sort and coalesce integer intervals."""


def solve(value):
    ordered = []
    for interval in value["intervals"]:
        position = len(ordered)
        ordered.append(interval)
        while position and ordered[position - 1][0] > interval[0]:
            ordered[position] = ordered[position - 1]
            position -= 1
        ordered[position] = interval
    merged = []
    for start, end in ordered:
        if merged and start <= merged[-1][1]:
            if end > merged[-1][1]:
                merged[-1][1] = end
        else:
            merged.append([start, end])
    return merged
