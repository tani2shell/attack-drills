# butternut - state-change without ownership check

**Difficulty 2/5 - band 1-5 min - entry `http://127.0.0.1:19017/`**

The same trading platform. Besides receipts, users can archive their orders.

Observable: the archive endpoint takes an order id from the URL and acts on it
regardless of ownership - you can archive orders that are not yours. The
receipt page then renders state that the order's owner was supposed to see.

Goal: use a state change on someone else's order to make its hidden content -
the flag - show up on a receipt page.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print e5680d3f
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 1-5 min (measured 52s in a live black-box run).
