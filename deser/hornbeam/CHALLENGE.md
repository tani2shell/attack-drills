# The Bookmark Shelf

| | |
|---|---|
| Drill | `hornbeam` |
| Difficulty | 3/5 (internal calibration) |
| Entry | `http://localhost:28936/` |

## Scenario

A small bookmark shelf behind a login. The cookie it hands you is not a token — it is a serialized object, base64-encoded, and the app unpacks it back into its own data structures. The unpacker does not ask what you sent; it simply rebuilds it. Anything that can be rebuilt can be asked to run an errand on the way in.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> A deserializer that trusts its input is an execution point wearing a coat. Craft an object whose reconstruction has side effects.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 0.8 s (payload to flag, internal black-box replay)
- Difficulty band: 3/5
- Path: session-cookie object injection -> reconstruction side effect -> command execution -> out-of-band read via the static directory

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `7de536f6`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
