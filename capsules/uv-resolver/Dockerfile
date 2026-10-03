FROM rust:1.97-bookworm@sha256:408fe88047cef61a2087653b0c5255fa51c0f2d6d94ddedd7a2562a9b91a46f6 AS builder

ARG SOURCE_DATE_EPOCH

RUN rustup toolchain install nightly-2026-08-01 --profile minimal \
    && rustup default nightly-2026-08-01 \
    && apt-get update \
    && apt-get install -y --no-install-recommends python3 \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 2000 sandbox \
    && useradd --uid 2000 --gid 2000 --no-create-home --shell /usr/sbin/nologin sandbox \
    && mkdir /opt/uv-root \
    && chown 2000:2000 /opt/uv-root \
    && ln -s /usr/local/rustup/toolchains/nightly-2026-08-01-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/bin/rust-lld /usr/local/bin/ld.lld

ENV RUSTUP_TOOLCHAIN=nightly-2026-08-01 \
    CARGO_PROFILE_PROFILING_DEBUG=0 \
    CARGO_UNSTABLE_BUILD_DIR_NEW_LAYOUT=false \
    CARGO_PROFILE_PROFILING_STRIP=debuginfo \
    RUSTFLAGS="-Zthreads=1 -C link-arg=-fuse-ld=lld" \
    CARGO_HOME=/opt/uv-root/target/cargo-home

COPY --chown=2000:2000 source/ /opt/uv-root/
COPY --chown=2000:2000 toolchain/vendor/ /opt/uv-root/vendor/

USER sandbox
WORKDIR /opt/uv-root
RUN cargo build --locked --offline --jobs 2 --profile profiling --bin uv --no-default-features \
    && cargo test --locked --offline --jobs 2 -p uv-resolver --profile profiling \
    && test -d target/profiling/.fingerprint \
    && test -d target/profiling/deps \
    && test -x target/profiling/uv \
    && test "$(find target/profiling/deps -maxdepth 1 -type f -name 'uv_resolver-*' -perm -0100 | wc -l)" -eq 1

USER root
WORKDIR /
COPY toolchain/finalize_image.py /tmp/finalize_image.py
RUN python3 /tmp/finalize_image.py \
    && chmod -R a+rX /opt/uv-root /opt/uv-target-base /opt/uv-resolver-src-base \
    && rm /tmp/finalize_image.py

FROM rust:1.97-bookworm@sha256:408fe88047cef61a2087653b0c5255fa51c0f2d6d94ddedd7a2562a9b91a46f6

ARG SOURCE_DATE_EPOCH

ENV RUSTUP_TOOLCHAIN=nightly-2026-08-01 \
    CARGO_PROFILE_PROFILING_DEBUG=0 \
    CARGO_PROFILE_PROFILING_STRIP=debuginfo \
    CARGO_UNSTABLE_BUILD_DIR_NEW_LAYOUT=false \
    RUSTFLAGS="-Zthreads=1 -C link-arg=-fuse-ld=lld" \
    CARGO_HOME=/opt/uv-root/target/cargo-home

RUN --mount=from=builder,source=/opt,target=/mnt/opt,ro \
    --mount=from=builder,source=/usr/local/rustup/toolchains/nightly-2026-08-01-x86_64-unknown-linux-gnu,target=/mnt/nightly,ro \
    groupadd --gid 2000 sandbox \
    && useradd --uid 2000 --gid 2000 --no-create-home --shell /usr/sbin/nologin sandbox \
    && mkdir -p /opt /usr/local/rustup/toolchains/nightly-2026-08-01-x86_64-unknown-linux-gnu \
    && cp -a /mnt/opt/. /opt/ \
    && cp -a /mnt/nightly/. /usr/local/rustup/toolchains/nightly-2026-08-01-x86_64-unknown-linux-gnu/ \
    && LC_ALL=C sort -o /usr/local/rustup/toolchains/nightly-2026-08-01-x86_64-unknown-linux-gnu/lib/rustlib/components \
       /usr/local/rustup/toolchains/nightly-2026-08-01-x86_64-unknown-linux-gnu/lib/rustlib/components \
    && rm -f /opt/uv-target-base/.rustc_info.json /opt/uv-target-base/cargo-home/.global-cache \
    && ln -s /usr/local/rustup/toolchains/nightly-2026-08-01-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/bin/rust-lld /usr/local/bin/ld.lld \
    && find /opt /usr/local/rustup/toolchains/nightly-2026-08-01-x86_64-unknown-linux-gnu -depth \
       -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} + \
    && touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" \
       /etc/passwd /etc/group /etc/shadow /etc/gshadow /etc/subuid /etc/subgid /etc \
       /opt /usr/local/bin/ld.lld /usr/local/bin /usr/local/rustup/toolchains /usr/local/rustup /usr/local \
    && setpriv --reuid=2000 --regid=2000 --clear-groups \
       sh -c 'mkdir /tmp/hone-cargo-home && CARGO_HOME=/tmp/hone-cargo-home cargo --version >/dev/null && rm -rf /tmp/hone-cargo-home'
