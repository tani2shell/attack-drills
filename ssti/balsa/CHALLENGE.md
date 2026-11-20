# balsa - SSTI behind a character blacklist

**Difficulty 3/5 - band 5-15 min - entry `http://127.0.0.1:19012/`**

A loan-calculator app. The `principal` field of the totals page is evaluated
as a Python template - but a filter bans the obvious characters: underscores,
dots, brackets, and doubled braces.

Observable: a naive `{{7*7}}`-style probe is swallowed whole by the
filter. Yet the page still templates what survives, and the template language
has a spelled-out form of every dotted access: filters like `attr()` and
hex-escaped names inside strings. The payload also has to escape a JSON
context - your value is embedded in a JSON body before templating.

Goal: read the flag file from the container (`/flag`) and capture the flag
string.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print f747cab3
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 5-15 min (measured 84s in a live black-box run).
