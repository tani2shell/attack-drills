# boxwood - broken access control on order receipts

**Difficulty 2/5 - band 1-5 min - entry `http://127.0.0.1:19016/`**

A trading platform demo. You log in with any username (the password page
accepts anything you set), and each user sees their own order receipts.

Observable: your own receipt URL contains an order number. Change the number
to an order that isn't yours - the page answers anyway. Not every id exists;
a 404 vs 200 tells you which orders are real. Some orders belong to no visible
user.

Goal: find the orphan order whose receipt page carries the flag.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 2f3d660c
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 1-5 min (measured 99s in a live black-box run).
