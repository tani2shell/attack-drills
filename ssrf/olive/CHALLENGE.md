# The Neighbour's Door

| | |
|---|---|
| Drill | `olive` |
| Difficulty | 2/5 (internal calibration) |
| Entry | `http://localhost:28957/` |

## Scenario

A demo stack with two services: a URL-fetch page facing you, and a plain internal service sitting on the private network behind it. Only the demo page is exposed on the host. The internal service holds the flag and does not care who asks, as long as the asking comes from inside.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> Point the fetcher at its own network — loopback and the docker-internal range are in reach even though your browser cannot see them.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 38 s (black-box run)
- Difficulty band: 2/5 (class-hinted solve window 3-15 min)
- Path: fetch form -> loopback/internal URL -> second service page rendered by proxy -> flag

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `dfa402bf`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
