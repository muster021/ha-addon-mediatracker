FROM ghcr.io/muster021/mediatracker:0.2.13

# jq to parse /data/options.json, su-exec to drop privileges
RUN apk add --no-cache jq su-exec

COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT ["/run.sh"]
