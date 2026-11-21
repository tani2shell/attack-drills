# The One-Word Filter

| | |
|---|---|
| Drill | `vochysia` |
| Difficulty | 3/5 (internal calibration) |
| Entry | `http://localhost:28922/` |

## Scenario

Almost nothing is banned here: a single quoted phrase is deleted and that is the whole filter. Your input lands inside an attribute of an image tag in a page rendered by an old, forgiving browser.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> You are already inside an attribute. The first character of a good payload is the one that gets you out.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: +2 s into the run
- Difficulty band: 3/5
- Path: attribute escape -> event handler -> execution

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
