#!/bin/sh
set -e

# Read user options from /data/options.json (written by HA Supervisor)
# Use jq with default fallbacks — never echo secret values
TMDB_LANG=$(jq -r '.tmdb_lang // "en"' /data/options.json)
SERVER_LANG=$(jq -r '.server_lang // "en"' /data/options.json)
AUDIBLE_LANG=$(jq -r '.audible_lang // "us"' /data/options.json)
IGDB_CLIENT_ID=$(jq -r '.igdb_client_id // ""' /data/options.json)
IGDB_CLIENT_SECRET=$(jq -r '.igdb_client_secret // ""' /data/options.json)

# Persistent storage — all under /data (HA backs this up automatically)
export DATABASE_PATH="/data/data.db"
export ASSETS_PATH="/data/assets"
export LOGS_PATH="/data/logs"

export TMDB_LANG
export SERVER_LANG
export AUDIBLE_LANG
export PORT=7481
export HOSTNAME=0.0.0.0
export NODE_ENV=production
export HOME=/home/abc

# Only export optional credentials if non-empty
[ -n "$IGDB_CLIENT_ID" ] && export IGDB_CLIENT_ID
[ -n "$IGDB_CLIENT_SECRET" ] && export IGDB_CLIENT_SECRET

# Ensure storage directories exist and are writable by uid 1000
mkdir -p /data/assets /data/logs
chown -R 1000:1000 /data

# Drop privileges to uid 1000 (abc) and start MediaTracker.
# su-exec sets uid/gid directly without username lookup — works even if
# /etc/passwd is not accessible in the container context.
exec su-exec 1000:1000 /usr/local/bin/node /app/build/index.js
