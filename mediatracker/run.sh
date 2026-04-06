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

# Only export optional credentials if non-empty
[ -n "$IGDB_CLIENT_ID" ] && export IGDB_CLIENT_ID
[ -n "$IGDB_CLIENT_SECRET" ] && export IGDB_CLIENT_SECRET

# Ensure storage directories exist with correct ownership for the 'abc' user
mkdir -p /data/assets /data/logs
chown -R abc:abc /data

# Set HOME to abc's actual home directory.
# su -m preserves env vars (including HOME) from the parent shell.
# Without this, HOME=/root would cause MediaTracker to try creating /root/.mediatracker
# (which abc cannot write to).
export HOME=/home/abc

# Drop privileges and start MediaTracker as 'abc' (uid=1000)
# -m preserves all exported environment variables set above
exec su -m -c "node /app/build/index.js" abc
