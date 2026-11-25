# Static Charge

| | |
|---|---|
| Drill | `padauk` |
| Difficulty | 1/5 (internal calibration) |
| Entry | `http://localhost:28961/` |

## Scenario

A tiny Apache-hosted app with a login front and a static resource area that builds its file path from a query parameter. The login page carries a developer's parting comment, left there for whoever came next. A file named like a flag is sitting in the static tree.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> View source on the front page first. Then treat the static include parameter as a file reader — the flag name is one of the comments' gifts.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 44 s (black-box run)
- Difficulty band: 1/5 (class-hinted solve window 0.5-3 min)
- Path: HTML comment harvest -> static include parameter discovery -> direct read of the flag-named file

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `14809859`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
