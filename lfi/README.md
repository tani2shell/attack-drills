# Path traversal / file inclusion drills

| Drill | One-line | Port | Notes |
|---|---|---|---|
| [`birch`](birch/) | Path-traversal practice drill — stock Apache 2.4.49 `.%2e` traversal (CVE-2021-41773 era) escalated to CGI RCE. | 18942 | known-CVE era box, no custom code |

Arm: `cd birch && cp .env.example .env && docker compose up -d --build`,
then `./RESET.sh` restores factory state (it health-gates the CGI execution
channel, which occasionally comes up half-alive after a rebuild).
Full calibration table: [series README](../README.md).
