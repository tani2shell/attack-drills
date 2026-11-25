# Crypto-oracle drills

Cryptographic implementation leaks: the oracle answers differently
depending on what happens inside the cipher — and that difference
decrypts without the key.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`juniper`](juniper/) | AES-CBC padding-oracle drill — the captcha checker leaks padding validity through its error messages. | 28946 | 23 min 40 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
