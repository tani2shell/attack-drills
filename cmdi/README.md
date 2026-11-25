# Command-injection drills

OS command injection (CWE-78): the application shells out with your input
still inside the quotes.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`feijoa`](feijoa/) | Command-injection practice drill - a WordPress plugin panel pipes form values straight into a shell. | 28903 | 1580 s |
| [`frangipani`](frangipani/) | Command-injection practice drill - the URL validator pings whatever you paste; shell separators do the rest. | 28905 | 201 s |
| [`hickory`](hickory/) | Command-injection blacklist bypass drill — the filter blocks separators but not spaces. | 28944 | 8 min 19 s |
| [`neem`](neem/) | Blind command-injection ping form — build a time oracle and extract the flag bit by bit. | 28952 | 2 min 43 s (black-box run; 98-query blind time-oracle extraction, acceptor replay 251 queries/146.5 s as factory reference) |
| [`nutmeg`](nutmeg/) | Filtered command-injection ping — map the filter, then forge the parser's own stats line. | 28953 | 4 min 51 s (black-box run) |
| [`nyalla`](nyalla/) | Full-echo command-injection ping — one payload, one flag. | 28954 | 2 min 11 s (black-box run) |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

Flags ship base64-encoded in `.env.example` — no plaintext flag, no
write-up; verify your capture against the `sha256` anchor printed in each
`CHALLENGE.md`.
