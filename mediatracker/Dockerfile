ARG BUILD_FROM=ghcr.io/muster021/mediatracker:0.2.12
FROM $BUILD_FROM

# jq is needed to parse /data/options.json written by HA Supervisor
RUN apk add --no-cache jq su-exec

COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Override the base image's entrypoint (which handles PUID/PGID — not needed in HA)
# HA Supervisor manages container lifecycle; our run.sh handles all setup
ENTRYPOINT ["/run.sh"]
