# File upload drills

| Drill | One-line | Port | Notes |
|---|---|---|---|
| [`elder`](elder/) | File-upload practice drill — bypass a `strpos` extension check plus magic-byte sniffing, land a PHP webshell; the flag lives in process env. | 18945 | flag lives in the container env, not on disk |
| [`nara`](nara/) | Unrestricted PHP upload on a server that runs what it hosts — print the app's own environment. | 28955 | measured 29 s (black-box run; entry-point GET, upload lane never needed) |
| [`osage`](osage/) | Default-credentials login plus upload execution — laminated combo in, polyglot up, flag back. | 28959 | measured 7 min 20 s (black-box run; ~6 min weak-credential enumeration tax) |

Arm: `cd elder && cp .env.example .env && docker compose up -d --build`,
then `./RESET.sh` restores factory state.
Full calibration table: [series README](../README.md).
