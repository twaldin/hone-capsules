# syntax=docker/dockerfile:1
FROM docker.io/library/golang@sha256:5a94593d87a066df5abb02969be911524963f53908292aa5a1a6096fc019012a

ARG DEBIAN_SNAPSHOT=20260713T000000Z
ARG SOURCE_DATE_EPOCH
RUN printf '%s\n' \
      "deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/${DEBIAN_SNAPSHOT}/ bookworm main" \
      > /etc/apt/sources.list \
    && rm -f /etc/apt/sources.list.d/* \
    && apt-get -o Acquire::Check-Valid-Until=false update \
    && find /var/lib/apt/lists -type f -exec sha256sum {} + | sort -k2 \
    && apt-get --download-only install -y --no-install-recommends \
      nodejs=18.20.4+dfsg-1~deb12u2 python3=3.11.2-1+b1 \
    && find /var/cache/apt/archives -type f -name '*.deb' -exec sha256sum {} + | sort -k2 \
    && apt-get --no-download install -y --no-install-recommends \
      nodejs=18.20.4+dfsg-1~deb12u2 python3=3.11.2-1+b1 \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb \
      /var/cache/ldconfig/aux-cache /var/log/alternatives.log /var/log/apt/* /var/log/dpkg.log \
    && find / -xdev -depth \
      ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
      ! -path /dev ! -path /proc ! -path /sys \
      -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +

ENV GOTOOLCHAIN=local \
    GOPROXY=off \
    GOSUMDB=off \
    GOFLAGS=-mod=vendor \
    CGO_ENABLED=0 \
    HOME=/tmp/hone-home \
    GOCACHE=/tmp/hone-go-cache-anchor \
    GOCACHEPROG=/usr/local/bin/hone-go-cache

RUN --mount=type=bind,source=toolchain/cacheprog.py,target=/tmp/cacheprog.py,readonly \
    --mount=type=bind,source=baseline,target=/tmp/baseline,readonly \
    install -m 0555 /tmp/cacheprog.py /usr/local/bin/hone-go-cache \
    && mkdir -p /workspace /opt/hone-go-cache \
    && cp -a /tmp/baseline/. /workspace/ \
    && cd /workspace \
    && GOCACHE=/opt/hone-go-cache GOCACHEPROG= go test -c -trimpath -ldflags='-s -w' -o /tmp/js-parser.test ./internal/js_parser \
    && (cd /workspace/internal/js_parser && /tmp/js-parser.test -test.timeout=150s) \
    && GOCACHE=/opt/hone-go-cache GOCACHEPROG= go test -c -trimpath -ldflags='-s -w' -o /tmp/bundler.test ./internal/bundler_tests \
    && (cd /workspace/internal/bundler_tests && /tmp/bundler.test -test.timeout=150s) \
    && rm -f /tmp/js-parser.test /tmp/bundler.test \
    && GOCACHE=/opt/hone-go-cache GOCACHEPROG= go build -trimpath -ldflags='-s -w' ./cmd/esbuild \
    && python3 -c 'import pathlib,os; epoch=os.environ["SOURCE_DATE_EPOCH"]+"000000000"; files=pathlib.Path("/opt/hone-go-cache").glob("*/*-a"); [(p.write_text(" ".join((*p.read_text().split()[:4],epoch))+"\n")) for p in files]' \
    && rm -f /opt/hone-go-cache/trim.txt \
    && rm -rf /tmp/hone-home/.config/go/telemetry \
    && find / -xdev -depth \
      ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
      ! -path /dev ! -path /proc ! -path /sys \
      ! -path /tmp/cacheprog.py ! -path '/tmp/baseline*' \
      -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +

WORKDIR /workspace
