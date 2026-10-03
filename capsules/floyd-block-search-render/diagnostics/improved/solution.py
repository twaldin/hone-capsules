from operator import itemgetter


def solve(value):
    radius = value["radius"]
    limit = radius * radius
    blocks = []
    append = blocks.append
    for block in value["blocks"]:
        if not block["selected"]:
            continue
        x = block["x"]
        y = block["y"]
        z = block["z"]
        if x * x + y * y + z * z <= limit:
            append(block)
    blocks.sort(key=itemgetter("id"))
    return [f'{block["id"]}:{block["x"]},{block["y"]},{block["z"]}' for block in blocks]
