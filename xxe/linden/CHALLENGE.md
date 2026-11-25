# The Order Desk

| | |
|---|---|
| Drill | `linden` |
| Difficulty | 2/5 (internal calibration) |
| Entry | `http://localhost:28948/` |

## Scenario

An order desk with a SOAP service. The WSDL is public, and the service endpoint takes your XML as posted — no envelope ceremony required. XML that gets parsed is XML that can ask the parser to do errands.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> Read the WSDL, then give the parser an entity definition that points at a local file. The flag lives at the path the desk itself told you about.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 20 s (burst segment, machine clock; batch closeout Sum=2211 s closed)
- Difficulty band: 2/5
- Path: public WSDL -> anonymous SOAP POST -> XXE file:///app/flag.txt -> flag echoed in response

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `d666d220`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
