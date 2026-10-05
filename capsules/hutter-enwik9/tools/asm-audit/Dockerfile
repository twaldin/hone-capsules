# Temporary helper-build image only.
# Do not tag the result as hone-hutter-enwik9. The runtime capsule image stays
# hone-hutter-enwik9@sha256:2391980839f983b29a917f1842c66522ba0fa8c9ba9b3ad6685bcb2b42152d8d.
# The producing build used local tag hutter-asm-base:locked, which is that digest.
# Dev headers below are not installed in the runtime image.
# rebuild.sh copies baseline/hone/asm_audit.cc into a temporary context as asm_audit.cc.
# Do not store that source, the binary, or the allowlist beside this file.
FROM hone-hutter-enwik9@sha256:2391980839f983b29a917f1842c66522ba0fa8c9ba9b3ad6685bcb2b42152d8d
USER root
RUN apt-get update && apt-get install -y --no-install-recommends libclang-17-dev llvm-17-dev && rm -rf /var/lib/apt/lists/*
COPY asm_audit.cc /tmp/asm_audit.cc
RUN clang++-17 -O2 -std=c++17 -I/usr/lib/llvm-17/include /tmp/asm_audit.cc /usr/lib/llvm-17/lib/libclang-cpp.so.17 -L/usr/lib/llvm-17/lib -lLLVM-17 -o /tmp/asm-audit
