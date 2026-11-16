# Deserialization drills

| Drill | Angle | Port | Notes |
|---|---|---|---|
| [`cedar`](cedar/) | Python pickle on untrusted bytes → RCE | 18943 | the vulnerable snippet is printed on the page; a decoy guards the flag |

Arm: `cd cedar && cp .env.example .env && docker compose up -d --build`,
then `./RESET.sh` restores factory state.
Full calibration table: [series README](../README.md).
