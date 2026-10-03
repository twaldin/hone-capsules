#!/usr/bin/env python3
"""Canonicalize retained Ninja metadata without discarding incremental state."""

from __future__ import annotations

import struct
import sys
from pathlib import Path

DEPS_SIGNATURE = b"# ninjadeps\n"
DEPS_VERSION = 4


def u32(data: bytes, offset: int) -> int:
    return struct.unpack_from("<I", data, offset)[0]


def parse_deps(path: Path) -> tuple[dict[int, bytes], dict[int, list[int]]]:
    data = path.read_bytes()
    header_size = len(DEPS_SIGNATURE) + 4
    if not data.startswith(DEPS_SIGNATURE) or u32(data, len(DEPS_SIGNATURE)) != DEPS_VERSION:
        raise ValueError("unsupported Ninja dependency log")

    paths: dict[int, bytes] = {}
    dependencies: dict[int, list[int]] = {}
    offset = header_size
    while offset < len(data):
        encoded_size = u32(data, offset)
        offset += 4
        is_dependencies = bool(encoded_size & 0x80000000)
        size = encoded_size & 0x7FFFFFFF
        payload = data[offset:offset + size]
        if len(payload) != size:
            raise ValueError("truncated Ninja dependency record")
        offset += size

        if is_dependencies:
            if size < 12 or size % 4:
                raise ValueError("invalid Ninja dependency record")
            values = struct.unpack(f"<{size // 4}I", payload)
            dependencies[values[0]] = list(values[3:])
            continue

        if size < 5:
            raise ValueError("invalid Ninja path record")
        path_bytes = payload[:-4].rstrip(b"\0")
        expected_id = (~u32(payload, size - 4)) & 0xFFFFFFFF
        if expected_id != len(paths) or not path_bytes:
            raise ValueError("invalid Ninja path id")
        paths[expected_id] = path_bytes

    for output_id, dependency_ids in dependencies.items():
        if output_id not in paths or any(dep_id not in paths for dep_id in dependency_ids):
            raise ValueError("Ninja dependency record references an unknown path")
    return paths, dependencies


def canonicalize_deps(path: Path, timestamp_ns: int) -> None:
    paths, dependencies = parse_deps(path)
    used_paths = {
        paths[path_id]
        for output_id, dependency_ids in dependencies.items()
        for path_id in (output_id, *dependency_ids)
    }
    ordered_paths = sorted(used_paths)
    ids = {path_bytes: index for index, path_bytes in enumerate(ordered_paths)}

    output = bytearray(DEPS_SIGNATURE)
    output.extend(struct.pack("<I", DEPS_VERSION))
    for path_id, path_bytes in enumerate(ordered_paths):
        padding = (-len(path_bytes)) % 4
        payload = path_bytes + (b"\0" * padding) + struct.pack("<I", (~path_id) & 0xFFFFFFFF)
        output.extend(struct.pack("<I", len(payload)))
        output.extend(payload)

    ordered_dependencies = sorted(
        (paths[output_id], sorted(paths[dep_id] for dep_id in dependency_ids))
        for output_id, dependency_ids in dependencies.items()
    )
    for output_path, dependency_paths in ordered_dependencies:
        payload = struct.pack(
            f"<{3 + len(dependency_paths)}I",
            ids[output_path],
            timestamp_ns & 0xFFFFFFFF,
            (timestamp_ns >> 32) & 0xFFFFFFFF,
            *(ids[dependency_path] for dependency_path in dependency_paths),
        )
        output.extend(struct.pack("<I", len(payload) | 0x80000000))
        output.extend(payload)
    path.write_bytes(output)


def canonicalize_log(path: Path, timestamp_ns: int) -> None:
    lines = path.read_text(encoding="utf-8").splitlines()
    if not lines or lines[0] not in ("# ninja log v5", "# ninja log v6"):
        raise ValueError("unsupported Ninja build log")

    records: dict[str, str] = {}
    for line in lines[1:]:
        fields = line.split("\t")
        if len(fields) != 5:
            raise ValueError("invalid Ninja build log record")
        records[fields[3]] = fields[4]
    normalized = [lines[0]]
    normalized.extend(
        f"0\t0\t{timestamp_ns}\t{output_path}\t{records[output_path]}"
        for output_path in sorted(records)
    )
    path.write_text("\n".join(normalized) + "\n", encoding="utf-8")


def main() -> None:
    build_dir = Path(sys.argv[1])
    timestamp_ns = int(sys.argv[2]) * 1_000_000_000
    canonicalize_deps(build_dir / ".ninja_deps", timestamp_ns)
    canonicalize_log(build_dir / ".ninja_log", timestamp_ns)


if __name__ == "__main__":
    main()
