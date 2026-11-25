# Write Yourself In

| | |
|---|---|
| Drill | `ozark` |
| Difficulty | 2/5 (internal calibration) |
| Entry | `http://localhost:28960/` |

## Scenario

A two-step app: register an account, then edit your profile. The profile editor is friendly — it takes your word for who you are, in the body of the request, where you are free to edit that too. Some records are worth more than others.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> The update endpoint trusts a field that should only exist server-side. Register a second account, then overwrite the identity on the wire and read back what is not yours.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 3 min 5 s (black-box run)
- Difficulty band: 2/5 (class-hinted solve window 3-15 min)
- Path: dual-account baseline -> profile-update request capture -> identity parameter overwrite -> privileged record read -> flag

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `a3bb9409`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
