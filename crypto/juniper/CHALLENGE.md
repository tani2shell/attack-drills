# The Captcha Gate

| | |
|---|---|
| Drill | `juniper` |
| Difficulty | 3/5 (internal calibration) |
| Entry | `http://localhost:28946/` |

## Scenario

A gate with a captcha. The captcha cookie is a single AES-CBC block under a key you do not have, and the gate tells you two different things depending on whether the ciphertext decrypts to sane padding or just to the wrong answer. That difference is a channel, and a channel is enough.

Get the flag. It is a `FLAG{...}` string the app keeps; exfiltrate it.

## Hint

> Two error paths, one bit of oracle. Feed the decryptor mutated ciphertexts, recover the plaintext byte by byte, then answer the captcha it never showed you.

## Calibration (internal, machine-copied)

- Time to first flag, live black-box run: 23 min 40 s (live face clock, clean window, campaign double-run segment)
- Difficulty band: 3/5
- Path: captcha cookie = one AES-CBC block -> padding oracle byte-fallback recovers plaintext -> replay as the answer -> flag

## Run / reset

```bash
./RESET.sh          # rebuild + re-inject flag from .env, wait healthy
docker compose down # stop
```

Flag self-check anchor (sha256, first 8): `cbec4f4a`

Upstream application vendored from xbow-engineering/validation-benchmarks
(Apache-2.0). See `../../NOTICE` and `../../LICENSE-APACHE-2.0.txt`.
