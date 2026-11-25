# Three Gates Deep

| | |
|---|---|
| Drill | `ironwood` |
| Difficulty | 3/5 (internal calibration) |
| Entry | `http://localhost:28945/` |

## Scenario

An admin router fronted by a reverse proxy fronted by a load balancer — three parsers in a row, each with its own opinion about where one request ends and the next begins. Default credentials work on the login. The edge rewrites the Host header, so inner virtual hosts you cannot name from outside still answer inside.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> Do not fight the Host rewrite — exploit the disagreement between the three parsers. Desynchronize the request boundary at one hop so the next hop reads a request the first one never saw.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 85 min 15 s (live face clock, claim to flag, includes 302 s recovery tax; official upstream level: hard)
- Difficulty band: 3/5
- Path: default credentials (test:test) -> keep-alive desync across reverse-proxy/LB/web-server chain -> inner vhost route -> flag file

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `4c1ef7ee`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
