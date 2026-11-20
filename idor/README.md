# IDOR drills

Insecure direct object references & trusted-client flaws (CWE-639/CWE-565):
identifiers and cookies taken at face value.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`cherry`](cherry/) | IDOR practice drill - the login form accepts an identity field you were not meant to touch. | 19021 | 262 s |
| [`chestnut`](chestnut/) | IDOR practice drill - the password-change endpoint takes a user id from the request, so you can reset anyone's password. | 19022 | 1715 s |
| [`clementine`](clementine/) | IDOR practice drill - draft ids are sequential and the edit screen forgets to ask who owns the draft. | 19023 | 43 s |
| [`coffee`](coffee/) | IDOR practice drill - object ids look random until you notice the timestamp hiding in front of them. | 19024 | 393 s |
| [`cottonwood`](cottonwood/) | IDOR practice drill - the session cookie is encrypted but not signed; one flipped block and you are someone else. | 19025 | 571 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
