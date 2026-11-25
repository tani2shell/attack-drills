# NoSQL / document-query drills

Query-language injection (CWE-89 in document stores): filters and fields
forwarded verbatim into a document query layer — the "string" you send is
an operator the database obeys.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`hazel`](hazel/) | GraphQL operator-injection drill — the search filter reaches the database unquoted. | 28941 | 8 min 43 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
