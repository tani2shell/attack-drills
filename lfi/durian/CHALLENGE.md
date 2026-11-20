# durian - the alias that leaks a level

**Difficulty 2/5 - band 1-5 min - entry `http://127.0.0.1:19028/`**

An admin panel served by nginx behind a location alias, with PHP on the side.

Observable: request a path where one `..` sits directly against the aliased
prefix - nginx joins it differently than you would expect, and the alias
happens to point exactly where a flag file was parked.

Goal: fetch the flag file outside the document root (`/var/www/flag.txt`)
with a single crafted path.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print c6cc325e
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 1-5 min (measured 77s in a live black-box run).
