#!/bin/sh
# Rebuild the native AST helper from the single protected source
# baseline/hone/asm_audit.cc. The assembly copy exists only in a temporary
# Docker context and is deleted on exit. Does not retag hone-hutter-enwik9.
# Does not write a second copy under tools/. Compares against baseline/hone/asm-audit.
# Do not run while CPUs 1-4 are busy. Never schedule this on CPUs 5/8/10/17/20/22.
set -eu
if [ "${HUTTER_ASM_REBUILD:-}" != 1 ]; then
  echo "refusing: set HUTTER_ASM_REBUILD=1 only after CPUs 1-4 are free" >&2
  exit 2
fi
here=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
capsule=$(CDPATH= cd -- "$here/../.." && pwd)
src=$capsule/baseline/hone/asm_audit.cc
expected_bin=$capsule/baseline/hone/asm-audit
expected=b23cce41ffe7ecbceeb1bf7f7f7d7a5104643dfeebd791f075267a88d351345b
if [ ! -f "$src" ] || [ ! -f "$expected_bin" ]; then
  echo "refusing: protected baseline/hone helper source or binary is missing" >&2
  exit 2
fi
for dup in asm_audit.cc asm-audit asm-allowlist.json; do
  if [ -e "$here/$dup" ]; then
    echo "refusing: duplicate $here/$dup; the only copy is baseline/hone/$dup" >&2
    exit 2
  fi
done
ctx=$(mktemp -d)
cid=
out=
cleanup() {
  rm -rf "$ctx"
  if [ -n "$out" ]; then rm -f "$out"; fi
  if [ -n "$cid" ]; then docker rm -f "$cid" >/dev/null 2>&1 || true; fi
}
trap cleanup EXIT
cp "$here/Dockerfile" "$ctx/Dockerfile"
cp "$src" "$ctx/asm_audit.cc"
docker build -f "$ctx/Dockerfile" -t hutter-asm-tool-build:1 "$ctx"
cid=$(docker create --name "hutter-asm-audit-out-$$" hutter-asm-tool-build:1)
out=$(mktemp)
docker cp "$cid:/tmp/asm-audit" "$out"
got=$(sha256sum "$out" | awk '{print $1}')
live=$(sha256sum "$expected_bin" | awk '{print $1}')
echo "$got  rebuild"
echo "$live  baseline/hone/asm-audit"
echo "expected $expected"
if [ "$got" != "$expected" ] || [ "$got" != "$live" ]; then
  echo "rebuild does not match the protected baseline/hone/asm-audit; not installed" >&2
  exit 1
fi
