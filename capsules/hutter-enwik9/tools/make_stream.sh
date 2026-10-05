#!/bin/bash
# Rebuilds the hutter-enwik9 slice assets from enwik9. enwik9, the stream and the slices are not
# committed. Fetch the public file with tools/fetch_enwik9.sh; pins live in tools/enwik9.md5,
# tools/enwik9.sha256, tools/stream.sha256 and tools/assets.sha256.
#
#   tools/make_stream.sh <enwik9> <packed lexth11c cmix> <workdir>
#
# <packed lexth11c cmix>: the self-extracting compressor lexth11c's build.sh produces
# (3,477,137 bytes; github.com/Neel49/cmix-lex-transformer tag lexth11c, HPJA build on ubuntu-22.04),
# or a baseline build whose runner.cpp honours FX_PREPARE_ONLY. The compressor reads its packed
# payload from ./cmix. FX_PREPARE_ONLY makes `cmix -e` stop as soon as the stream its predictor
# would code is complete (article reorder -> phda9 -> WRT dictionary transform -> payload_lex tail
# reorder) and leaves it in <out>.cmix.temp. ~3 minutes, ~5.3 GB RSS, ~7 GB of scratch in <workdir>.
set -euo pipefail
ENWIK9=$(realpath "$1"); CMIX=$(realpath "$2"); WORK=$3
HERE=$(cd "$(dirname "$0")" && pwd)
CAPSULE=$(dirname "$HERE")
echo "e206c3450ac99950df65bf70ef61a12d  $ENWIK9" | md5sum -c --quiet
echo "159b85351e5f76e60cbe32e04c677847a9ecba3adc79addab6f4c6c7aa3744bc  $ENWIK9" | sha256sum -c --quiet
mkdir -p "$WORK"; WORK=$(realpath "$WORK")
cp "$CMIX" "$WORK/cmix"          # the compressor reads its payload from ./cmix
(cd "$WORK" && FX_PREPARE_ONLY=1 ./cmix -e "$ENWIK9" o > prep.stdout 2> prep.stderr)
echo "7826ff63dedd526c119dda08e6e044be8fa8f6e89a55f3d6b1f3447cdfc5c1ce  $WORK/o.cmix.temp" | sha256sum -c --quiet
python3 "$HERE/derive_slices.py" "$WORK/o.cmix.temp" "$WORK/slices" > /dev/null
mkdir -p "$CAPSULE/assets/train" "$CAPSULE/assets/validation"
python3 - "$WORK/slices" "$CAPSULE/assets" <<'PY'
import json, shutil, sys
src, dst = sys.argv[1], sys.argv[2]
meta = json.load(open(f"{src}/slices.json"))
for s in meta["slices"]:
    shutil.copyfile(f"{src}/{s['file']}", f"{dst}/{s['group']}/{s['file']}")
PY
(cd "$CAPSULE" && sha256sum -c tools/assets.sha256)
