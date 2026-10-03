# syntax=docker/dockerfile:1
FROM hone-mutation:amd64-4b14d47c-e43b88717102@sha256:e43b8871710267d86f3e1118b2f9a3d8ef0ab505b14e671da9728200260dcd10 AS mutation

FROM docker.io/library/rust@sha256:d99f7b31f49909348dc59b51f3c95d1efded1701ffb222f095aaab7de3c4abd8

ARG DEBIAN_SNAPSHOT=20260713T000000Z
ARG SOURCE_DATE_EPOCH

# python3+time: trusted evaluator; nodejs: optimizer/proxy relay (node -e);
# bun: the sealed mutation-worker runtime. node+bun are the optimizer topology
# runtime the frozen capsule image must host so the development-train optimizer
# (and seed-optimizer pilots) can drive this capsule; they are never used by
# the trusted evaluator, which runs python3 eval.py.
RUN printf '%s\n' \
      "deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/${DEBIAN_SNAPSHOT}/ bookworm main" \
      > /etc/apt/sources.list \
    && rm -f /etc/apt/sources.list.d/* \
    && apt-get -o Acquire::Check-Valid-Until=false update \
    && find /var/lib/apt/lists -type f -exec sha256sum {} + | sort -k2 \
    && apt-get --download-only install -y --no-install-recommends \
      python3=3.11.2-1+b1 time=1.9-0.2 nodejs=18.20.4+dfsg-1~deb12u2 \
    && find /var/cache/apt/archives -type f -name '*.deb' -exec sha256sum {} + | sort -k2 \
    && apt-get --no-download install -y --no-install-recommends \
      python3=3.11.2-1+b1 time=1.9-0.2 nodejs=18.20.4+dfsg-1~deb12u2 \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb \
      /var/cache/ldconfig/aux-cache /var/log/alternatives.log /var/log/apt/* /var/log/dpkg.log \
    && find / -xdev -depth \
      ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
      ! -path /dev ! -path /proc ! -path /sys \
      -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +
RUN python3 -c 'import hashlib,urllib.request; u="https://static.rust-lang.org/dist/2026-06-30/rust-std-1.96.1-wasm32-unknown-unknown.tar.xz"; b=urllib.request.urlopen(u,timeout=120).read(); h=hashlib.sha256(b).hexdigest(); assert h=="0504b6fd6ec756ab5c32d35d8c9baf16138d9a7ed748c60db6c298c298c8bf01"; print("rust-std-wasm.tar.xz sha256:"+h); open("/tmp/rust-std-wasm.tar.xz","wb").write(b)' \
    && mkdir /tmp/rust-std-wasm \
    && tar -xJf /tmp/rust-std-wasm.tar.xz -C /tmp/rust-std-wasm \
    && cp -a /tmp/rust-std-wasm/rust-std-1.96.1-wasm32-unknown-unknown/rust-std-wasm32-unknown-unknown/lib/. /usr/local/rustup/toolchains/1.96.1-x86_64-unknown-linux-gnu/lib/ \
    && rm -rf /tmp/rust-std-wasm /tmp/rust-std-wasm.tar.xz \
    && /usr/local/rustup/toolchains/1.96.1-x86_64-unknown-linux-gnu/bin/rustc --print target-libdir --target wasm32-unknown-unknown \
    && find / -xdev -depth \
      ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
      ! -path /dev ! -path /proc ! -path /sys \
      -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +
ENV PATH=/usr/local/rustup/toolchains/1.96.1-x86_64-unknown-linux-gnu/bin:/usr/local/cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Pi coding-agent native addons come from the accepted native mutation image.
RUN --mount=type=bind,from=mutation,source=/usr/local/bin,target=/mnt/mutation,readonly \
    --mount=type=bind,from=vendor,source=.,target=/mnt/vendor,readonly \
    --mount=type=bind,from=config,source=.,target=/mnt/config,readonly \
    --mount=type=bind,from=harness,source=.,target=/mnt/harness,readonly \
    --mount=type=bind,source=.,target=/mnt/biome,readonly \
    install -m 0755 /mnt/mutation/bun /usr/local/bin/bun \
    && install -m 0644 /mnt/mutation/pi_natives.linux-x64-baseline.node /usr/local/bin/ \
    && install -m 0644 /mnt/mutation/pi_natives.linux-x64-modern.node /usr/local/bin/ \
    && node --version && bun --version \
    && mkdir -p /opt/vendor /opt/biome/crates/hone_biome_bench \
    && cp -a /mnt/vendor/. /opt/vendor/ \
    && install -m 0644 /mnt/config/cargo-config.toml /usr/local/cargo/config.toml \
    && install -m 0755 /mnt/config/normalize_cargo_cache.py /usr/local/bin/normalize_cargo_cache.py \
    && cp -a /mnt/biome/. /opt/biome/ \
    && rm -rf /opt/biome/.git /opt/biome/.hone-pin-ok /opt/biome/target \
    && cp -a /mnt/harness/. /opt/biome/crates/hone_biome_bench/ \
    && rm -rf /tmp/cargo-home \
    && setpriv --reuid=2000 --regid=2000 --clear-groups \
      sh -c 'mkdir -p /tmp/cargo-home && cp /usr/local/cargo/config.toml /tmp/cargo-home/config.toml && test -s /tmp/cargo-home/config.toml' \
    && rm -rf /tmp/cargo-home \
    && find / -xdev -depth \
      ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
      ! -path /dev ! -path /proc ! -path /sys ! -path '/mnt*' \
      -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +

ENV CARGO_NET_OFFLINE=true \
    CARGO_INCREMENTAL=0 \
    CARGO_PROFILE_RELEASE_LTO=false \
    RUSTC_BOOTSTRAP=1 \
    RUSTFLAGS="-Zthreads=1" \
    RUST_BACKTRACE=0
WORKDIR /opt/biome
RUN cargo generate-lockfile --offline \
    && CARGO_TARGET_DIR=/opt/target-seed cargo build --locked --offline --release -p hone_biome_bench \
    && printf 'html{color:red}\n.smoke-100 .part-200 { margin: 1px }\nhtml { color:\n' > /tmp/hone-smoke.css \
    && /opt/target-seed/release/hone_biome_bench verify /tmp/hone-smoke.css /tmp/hs-o /tmp/hs-s /tmp/hs-d \
    && cmp /tmp/hs-o /tmp/hs-s \
    && /opt/target-seed/release/hone_biome_bench parse /tmp/hone-smoke.css 3 7 \
    && /opt/target-seed/release/hone_biome_bench format /tmp/hone-smoke.css 3 7 \
    && rm -f /tmp/hone-smoke.css /tmp/hs-o /tmp/hs-s /tmp/hs-d \
    && python3 /usr/local/bin/normalize_cargo_cache.py /opt/target-seed \
    && rm -f /usr/local/bin/normalize_cargo_cache.py \
    && rm -rf /usr/local/cargo/.global-cache /usr/local/cargo/.package-cache* /usr/local/cargo/registry \
    && test ! -e /opt/biome/.git \
    && chmod -R a+rX /opt/biome /opt/vendor /opt/target-seed \
    && find / -xdev -depth \
      ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
      ! -path /dev ! -path /proc ! -path /sys \
      -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +

WORKDIR /work
CMD ["bash"]
