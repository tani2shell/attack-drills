# The Book Lookup

| | |
|---|---|
| Drill | `maple` |
| Difficulty | 2/5 (internal calibration) |
| Entry | `http://localhost:28950/` |

## Scenario

A book-lookup portal: it takes an XML payload describing an inquiry and answers with parsed fields echoed back. Somewhere on the server's filesystem sits a plain text file the app was told about at build time.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> The parser fetches. Declare an external entity that points into the filesystem and let the echo carry the file out.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 615 s (burst segment, machine clock; batch closeout Sum=913 s closed)
- Difficulty band: 2/5
- Path: XML lookup form -> external entity file read -> flag in echoed field

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `6d013f3d`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
