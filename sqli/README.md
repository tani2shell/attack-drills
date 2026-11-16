# SQL injection drills

Six SQL-injection drills, ordered roughly by feedback richness: from a chatty
login bypass to a keyword-filtered blind oracle you extract one bit at a time.
MySQL and SQLite, PHP and GraphQL — same disease, different symptoms.

| Drill | Angle | Port | Measured |
|---|---|---|---|
| [`alder`](alder/) | JSON job filter, exact-match word blacklist bypass | 18941 | —¹ |
| [`locust`](locust/) | GraphQL introspection → UNION via `jobType` | 18956 | 352 s |
| [`mulberry`](mulberry/) | PHP+MySQL search page | 18961 | 146 s |
| [`redbud`](redbud/) | Listing UNION with decoy rows | 18981 | 245 s |
| [`redwood`](redwood/) | Write-path time-based blind | 18980 | 381 s |
| [`rowan`](rowan/) | Auth form, verbose error echo | 18979 | 208 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

¹ imported shot — suite-level band 3–15 min, stopwatch value backfilling.
