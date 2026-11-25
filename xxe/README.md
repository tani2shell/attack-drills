# XML external entity drills

XXE drills (CWE-611): parsers that fetch more than documents — define an
external entity and the local filesystem answers your questions.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`spruce`](spruce/) | XXE · SVG upload parser trusts external entities · local file read in the echo. | 28913 | 27 s |
| [`linden`](linden/) | XXE file-read drill — the SOAP parser will read whatever file you name. | 28948 | 20 s |
| [`maple`](maple/) | XXE file-read drill — the lookup service parses XML on your behalf and echoes the file back. | 28950 | 615 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
