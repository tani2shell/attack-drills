# Command-injection drills

OS command injection (CWE-78): the application shells out with your input
still inside the quotes.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`feijoa`](feijoa/) | Command-injection practice drill - a WordPress plugin panel pipes form values straight into a shell. | 28903 | 1580 s |
| [`frangipani`](frangipani/) | Command-injection practice drill - the URL validator pings whatever you paste; shell separators do the rest. | 28905 | 201 s |
| [`hickory`](hickory/) | Command-injection blacklist bypass drill — the filter blocks separators but not spaces. | 28944 | 8 min 19 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
