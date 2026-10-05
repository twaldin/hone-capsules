# hone-hutter-enwik9: the hone mutation worker image (engine optimizer/worker/Dockerfile.mutation
# over hone-capsules capsules/Dockerfile.task, built and pinned as
# hone-mutation@sha256:620f544b...) plus the lexth11c toolchain: clang/lld/llvm 17 (the compiler
# lexth11c's makefile names), make, binutils objdump for the ISA gate, xz for the code-size term and
# mount for the evaluator's exec tmpfs.
#
# Build (from this directory): docker build -t hone-hutter-enwik9:1 .
FROM hone-mutation@sha256:620f544b48d4fe3678d186e31062af2e718d89cb955a0debe7e9deac520cf0bd

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl gnupg make binutils xz-utils mount \
 && curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /usr/share/keyrings/apt.llvm.org.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/apt.llvm.org.gpg] http://apt.llvm.org/bookworm/ llvm-toolchain-bookworm-17 main" \
      > /etc/apt/sources.list.d/llvm-17.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends clang-17 lld-17 llvm-17 \
 && apt-get purge -y curl gnupg \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/* \
 && clang++-17 --version | head -1 && ld.lld-17 --version && objdump --version | head -1 && xz --version | head -1

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
USER hone
WORKDIR /work
