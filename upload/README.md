# File upload drills

| Drill | Angle | Port | Notes |
|---|---|---|---|
| [`elder`](elder/) | Upload filter bypass (`strpos` extension + 2 magic bytes) → PHP webshell | 18945 | flag lives in the container env, not on disk |

Arm: `cd elder && cp .env.example .env && docker compose up -d --build`,
then `./RESET.sh` restores factory state.
Full calibration table: [series README](../README.md).
