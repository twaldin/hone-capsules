FROM docker.io/library/debian@sha256:63a496b5d3b99214b39f5ed70eb71a61e590a77979c79cbee4faf991f8c0783e

ARG DEBIAN_SNAPSHOT=20260713T000000Z
ARG SOURCE_DATE_EPOCH

RUN printf '%s\n' \
    "deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/${DEBIAN_SNAPSHOT}/ bookworm main" \
    > /etc/apt/sources.list \
  && rm -f /etc/apt/sources.list.d/* \
  && apt-get -o Acquire::Check-Valid-Until=false update \
  && find /var/lib/apt/lists -type f -exec sha256sum {} + | sort -k2 \
  && apt-get --download-only install -y --no-install-recommends \
    build-essential=12.9 \
    ca-certificates=20230311+deb12u1 \
    python3=3.11.2-1+b1 \
    tcl=8.6.13 \
    tcl-dev=8.6.13 \
    util-linux=2.38.1-5+deb12u3 \
  && find /var/cache/apt/archives -type f -name '*.deb' -exec sha256sum {} + | sort -k2 \
  && apt-get --no-download install -y --no-install-recommends \
    build-essential=12.9 \
    ca-certificates=20230311+deb12u1 \
    python3=3.11.2-1+b1 \
    tcl=8.6.13 \
    tcl-dev=8.6.13 \
    util-linux=2.38.1-5+deb12u3 \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb \
    /var/cache/ldconfig/aux-cache /var/log/alternatives.log /var/log/apt/* /var/log/dpkg.log \
  && find / -xdev -depth \
    ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
    ! -path /dev ! -path /proc ! -path /sys \
    -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +

RUN useradd --create-home --uid 1000 hone \
  && useradd --no-create-home --uid 2000 --shell /usr/sbin/nologin sandbox \
  && find / -xdev -depth \
    ! -path /etc/hosts ! -path /etc/hostname ! -path /etc/resolv.conf \
    ! -path /dev ! -path /proc ! -path /sys \
    -exec touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" {} +

WORKDIR /workspace
USER hone
