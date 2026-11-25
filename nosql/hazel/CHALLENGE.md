# The Directory Desk

| | |
|---|---|
| Drill | `hazel` |
| Difficulty | 2/5 (internal calibration) |
| Entry | `http://localhost:28941/` |

## Scenario

A user directory with a JSON query desk in front of a document database. The desk happily tells you every field it stores — including one column the web UI never shows, and a couple of accounts whose rows carry more than names. The search filter is forwarded to the database almost verbatim, which means it speaks more than plain strings.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> The search value is not a string to the database — it accepts query operators. Ask the desk for the column the UI hides.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 8 min 43 s (live black-box run, campaign triple-run segment)
- Difficulty band: 2/5
- Path: /api/users GraphQL surface -> NoSQL operator pass-through in the search filter -> admin row -> flag column

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `e5854df8`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
