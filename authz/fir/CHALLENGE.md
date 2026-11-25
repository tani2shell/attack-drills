# The Unsigned Badge

| | |
|---|---|
| Drill | `fir` |
| Difficulty | 2/5 (internal calibration) |
| Entry | `http://localhost:28940/` |

## Scenario

A tiny staff portal behind a login you get for free (the demo pair is in the hint). After login it hands you a JWT in a cookie — and then proceeds to read the cookie's claims without ever checking who signed them. The profile page branches on one of those claims, and an admin view hides a link no regular user ever sees.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> The server decodes your badge but never verifies it. Edit the payload, re-encode it the same way the server did, and ask for the admin route.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 8 min 01 s (live black-box run, campaign triple-run segment)
- Difficulty band: 2/5
- Path: demo login (user:user) -> JWT claim tamper role=admin (signature never verified) -> hidden /gettheflag -> flag served from process env

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `06c7e3c3`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
