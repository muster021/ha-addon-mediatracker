# MediaTracker — Home Assistant Add-on

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A Home Assistant add-on for [MediaTracker](https://github.com/bonukai/MediaTracker) —
a self-hosted platform for tracking movies, TV shows, video games, books and audiobooks.

## Features

- Track movies, TV shows, video games, books and audiobooks
- **Home Assistant calendar integration** — upcoming episodes appear directly in the HA calendar (iCal feed via Remote Calendar integration)
- **Sonarr sync** — import your monitored Sonarr series with one click
- **Discover** — browse trending TV shows from TMDB
- **Streaming availability** — see which streaming services carry a title
- Notifications via Gotify, ntfy, Pushbullet, Discord, Pushover, Pushsafer
- Multiple user accounts
- REST API

## Installation

1. In Home Assistant, go to **Settings → Add-ons → Add-on Store**
2. Click the **⋮** menu (top right) → **Repositories**
3. Add: `https://github.com/muster021/ha-addon-mediatracker`
4. Find **MediaTracker** in the store and click **Install**

## Home Assistant Calendar

After installing, follow these steps to add MediaTracker episodes to your HA calendar:

1. Open MediaTracker → **Settings → Application tokens** → create a token
2. In HA: **Settings → Devices & Services → Add Integration → Remote Calendar**
3. URL: `http://YOUR-HA-IP:7481/api/calendar.ics?token=YOUR_TOKEN`

See [DOCS.md](mediatracker/DOCS.md) for full documentation.

## Attribution

Powered by [MediaTracker](https://github.com/bonukai/MediaTracker) by bonukai — [MIT License](https://github.com/bonukai/MediaTracker/blob/main/LICENSE.md).

This add-on packages MediaTracker for Home Assistant. It is not affiliated with the
original project.
