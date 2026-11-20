# Access-control drills

Broken access control (CWE-284/CWE-639): the server checks *that* you are
logged in, not *what* you may touch.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`boxwood`](boxwood/) | Access-control practice drill - the order-receipt page checks your login, but not whose order it is. | 19016 | 99 s |
| [`butternut`](butternut/) | Access-control practice drill - a state-change endpoint acts on any order id you name, then hands you the receipt. | 19017 | 52 s |
| [`buckthorn`](buckthorn/) | Access-control practice drill - a custom identity header is trusted verbatim, and the dashboard obeys it. | 19018 | 569 s |
| [`cacao`](cacao/) | GraphQL practice drill - the query API will happily return fields, and users, you were never supposed to ask for. | 19019 | 80 s |
| [`catalpa`](catalpa/) | Access-control practice drill - the API token is decoded but never verified, so you can re-sign it as anyone. | 19020 | 192 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
