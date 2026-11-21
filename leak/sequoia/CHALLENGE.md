# Two Front Doors

| | |
|---|---|
| Drill | `sequoia` |
| Difficulty | 3/5 (internal calibration) |
| Entry | `http://localhost:28912/` |

There is a second door: this drill also publishes a port on `127.0.0.1:28943` (S3_PORT in `.env`).

## Scenario

One box, two front doors: a web app and what looks like its private object store, both behind the same nginx, each on its own port. The store happily introduces itself and lists what it holds. One credential inside is protected the way base64 protects things. The app has an area that only certain tokens may enter.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> What is listening on the second port? Object stores like to be browsed. And nothing is more fragile than an encoding called 'encryption'.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: same second as the first working payload (internal black-box run)
- Difficulty band: 3/5
- Path: port discovery -> object-store listing -> backup fetch -> decode credential -> token mint -> privileged area

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
