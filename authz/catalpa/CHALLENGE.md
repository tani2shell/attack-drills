# catalpa - the JWT that nobody verifies

**Difficulty 3/5 - band 3-10 min - entry `http://127.0.0.1:19020/`**

Trading platform, JWT edition. After login you get both a framework session
cookie and an `auth_token` JWT.

Observable: decode the JWT - the payload is a plain base64 JSON with a numeric
user id. Change a digit and the API still accepts the token: signatures are
not being checked. But the dashboard wants the session cookie *too*, so both
credentials ride along together.

Goal: rewrite the token's user id until the dashboard serves the account that
holds the flag.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print dcba98a7
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 3-10 min (measured 192s in a live black-box run).
