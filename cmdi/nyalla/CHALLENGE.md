# The Honest Ping

| | |
|---|---|
| Drill | `nyalla` |
| Difficulty | 1/5 (internal calibration) |
| Entry | `http://localhost:28954/` |

## Scenario

A ping form that hands you everything: whatever you feed the host field runs, and the raw output is printed back on the page. No filters, no blind spots, no ceremony. A flag file sits at the filesystem root.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> If it echoes, it executes. Terminate the ping and go straight at the flag file.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 2 min 11 s (black-box run)
- Difficulty band: 1/5 (class-hinted solve window 3-15 min)
- Path: metacharacter probe -> single-shot command injection -> read /FLAG.txt from the reflected output

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `0c4850fa`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
