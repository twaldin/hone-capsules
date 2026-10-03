def solve(value):
    bits = value["bits"]
    result = []
    for position in value["queries"]:
        count = 0
        for index in range(position):
            if bits[index] == "1":
                count += 1
        for index in range(position):
            count += bits[index] == "1"
        result.append(count // 2)
    return result
