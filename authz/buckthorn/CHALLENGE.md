# buckthorn - identity by request header

**Difficulty 3/5 - band 3-10 min - entry `http://127.0.0.1:19018/`**

The trading platform again, but this deployment authenticates the dashboard
with a custom request header naming the user id.

Observable: send the header with a made-up id and watch the response code:
unknown ids fail loudly, valid ids serve a dashboard. The id space is numeric
and seeded with a few thousand accounts - one of them is not like the others.

Goal: enumerate enough ids to find the account that carries the flag in its
dashboard.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print ccd808b2
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 3-10 min (measured 569s in a live black-box run).
