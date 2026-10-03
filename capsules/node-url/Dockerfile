FROM debian@sha256:9bb8a3626890e084ab54e888fdd7c4b6d2f119071cd4c5dc5fecb4d73062aa5f

ARG NODE_REVISION=9df0e9b4d4a5be5ce7506fae44acb6667bb68d6b
ARG DEBIAN_SNAPSHOT=20260713T000000Z
ARG SOURCE_DATE_EPOCH
ENV DEBIAN_FRONTEND=noninteractive \
    CC=gcc \
    CXX=g++ \
    LDFLAGS=-fuse-ld=lld \
    PYTHON=/usr/bin/python3 \
    NODE_TEST_NO_INTERNET=1 \
    NO_COLOR=1

RUN printf '%s\n' \
      "deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/${DEBIAN_SNAPSHOT}/ trixie main" \
      > /etc/apt/sources.list \
    && rm -f /etc/apt/sources.list.d/* \
    && apt-get -o Acquire::Check-Valid-Until=false update \
    && find /var/lib/apt/lists -type f -exec sha256sum {} + | sort -k2 \
    && apt-get --download-only install -y --no-install-recommends \
      build-essential lld ninja-build python3 time \
    && find /var/cache/apt/archives -type f -name '*.deb' -exec sha256sum {} + | sort -k2 \
    && apt-get --no-download install -y --no-install-recommends \
      build-essential lld ninja-build python3 time \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb \
      /var/cache/ldconfig/aux-cache /var/log/alternatives.log /var/log/apt/* /var/log/dpkg.log \
    && useradd --uid 2000 --user-group --no-create-home --shell /usr/sbin/nologin sandbox \
    && mkdir -p /opt/node \
    && find / -xdev -depth \
      ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
      ! -path /dev ! -path /proc ! -path /sys \
      -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +

COPY image-source /opt/node
WORKDIR /opt/node

RUN printf '%s\n' "$NODE_REVISION" > source-revision.txt \
    && ./configure --ninja --without-npm --without-amaro --without-ssl --without-intl --without-inspector \
    && find /opt/node -xdev -depth \
      -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +

RUN --mount=type=bind,source=image/normalize_ninja_cache.py,target=/tmp/normalize_ninja_cache.py,readonly \
    ninja -C out/Release node -j2 \
    && out/Release/node -p 'process.versions.node' \
    && python3 tools/test.py --mode=release parallel/test-whatwg-url-custom-parsing parallel/test-url-format-whatwg \
    && python3 /tmp/normalize_ninja_cache.py out/Release "${SOURCE_DATE_EPOCH}" \
    && chmod -R a+rX /opt/node \
    && chmod -R a+rwX /opt/node/out /opt/node/src /opt/node/lib/internal/url.js /opt/node/deps/ada \
    && rm -f /usr/bin/git \
    && find / -xdev -depth \
      ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
      ! -path /dev ! -path /proc ! -path /sys \
      ! -path /tmp/normalize_ninja_cache.py \
      -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +

ENV PATH=/opt/node/out/Release:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
VOLUME ["/opt/node"]
ENTRYPOINT []
CMD ["/bin/sh"]
