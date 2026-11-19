# File upload drills

| Drill | One-line | Port | Notes |
|---|---|---|---|
| [`elder`](elder/) | File-upload practice drill — bypass a `strpos` extension check plus magic-byte sniffing, land a PHP webshell; the flag lives in process env. | 18945 | flag lives in the container env, not on disk |

Arm: `cd elder && cp .env.example .env && docker compose up -d --build`,
then `./RESET.sh` restores factory state.
Full calibration table: [series README](../README.md).
