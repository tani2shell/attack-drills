# Smuggling drills

HTTP request smuggling (CWE-444): proxies in series that disagree about
where one request ends and the next begins.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`ironwood`](ironwood/) | HTTP request smuggling drill — three parsers in a row disagree about request boundaries. | 28945 | 85 min 15 s ⁷ |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md). `ironwood`'s figure is a live face-clock run
(claim to flag, includes a 302 s recovery tax) — see note ⁷ in the series
README.

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
