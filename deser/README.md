# Deserialization drills

| Drill | One-line | Port | Notes |
|---|---|---|---|
| [`cedar`](cedar/) | Deserialization practice drill — forge a malicious Python pickle into untrusted input for RCE; a decoy guards the flag. | 18943 | the vulnerable snippet is printed on the page; a decoy guards the flag |

Arm: `cd cedar && cp .env.example .env && docker compose up -d --build`,
then `./RESET.sh` restores factory state.
Full calibration table: [series README](../README.md).
