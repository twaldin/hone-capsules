# syntax=docker/dockerfile:1.7@sha256:a57df69d0ea827fb7266491f2813635de6f17269be881f696fbfdf2d83dda33e
FROM node:20.19.4-bookworm@sha256:572a90df10a58ebb7d3f223d661d964a6c2383a9c2b5763162b4f631c53dc56a AS node-runtime
FROM hone-mutation@sha256:e43b8871710267d86f3e1118b2f9a3d8ef0ab505b14e671da9728200260dcd10 AS mutation-runtime
FROM python:3.12.11-bookworm@sha256:1b48a1b13ec678be8d84974541cc007d4367aaf01f985231daad1a940106efc0
ARG SOURCE_DATE_EPOCH

# Optimizer topology only: the trusted evaluator remains Python. Each copied
# native binary is inherited from a content-addressed stage and hash-checked.
COPY --from=node-runtime /usr/local/bin/node /usr/local/bin/node
COPY --from=mutation-runtime /usr/local/bin/bun /usr/local/bin/bun
COPY --from=mutation-runtime /usr/local/bin/pi_natives.linux-x64-baseline.node /usr/local/bin/pi_natives.linux-x64-baseline.node
COPY --from=mutation-runtime /usr/local/bin/pi_natives.linux-x64-modern.node /usr/local/bin/pi_natives.linux-x64-modern.node
RUN printf '%s  %s\n' \
      '43d6cf63f2a460b463eba6b19df5e9a259771c56f11b5130e04178a15bb99490' /usr/local/bin/node \
      '9fd36f87e4b90b07632b987a2e4ec81ca15a62c81bf983190cea6d715be2ad74' /usr/local/bin/bun \
      'c6fccbbfb79fd27c50a6eb73ae6ab3d973cee268a9b7e39fb1745efd24779526' /usr/local/bin/pi_natives.linux-x64-baseline.node \
      'abed9aa371b088d7c223ff73bb741e620d514ad3a6ef90dbfbf8a5944f88bb7c' /usr/local/bin/pi_natives.linux-x64-modern.node \
    | sha256sum --check --strict \
    && node --version \
    && bun --version
