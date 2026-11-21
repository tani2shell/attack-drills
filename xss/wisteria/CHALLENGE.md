# One Tag May Pass

| | |
|---|---|
| Drill | `wisteria` |
| Difficulty | 4/5 (internal calibration) |
| Entry | `http://localhost:28926/` |

## Scenario

The filter strips every tag except one - the page's own markup contains that same tag, and browsers have opinions about what happens when two of them meet. The rendering engine downstream is old and merges things creatively.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> Your survivor does not have to be the executable. It just has to arrive first.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: +11 s into the run (corrected anchor)
- Difficulty band: 4/5
- Path: survivor-tag merge -> page's own element gets a new lease on events -> execution

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
