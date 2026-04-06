# Security

## Reporting vulnerabilities

To report a security issue in this add-on wrapper, open a GitHub issue at
https://github.com/muster021/ha-addon-mediatracker/issues

For vulnerabilities in MediaTracker itself, please contact the upstream project at
https://github.com/bonukai/MediaTracker

## Known issues in upstream dependencies

A Trivy scan of the `bonukai/mediatracker:0.2.11` base image identified several
HIGH/CRITICAL CVEs in Node.js dependencies. These cannot be fixed in this add-on
wrapper — they require upstream updates to MediaTracker.

| Package | CVE | Severity | Summary |
|---------|-----|----------|---------|
| axios | CVE-2026-25639 | HIGH | DoS via `__proto__` key in mergeConfig |
| fast-xml-parser | CVE-2026-25896 | CRITICAL | XSS via improper DOCTYPE entity handling |
| fast-xml-parser | CVE-2026-26278 | HIGH | DoS via XML entity expansion |
| fast-xml-parser | CVE-2026-33036 | HIGH | DoS via XML entity expansion bypass |
| form-data | CVE-2025-7783 | CRITICAL | Unsafe random function |
| lodash | CVE-2026-4800 | HIGH | Arbitrary code execution via template imports |
| path-to-regexp | CVE-2026-4867 | HIGH | DoS via catastrophic backtracking |
| tar-fs | CVE-2024-12905 | HIGH | Path traversal via malicious tar file |
| tar-fs | CVE-2025-48387 | HIGH | Extract writes outside specified directory |
| tar-fs | CVE-2025-59343 | HIGH | Symlink validation bypass |

### Risk context

MediaTracker is a **local network service** intended for personal home use.
The above CVEs are primarily relevant if MediaTracker is exposed to untrusted users
or the public internet. For typical home use behind a local network, the practical
risk is low.

Do not expose port 7481 to the public internet without proper authentication
and a reverse proxy with TLS.

## This add-on's security posture

- Runs MediaTracker as `abc` (uid=1000), not root
- Only port 7481 is exposed
- IGDB credentials are stored as `password` type in HA (masked in UI, not logged)
- No secrets are echoed or logged in run.sh
- No `host_network` required
- HA Supervisor manages container isolation
