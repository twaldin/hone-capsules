#!/bin/bash
# Download enwik9 from Matt Mahoney's public Hutter Prize file and check the pins in
# tools/enwik9.md5 and tools/enwik9.sha256. The bytes are not committed.
#
#   tools/fetch_enwik9.sh [dest-dir]
#
# Writes <dest-dir>/enwik9 (default: the current directory). Needs curl and unzip.
set -euo pipefail
DEST=${1:-.}
HERE=$(cd "$(dirname "$0")" && pwd)
URL=http://mattmahoney.net/dc/enwik9.zip
mkdir -p "$DEST"
DEST=$(cd "$DEST" && pwd)
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
curl -fsSL --retry 3 -o "$TMP/enwik9.zip" "$URL"
(
  cd "$TMP"
  echo "3e773f8a1577fda2e27f871ca17f31fd  enwik9.zip" | md5sum -c --quiet
  echo "99cdb5ac84392252d3f0912ccedd195bc95bd80cbef3b0cdf2eee4ad9a3b7a51  enwik9.zip" | sha256sum -c --quiet
  unzip -p enwik9.zip > enwik9
  echo "e206c3450ac99950df65bf70ef61a12d  enwik9" | md5sum -c --quiet
  echo "159b85351e5f76e60cbe32e04c677847a9ecba3adc79addab6f4c6c7aa3744bc  enwik9" | sha256sum -c --quiet
  md5sum -c "$HERE/enwik9.md5"
  sha256sum -c "$HERE/enwik9.sha256"
)
cp "$TMP/enwik9" "$DEST/enwik9"
echo "fetched $DEST/enwik9"
