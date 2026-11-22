# The Reminder Service

| | |
|---|---|
| Drill | `jacaranda` |
| Difficulty | 3/5 (internal calibration) |
| Entry | `http://localhost:28938/` |

## Scenario

A reminder service behind a login anyone could guess. Your date input is not merely inserted into the reply — it is woven into the page's template and rendered a second time by an engine that cannot resist evaluating what it sees. Braces are a question this engine always answers.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> Prove evaluation first, then ask for a file. The engine keeps its own inventory in plain sight.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 0.1 s (payload to flag, internal black-box replay)
- Difficulty band: 3/5
- Path: weak login -> expression evaluation through template context -> object walk -> command execution -> flag read

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `67d93220`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
