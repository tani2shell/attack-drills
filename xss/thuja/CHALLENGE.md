# No Filter Needed

| | |
|---|---|
| Drill | `thuja` |
| Difficulty | 2/5 (internal calibration) |
| Entry | `http://localhost:28967/` |

## Scenario

A sibling of the validator app, stripped even further: the greeting page you land on does almost nothing, and there is not a single filter in the request path. Somewhere behind the greeting a delivery channel accepts your payload whole and shows it to the same headless judge with the same strict taste.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> Zero filtering is not zero work — find the delivery channel first; the greeting page says less than it hides. Send the payload where the app listens (POST), and give the judge exactly the alert value it expects.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 8 min 47 s (machine-clock delta; both sibling flags landed in the same delivery)
- Difficulty band: 2/5 (class-hinted solve window 1.5-4 min)
- Path: discovery of the POST-only delivery channel -> zero-filter reflection -> headless execution of the strict alert -> flag

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `fbc71bd0`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
