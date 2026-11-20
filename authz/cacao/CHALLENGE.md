# cacao - over-fetching GraphQL API

**Difficulty 2/5 - band 1-5 min - entry `http://127.0.0.1:19019/`**

A clinic portal whose frontend talks to a GraphQL endpoint at `/graphql`.
Login is a JSON POST; the demo account works.

Observable: introspection or a field error message reveals the schema -
including query arguments that let you ask for *another* user's records, and
object fields that were meant to stay internal. The server checks that you
are logged in, not who you are asking about.

Goal: query every user's records and pick out the field holding the flag.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 3a3180d1
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 1-5 min (measured 80s in a live black-box run).
