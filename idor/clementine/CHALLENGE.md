# clementine - drafts with open doors

**Difficulty 2/5 - band 1-5 min - entry `http://127.0.0.1:19023/`**

A writing app: register, log in, keep drafts. The drafts list shows only
titles.

Observable: draft ids in the URLs are sequential. The list view is polite
about ownership - but the *edit* view, which renders the full draft body,
does not check it at all.

Goal: open someone else's draft in the editor and read the flag out of its
body.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 5b40c0cb
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 1-5 min (measured 43s in a live black-box run).
