# Security

## Reporting vulnerabilities

To report a security issue, open a GitHub issue at
https://github.com/muster021/ha-addon-mediatracker/issues

This add-on runs MediaTracker from
https://github.com/muster021/MediaTracker (a fork with HA integration, Sonarr sync,
Discover and streaming availability).

## Known issues

A Trivy scan of the base image identified one remaining HIGH CVE in a devDependency
(`swagger-typescript-api` / lodash) that is only present during the build process
and is not included in the production runtime. It poses no runtime risk.

## This add-on's security posture

- Runs MediaTracker as `abc` (uid=1000), not root
- Only port 7481 is exposed
- IGDB credentials are stored as `password` type in HA (masked in UI, not logged)
- No secrets are echoed or logged in run.sh
- No `host_network` required
- HA Supervisor manages container isolation
- Direct dependencies patched: axios 1.14, fast-xml-parser 5.5, form-data 4.0.5, lodash 4.18, tar-fs 3.1, path-to-regexp 0.1.13
