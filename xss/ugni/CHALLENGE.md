# The Word List, Reflected

| | |
|---|---|
| Drill | `ugni` |
| Difficulty | 3/5 (internal calibration) |
| Entry | `http://localhost:28917/` |

## Scenario

A search page that echoes your query back verbatim, guarded by the same vocabulary of banned toys: script, handlers, svg, single quotes. The renderer downstream is ancient, and ancient browsers are creative about what counts as an event.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> The banned list is about the same length as the list of things browsers invented before 2010.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: flag returned in the same request as the working payload
- Difficulty band: 3/5
- Path: reflected input -> self-triggering element with a non-blacklisted event -> execution

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
