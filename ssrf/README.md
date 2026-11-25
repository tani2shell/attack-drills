# SSRF drills

Server-side request forgery (CWE-918): the application fetches URLs on your
behalf — and never asks where they lead.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`hackberry`](hackberry/) | SSRF practice drill - the fetch gateway trusts the config you can steer, and an internal eval endpoint answers to you. | 28909 | 827 s |
| [`olive`](olive/) | Two-service SSRF demo — pivot through the fetcher to the service the browser can't see. | 28957 | 38 s (black-box run) |
| [`oregon`](oregon/) | Server-side URL fetch & render — make the page fetch what it was never meant to show. | 28958 | 1 min 57 s (black-box run) |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
