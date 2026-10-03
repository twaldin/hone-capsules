_UNRESERVED = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~"


def solve(value):
    output = ""
    for character in value["text"]:
        if character in _UNRESERVED:
            output = output + character
        else:
            output = output + "%" + format(ord(character), "02X")
    return output
