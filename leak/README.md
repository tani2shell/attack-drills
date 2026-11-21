# Information-disclosure drills

Source-leak and secret-exposure drills (CWE-200 family): the application
talks about itself more than it should — a readable source face, a browsing
object store — and the flag falls out of what it reveals.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`sassafras`](sassafras/) | Source leak · hardcoded creds on the source face · replayed on an SSH side door. | 28911 | 8 s |
| [`sequoia`](sequoia/) | Source leak · browsable object store on a second port · base64 passed off as encryption. | 28912 | same second ⁵ |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
