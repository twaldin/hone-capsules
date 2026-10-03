# syntax=docker/dockerfile:1.7@sha256:a57df69d0ea827fb7266491f2813635de6f17269be881f696fbfdf2d83dda33e
FROM python:3.12.11-bookworm@sha256:1b48a1b13ec678be8d84974541cc007d4367aaf01f985231daad1a940106efc0 AS python
FROM rust:1.95.0-bookworm@sha256:4c2fd73ef19c5ef9d54bee03b06b2839a392604fbfcd578ed948b71b37c1d7fb AS builder
ARG SOURCE_DATE_EPOCH

RUN rustup toolchain install nightly-2026-08-01 --profile minimal \
    && rustup default nightly-2026-08-01
LABEL org.opencontainers.image.source="https://github.com/ijl/orjson" \
      org.opencontainers.image.revision="705515d77b28429d0b7c30c3d781abe52e8a1e5a" \
      org.opencontainers.image.licenses="MPL-2.0 AND (Apache-2.0 OR MIT)" \
      hone.capsule="orjson-serialization"

COPY --from=python /usr/local/ /usr/local/
ENV PATH="/usr/local/bin:/usr/local/cargo/bin:${PATH}" \
    RUSTUP_TOOLCHAIN=nightly-2026-08-01 \
    RUSTFLAGS="-Zthreads=1" \
    CARGO_HOME=/usr/local/cargo \
    CARGO_NET_OFFLINE=true \
    CARGO_INCREMENTAL=0 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONHASHSEED=0

COPY image/wheels/ /opt/orjson/wheels/
RUN python -m pip install --no-cache-dir --no-index --find-links=/opt/orjson/wheels \
      maturin==1.9.4 numpy==2.3.3 pytest==9.0.2 faker==37.8.0 \
      python-dateutil==2.9.0.post0 pytz==2025.2

COPY image/cargo/vendor/ /opt/orjson/vendor/
COPY --chmod=0644 image/cargo-config.toml /usr/local/cargo/config.toml
COPY image/prepare-target.py /opt/orjson/prepare-target.py
COPY baseline/ /opt/orjson/source/
RUN cd /opt/orjson/source \
    && CARGO_TARGET_DIR=/opt/orjson/target-template maturin build --release --offline --out /opt/orjson/wheelhouse \
    && python -m pip install --no-index /opt/orjson/wheelhouse/orjson-*.whl \
    && pytest -q test \
    && rm -rf /root/.cache /tmp/*

RUN useradd --uid 2000 --no-create-home --shell /usr/sbin/nologin sandbox

# nodejs: optimizer/proxy relay (node -e); bun + Pi native addon: the sealed
# mutation-worker runtime baked next to bun where the SDK loader's exec-dir
# candidate resolves it. Optimizer-topology runtime the frozen capsule image
# must host so the development-train optimizer (and seed-optimizer pilots)
# can drive this capsule; never used by the trusted evaluator (python3 eval.py).
RUN apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*
COPY --from=mutation /usr/local/bin/bun /usr/local/bin/bun
COPY --from=mutation /usr/local/bin/pi_natives.linux-x64-baseline.node /usr/local/bin/pi_natives.linux-x64-baseline.node
COPY --from=mutation /usr/local/bin/pi_natives.linux-x64-modern.node /usr/local/bin/pi_natives.linux-x64-modern.node
RUN node --version && bun --version \
    && test -f /usr/local/bin/pi_natives.linux-x64-baseline.node \
    && test -f /usr/local/bin/pi_natives.linux-x64-modern.node

FROM rust:1.95.0-bookworm@sha256:4c2fd73ef19c5ef9d54bee03b06b2839a392604fbfcd578ed948b71b37c1d7fb

ARG SOURCE_DATE_EPOCH

LABEL org.opencontainers.image.source="https://github.com/ijl/orjson" \
      org.opencontainers.image.revision="705515d77b28429d0b7c30c3d781abe52e8a1e5a" \
      org.opencontainers.image.licenses="MPL-2.0 AND (Apache-2.0 OR MIT)" \
      hone.capsule="orjson-serialization"

ENV PATH="/usr/local/bin:/usr/local/cargo/bin:${PATH}" \
    RUSTUP_TOOLCHAIN=nightly-2026-08-01 \
    RUSTFLAGS="-Zthreads=1" \
    CARGO_HOME=/usr/local/cargo \
    CARGO_NET_OFFLINE=true \
    CARGO_INCREMENTAL=0 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONHASHSEED=0

RUN --mount=from=builder,source=/usr/local,target=/mnt/usr-local,ro \
    --mount=from=builder,source=/opt,target=/mnt/opt,ro \
    apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/* /var/cache/ldconfig/aux-cache \
       /var/log/alternatives.log /var/log/apt/* /var/log/dpkg.log \
    && useradd --uid 2000 --no-create-home --shell /usr/sbin/nologin sandbox \
    && cp -a /mnt/usr-local/. /usr/local/ \
    && cp -a /mnt/opt/. /opt/ \
    && rm -rf /tmp/cargo-home \
    && setpriv --reuid=2000 --regid=2000 --clear-groups \
      sh -c 'mkdir -p /tmp/cargo-home && cp /usr/local/cargo/config.toml /tmp/cargo-home/config.toml && test -s /tmp/cargo-home/config.toml' \
    && rm -rf /tmp/cargo-home \
    && LC_ALL=C sort -o /usr/local/rustup/toolchains/nightly-2026-08-01-x86_64-unknown-linux-gnu/lib/rustlib/components \
       /usr/local/rustup/toolchains/nightly-2026-08-01-x86_64-unknown-linux-gnu/lib/rustlib/components \
    && find /opt /usr/local -name '.rustc_info.json' -delete \
    && rm -f /usr/local/cargo/.global-cache \
    && find / -xdev -depth \
       ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
       ! -path /dev ! -path /proc ! -path /sys ! -path /mnt ! -path '/mnt/*' \
       -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} + \
    && node --version \
    && bun --version \
    && test -f /usr/local/bin/pi_natives.linux-x64-baseline.node \
    && test -f /usr/local/bin/pi_natives.linux-x64-modern.node \
    && python -c 'import orjson, numpy'
