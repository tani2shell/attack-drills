# aspen - SSTI in the signup confirmation

**Difficulty 3/5 - band 3-10 min - entry `http://127.0.0.1:19011/`**

A small art-gallery site with a three-step signup. Whatever you type as your
display name on step 1 comes back later, inside a greeting, rendered through
the Python template engine - as a template, not as text. The engine blocks
tag syntax (`%`), but expression syntax survives and attribute lookups on
public objects are reachable.

Observable: put a simple expression like `{{ 7*7 }}` in the name field, finish
the signup, and watch the confirmation page. Then probe what objects the
expression language can see - the gallery's message machinery is built on a
signing key, and that key is the flag.

Goal: capture the flag token the app prints (format: `FLAG` + open brace +
shot name + underscore + 24 hex chars + close brace). Verify below.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print dd43bf28
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 3-10 min (measured 869s in a live black-box run).
