# Doors Left Open

| | |
|---|---|
| Drill | `osage` |
| Difficulty | 2/5 (internal calibration) |
| Entry | `http://localhost:28959/` |

## Scenario

A small authenticated app: a login gate, an upload corner, and a viewer for what gets uploaded. The gatekeeper was handed the combo on a laminated card and nobody ever saw fit to change it. The upload corner checks names, not natures.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> Try the laminated combo before brute-forcing your way to embarrassment. Then remember: a filter on the file name is not a filter on the file contents — and the drop folder is served as code.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 7 min 20 s (black-box run; ~6 min weak-credential enumeration tax)
- Difficulty band: 2/5 (class-hinted solve window 3-15 min)
- Path: default-credential login -> polyglot upload past the name check -> server executes the drop -> viewer hands back flag

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `a7bc4b0d`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
