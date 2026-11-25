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
| [`ginkgo`](ginkgo/) | Access-control practice drill - the admin gate checks your role but not your HTTP verb, so a method swap walks right in. | 28906 | 166 s |
| [`guava`](guava/) | Access-control practice drill - the login form compares password hashes with loose typing, and a magic 0e hash logs you in. | 28908 | 42.2 s |
| [`hawthorn`](hawthorn/) | Access-control practice drill - roles are asserted client-side and the second factor stamps whatever you send it. | 28910 | 2044.6 s |
| [`ipecac`](ipecac/) | Access-control practice drill - demo credentials get you in the door; a race in the gatekeeper's re-check gets you past the gate. | 28937 | 1.7 s |
| [`fir`](fir/) | JWT signature-bypass privilege drill — the app decodes the role claim but never verifies it. | 28940 | 8 min 01 s |
| [`myrtle`](myrtle/) | Trust-boundary parameter drill — a boolean the form never shows decides who is admin. | 28951 | 23 s |
| [`oak`](oak/) | Cookie-identity authz gap — walk the identity space, read someone else's private record. | 28956 | 6 min (black-box run; ~5 min of it is identity-value enumeration) |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md). `ipecac` books payload-to-flag replay time from
the closeout black-box replay (race window: second replay 5.6 s) — see
note ⁶ in the series README.

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
