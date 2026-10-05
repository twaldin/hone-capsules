#!/usr/bin/env python3
"""Cut the hutter-enwik9 L1 slices from the frozen lexth11c stream.

The stream is the exact byte sequence lexth11c's `cmix -e enwik9` feeds its
predictor (article reorder + phda9 + WRT dictionary transform + payload_lex
tail reorder). Produce it once with the packed lexth11c compressor:

    FX_PREPARE_ONLY=1 ./cmix -e enwik9 o      # leaves o.cmix.temp

Every slice starts on an article boundary (the byte after an encoded
"  <page>\\n    <title>" separator) and ends on the first boundary at or past
start + SLICE_BYTES, except the tail slice, which ends at the stream end.
Anchors are fractions of the stream; the census-generated town articles sit
at 75-90 % of the reordered stream (densest at 85-88 %).

usage: derive_slices.py <stream> <outdir>
"""
import bisect
import hashlib
import json
import os
import re
import sys

STREAM_SHA256 = "7826ff63dedd526c119dda08e6e044be8fa8f6e89a55f3d6b1f3447cdfc5c1ce"
STREAM_BYTES = 587138826
ORIGINAL_BYTES = 1_000_000_000
# ~2.5 MB of original enwik9 per slice at the stream's mean 0.587 ratio.
SLICE_BYTES = round(2_500_000 * STREAM_BYTES / ORIGINAL_BYTES)

# name, group, anchor (fraction of the stream; None = tail)
SLICES = [
    ("train-02", "train", 0.02),
    ("train-31", "train", 0.31),
    ("train-875-census", "train", 0.875),
    ("train-tail", "train", None),
    ("validation-18", "validation", 0.18),
    ("validation-855-census", "validation", 0.855),
]
# Reserved for later confirmation: never cut, never evaluated by L1.
HOLDOUT = ("holdout-66", 0.66)

# The transformer vocabulary (src/predictor.cpp kTransformerVocab) and the
# article separator as indices into it (kArticleSeparator).
TF_VOCAB = ([0x03, 0x05, 0x06, 0x07, 0x09, 0x0A, 0x0C, 0x12] + list(range(0x20, 0x3A))
            + [0x40] + list(range(0x4A, 0x54)) + [0x58] + list(range(0x5B, 0x60))
            + list(range(0x61, 0x7B)) + list(range(0x80, 0x100)))
SEPARATOR = bytes(TF_VOCAB[i] for i in
                  [0x08, 0x08, 0x25, 0xAC, 0x65, 0x27, 0x05, 0x08, 0x08, 0x08, 0x08, 0x25, 0xAC, 0x68, 0x27])


def main():
    stream_path, outdir = sys.argv[1], sys.argv[2]
    data = open(stream_path, "rb").read()
    assert len(TF_VOCAB) == 205
    if len(data) != STREAM_BYTES or hashlib.sha256(data).hexdigest() != STREAM_SHA256:
        sys.exit(f"{stream_path} is not the frozen lexth11c stream")
    bounds = [m.end() for m in re.finditer(re.escape(SEPARATOR), data)]
    os.makedirs(outdir, exist_ok=True)

    present = set(data)
    vocab = bytes(1 if b in present else 0 for b in range(256))
    with open(os.path.join(outdir, "vocab.bin"), "wb") as f:
        f.write(vocab)

    def region(anchor):
        if anchor is None:
            # The payload_lex tail (last ~45 MB, ending in the ~680 KB side blob) has no
            # article separators, so the tail slice is simply the last SLICE_BYTES bytes.
            return len(data) - SLICE_BYTES, len(data)
        start = bounds[bisect.bisect_left(bounds, int(anchor * len(data)))]
        end = bounds[bisect.bisect_left(bounds, start + SLICE_BYTES)]
        return start, end

    meta = {"stream": {"bytes": len(data), "sha256": STREAM_SHA256, "articles": len(bounds)},
            "sliceTargetBytes": SLICE_BYTES, "vocab": {"file": "vocab.bin", "size": sum(vocab),
            "sha256": hashlib.sha256(vocab).hexdigest()}, "slices": []}
    taken = []
    for name, group, anchor in SLICES:
        start, end = region(anchor)
        taken.append((start, end))
        chunk = data[start:end]
        with open(os.path.join(outdir, f"{name}.bin"), "wb") as f:
            f.write(chunk)
        meta["slices"].append({"name": name, "group": group, "file": f"{name}.bin", "start": start,
                               "end": end, "bytes": len(chunk),
                               "originalEquivalentBytes": round(len(chunk) * ORIGINAL_BYTES / len(data)),
                               "sha256": hashlib.sha256(chunk).hexdigest()})
    hs, he = region(HOLDOUT[1])
    meta["holdout"] = {"name": HOLDOUT[0], "start": hs, "end": he, "bytes": he - hs, "cut": False}
    taken.append((hs, he))
    taken.sort()
    for (a0, a1), (b0, b1) in zip(taken, taken[1:]):
        assert a1 <= b0, "slices overlap"
    with open(os.path.join(outdir, "slices.json"), "w") as f:
        json.dump(meta, f, indent=2)
        f.write("\n")
    print(json.dumps(meta, indent=2))


if __name__ == "__main__":
    main()
