# Business-logic drills

Business-logic flaws (CWE-840): every step passes validation on its own; the
sequence is what lies.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`gooseberry`](gooseberry/) | Business-logic practice drill - the login check juggles types, and an array slides straight through the string comparison. | 28907 | 78 s |
| [`ozark`](ozark/) | Profile-update business logic — overwrite the identity field on the wire and read back. | 28960 | 3 min 5 s (black-box run) |
| [`sumac`](sumac/) | Business-logic practice drill — browser-side puzzle gate · the server never asks if you solved it — the server never asks if you solved it. | 28914 | 19 s |
| [`sycamore`](sycamore/) | Business-logic practice drill — internal-origin header gate · forge the source address, walk right in — forge the source address, walk right in. | 28915 | 6 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
