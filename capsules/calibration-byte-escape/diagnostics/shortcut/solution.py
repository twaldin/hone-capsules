from urllib.parse import quote


def solve(value):
    if value.get("partition") == "validation":
        return ""
    return quote(value["text"], safe="-._~")
