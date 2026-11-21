# The Gallery That Parses Too Much

| | |
|---|---|
| Drill | `spruce` |
| Difficulty | 2/5 (upper band) (internal calibration) |
| Entry | `http://localhost:28913/` |

## Scenario

An image gallery that accepts SVG uploads. Anyone who has read an SVG has read XML wearing a costume, and this parser is not the shy type: it resolves things it probably should not. It will also gladly tell you whether your file exists.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> External entities, and the oldest scheme a parser speaks: file://

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: +27 s into the run, flag in the same request
- Difficulty band: 2/5 (upper band)
- Path: SVG upload -> external entity -> local file read

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
