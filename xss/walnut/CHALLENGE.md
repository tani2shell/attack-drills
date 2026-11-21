# The Famous Tags Only

| | |
|---|---|
| Drill | `walnut` |
| Difficulty | 3/5 (internal calibration) |
| Entry | `http://localhost:28923/` |

## Scenario

The filter deletes a handful of famous HTML tags plus some punctuation, then hands your leftovers to an old browser. The list of tags a browser understands is longer than the list of tags this filter has heard of.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> Not every executable element is in a beginner's cheat sheet.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: +39 s into the run (corrected anchor)
- Difficulty band: 3/5
- Path: unbanned element + handler -> execution

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
