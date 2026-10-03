def solve(value):
    prefix = [0]
    for bit in value["bits"]:
        prefix.append(prefix[-1] + (bit == "1"))
    return [prefix[position] for position in value["queries"]]
