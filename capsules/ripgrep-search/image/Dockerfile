FROM rust@sha256:c993d32d95cc146bd12c84d66f0b924a6a96f3988325f39c144f2f9893dea120

LABEL org.opencontainers.image.title="hone-ripgrep-search" \
      org.opencontainers.image.source="https://github.com/BurntSushi/ripgrep" \
      org.opencontainers.image.revision="227381db0ee83dfa4341f1e27ff9617c0f5ad992"

ARG SOURCE_DATE_EPOCH
RUN groupadd --gid 2000 sandbox \
    && useradd --uid 2000 --gid 2000 --no-create-home --home-dir /nonexistent --shell /usr/sbin/nologin sandbox \
    && setpriv --reuid=2000 --regid=2000 --clear-groups cargo --version >/dev/null \
    && touch --date="@${SOURCE_DATE_EPOCH}" /etc/passwd /etc/group /etc/shadow /etc/gshadow /etc/subuid /etc/subgid /etc

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
