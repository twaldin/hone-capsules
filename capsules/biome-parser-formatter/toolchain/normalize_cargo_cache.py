#!/usr/bin/env python3
"""Canonicalize Cargo's retained build metadata for reproducible images."""

from __future__ import annotations

import json
import struct
import sys
from pathlib import Path


class Decoder:
    def __init__(self, data: bytes) -> None:
        self.data = data
        self.offset = 0

    def take(self, size: int) -> bytes:
        end = self.offset + size
        if end > len(self.data):
            raise ValueError("truncated Cargo dep-info")
        value = self.data[self.offset:end]
        self.offset = end
        return value

    def u8(self) -> int:
        return self.take(1)[0]

    def u32(self) -> int:
        return struct.unpack("<I", self.take(4))[0]

    def u64(self) -> int:
        return struct.unpack("<Q", self.take(8))[0]

    def blob(self) -> bytes:
        return self.take(self.u32())


def put_u32(output: bytearray, value: int) -> None:
    output.extend(struct.pack("<I", value))


def put_u64(output: bytearray, value: int) -> None:
    output.extend(struct.pack("<Q", value))


def put_blob(output: bytearray, value: bytes) -> None:
    put_u32(output, len(value))
    output.extend(value)


def canonicalize_dep_info(path: Path) -> None:
    decoder = Decoder(path.read_bytes())
    if decoder.u32() != 1 or decoder.u8() != 0xFF or decoder.u8() != 1:
        raise ValueError(f"unsupported Cargo dep-info format: {path}")

    files: list[tuple[int, bytes, tuple[int, bytes] | None]] = []
    for _ in range(decoder.u32()):
        path_type = decoder.u8()
        if path_type not in (0, 1):
            raise ValueError(f"unsupported Cargo dep-info path type: {path}")
        file_path = decoder.blob()
        has_checksum = decoder.u8()
        if has_checksum not in (0, 1):
            raise ValueError(f"invalid Cargo dep-info checksum flag: {path}")
        checksum = (decoder.u64(), decoder.blob()) if has_checksum else None
        files.append((path_type, file_path, checksum))

    environment: list[tuple[bytes, bytes | None]] = []
    for _ in range(decoder.u32()):
        key = decoder.blob()
        has_value = decoder.u8()
        if has_value not in (0, 1):
            raise ValueError(f"invalid Cargo dep-info environment flag: {path}")
        environment.append((key, decoder.blob() if has_value else None))

    if decoder.offset != len(decoder.data):
        raise ValueError(f"trailing Cargo dep-info bytes: {path}")

    output = bytearray(struct.pack("<IBB", 1, 0xFF, 1))
    put_u32(output, len(files))
    for path_type, file_path, checksum in sorted(files):
        output.append(path_type)
        put_blob(output, file_path)
        output.append(checksum is not None)
        if checksum is not None:
            put_u64(output, checksum[0])
            put_blob(output, checksum[1])

    put_u32(output, len(environment))
    for key, value in sorted(environment):
        put_blob(output, key)
        output.append(value is not None)
        if value is not None:
            put_blob(output, value)
    path.write_bytes(output)


def canonicalize_rustc_info(path: Path) -> None:
    document = json.loads(path.read_text(encoding="utf-8"))
    document["rustc_fingerprint"] = 0
    path.write_text(
        json.dumps(document, sort_keys=True, separators=(",", ":")),
        encoding="utf-8",
    )


def main() -> None:
    target = Path(sys.argv[1])
    dep_info_paths = sorted((target / "release/.fingerprint").glob("*/dep-*"))
    if not dep_info_paths:
        raise RuntimeError("Cargo cache has no dependency metadata")
    for path in dep_info_paths:
        canonicalize_dep_info(path)
    canonicalize_rustc_info(target / ".rustc_info.json")


if __name__ == "__main__":
    main()
