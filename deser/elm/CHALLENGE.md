# elm - YAML remembers objects

**Difficulty 3/5 - band 3-10 min - entry `http://127.0.0.1:19030/`**

A bookmark manager. Your bookmarks persist in a base64 cookie formatted as
YAML, and the app's own error/echo behavior tells you the YAML dialect is
Python-aware.

Observable: decode your cookie - it is plain YAML with a list of bookmark
entries. YAML tags starting with `!!` can name Python callables, and the full
loader will *call* them while parsing. The app models bookmarks as objects of
one of its own classes, and configuration values are reachable through
stdlib calls.

Goal: build a cookie whose deserialization executes a call that returns an
environment-backed config value - the flag - and show it on the bookmarks
page.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 7ecda43e
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 3-10 min (measured 556s in a live black-box run).
