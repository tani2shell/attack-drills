# The Service Checker

| | |
|---|---|
| Drill | `hickory` |
| Difficulty | 2/5 (internal calibration) |
| Entry | `http://localhost:28944/` |

## Scenario

A status dashboard: POST it a service name and it shells out to a helper script that checks whether that service is alive. The helper is honest — ask it for help and it prints its own usage, including a mode meant for operators. The front door filters your input against a list of shell metacharacters, but it is a blacklist, not a whitelist.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> Blacklists forget as much as they remember. The helper documents a custom-command mode; feed it arguments the filter never thought to block.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 8 min 19 s (live black-box run, campaign triple-run segment)
- Difficulty band: 2/5
- Path: /check_service -> blacklist lacks space -> helper custom mode args -> eval reads the flag file into the response

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `c4d2b36e`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
