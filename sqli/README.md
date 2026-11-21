# SQL injection drills

Nine SQL-injection drills, ordered roughly by feedback richness: from a chatty
login bypass to a keyword-filtered blind oracle you extract one bit at a time.
MySQL and SQLite, PHP and GraphQL — same disease, different symptoms.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`alder`](alder/) | Blind SQLi practice drill — smuggle a payload past an exact-match keyword blacklist in a JSON job filter and extract the flag. | 18941 | —¹ |
| [`locust`](locust/) | GraphQL SQLi practice drill — introspect the schema, inject through `jobType`, UNION your way to the flag. | 18956 | 352 s |
| [`mulberry`](mulberry/) | Classic SQLi practice drill — UNION-based extraction through a chatty PHP+MySQL search page. | 18961 | 146 s |
| [`redbud`](redbud/) | UNION SQLi practice drill — dig the flag row out of a listing seeded with decoy rows. | 18981 | 245 s |
| [`redwood`](redwood/) | Time-based blind SQLi practice drill — write-path injection, zero visible output, one bit per sleep. | 18980 | 381 s |
| [`rowan`](rowan/) | Auth-bypass SQLi practice drill — verbose error echo on the login form hands you the query shape for free. | 18979 | 208 s |
| [`yew`](yew/) | Blind SQLi practice drill — a slow boolean oracle on the payroll query; extract creds, bypass login, upload, execute. | 28928 | 126 s clean chain (23 m 54 s incl. wrong turn) |
| [`ylang`](ylang/) | Blind SQLi practice drill — boolean extraction on the login query, 229 probes deep to the admin credential. | 28929 | 67 s (229 probes) |
| [`yellowwood`](yellowwood/) | SQLi practice drill — inject the login query and UNION your way into the table with something to hide. | 28930 | 91 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

¹ imported shot — suite-level band 3–15 min, stopwatch value backfilling.
