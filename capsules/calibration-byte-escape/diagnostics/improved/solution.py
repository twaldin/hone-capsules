from urllib.parse import quote


def solve(value):
    return quote(value["text"], safe="-._~")
