# The Letter They Forgot

| | |
|---|---|
| Drill | `holly` |
| Difficulty | 3/5 (internal calibration) |
| Entry | `http://localhost:28934/` |

## Scenario

A greeting page screens your input through a regular expression before a legacy headless browser ever sees it. The pattern kills the famous tag openings by range — and in sweeping the alphabet it left one boundary unguarded. Meanwhile some elements don't need any script to act; they only need to be asked for focus.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> If the pattern sweeps a range, test the range's edges. An element that takes focus runs events uninvited.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 1.2 s (payload to flag, internal black-box replay)
- Difficulty band: 3/5
- Path: regex range recon -> surviving capital element -> focus-event handler -> execution

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `cfe2aea7`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
