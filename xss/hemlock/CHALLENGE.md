# The Bracket Language

| | |
|---|---|
| Drill | `hemlock` |
| Difficulty | 4/5 (internal calibration) |
| Entry | `http://localhost:28933/` |

## Scenario

A form answer goes straight into a live JavaScript string on the page, and a character filter stands at the gate: no letters, no digits, no angle brackets — every tool the classic payloads reach for is gone. Whatever survives runs in a very old headless browser, and the page only confesses when the script truly fires.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> A dialect of this language exists that needs none of the banned characters. Brackets, parens, bangs, pluses — punctuation alone is a complete vocabulary.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 49 s (strict anchor) / 176 min 16 s (first-contact surface, class-hinted run) — dual-anchor calibration
- Difficulty band: 4/5
- Path: reflection into a JavaScript string -> filter-character recon -> punctuation-only reconstruction -> legacy engine execution -> conditional confirmation echo

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `38d97584`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
