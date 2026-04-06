# MediaTracker — Documentation

## Overview

MediaTracker is a self-hosted platform for tracking movies, TV shows, video games,
books, and audiobooks. This add-on runs MediaTracker inside Home Assistant.

## First-time setup

1. Install the add-on and click **Start**
2. Open the Web UI via the **Open Web UI** button (or navigate to `http://YOUR-HA-IP:7481`)
3. Register your first user account — the first user automatically becomes the admin
4. Go to **Settings → Configuration** and add your TMDB API key (free, required for metadata)

## Configuration options

| Option | Default | Description |
|--------|---------|-------------|
| `tmdb_lang` | `en` | Language for movie/TV metadata (ISO 639-1) |
| `server_lang` | `en` | UI language (`da`, `de`, `en`, `es`, `fr`, `ko`, `pt`) |
| `audible_lang` | `us` | Audible region for audiobook data (`au`, `ca`, `de`, `es`, `fr`, `in`, `it`, `jp`, `uk`, `us`) |
| `igdb_client_id` | — | Optional: IGDB API key for video game metadata |
| `igdb_client_secret` | — | Optional: IGDB API secret |
| `log_level` | `info` | Logging verbosity |

## Home Assistant Calendar Integration

MediaTracker exposes an iCal feed that Home Assistant can consume natively.
Requires Home Assistant 2025.4 or later.

### Setup

1. In MediaTracker: go to **Settings → Application tokens** and create a new token
2. In Home Assistant: go to **Settings → Devices & Services → Add Integration**
3. Search for **Remote Calendar** and select it
4. Enter the URL:

```
http://YOUR-HA-IP:7481/api/calendar.ics?token=YOUR_TOKEN
```

> Use the IP address of your Home Assistant host, not a `.local` hostname.

The feed shows upcoming episodes for all series on your watchlist (next 90 days).
Append `&days=N` to change the window.

Once added, the calendar entity can be used in automations — for example, to send
a push notification when an episode airs tonight.

## Sonarr Integration

Import all monitored series from Sonarr directly into your MediaTracker watchlist.

1. Go to **Settings → Sonarr**
2. Enter your Sonarr URL (e.g. `http://YOUR-HA-IP:8989`) and API key
3. Click **Test connection** to verify
4. Click **Import from Sonarr** to add all monitored series to your watchlist

Series already on your watchlist are skipped. Safe to re-run at any time.

## IGDB (Video Games)

Video game metadata requires a free IGDB API key from Twitch:

1. Create a free account at [https://api.igdb.com/#account-creation](https://api.igdb.com/#account-creation)
2. Copy your Client ID and Client Secret into the add-on configuration

## Streaming Availability

MediaTracker can show which streaming services (Netflix, HBO Max, Disney+, etc.)
a title is available on, using TMDB watch provider data.

Configure the country in **Settings → Configuration → Watch providers country**
using an ISO 3166-1 alpha-2 code (e.g. `SE`, `NO`, `US`, `GB`).

Streaming data is refreshed automatically during metadata updates (hourly).

## Data & Backups

All persistent data is stored in the add-on's `/data` directory:

- `/data/data.db` — SQLite database
- `/data/assets/` — Poster images and backdrops
- `/data/logs/` — Application logs

Home Assistant automatically includes this data in its backup system.
To restore, simply install the add-on and restore from a HA backup.

## Ports

| Port | Description |
|------|-------------|
| 7481 | Web UI and REST API |

## Support

- MediaTracker: [https://github.com/bonukai/MediaTracker](https://github.com/bonukai/MediaTracker)
- Add-on: [https://github.com/muster021/ha-addon-mediatracker](https://github.com/muster021/ha-addon-mediatracker)
