# Path traversal / file inclusion drills

| Drill | Angle | Port | Notes |
|---|---|---|---|
| [`birch`](birch/) | Stock Apache 2.4.49 — `.%2e` traversal → CGI RCE | 18942 | known-CVE era box, no custom code |

Arm: `cd birch && cp .env.example .env && docker compose up -d --build`,
then `./RESET.sh` restores factory state (it health-gates the CGI execution
channel, which occasionally comes up half-alive after a rebuild).
Full calibration table: [series README](../README.md).
