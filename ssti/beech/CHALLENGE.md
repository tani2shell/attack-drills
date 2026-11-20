# beech - unfiltered SSTI in a loan calculator

**Difficulty 2/5 - band 3-10 min - entry `http://127.0.0.1:19015/`**

The same loan-calculator as its filtered cousin - except here the `principal`
field is templated with no blacklist at all.

Observable: `{{7*7}}` evaluates immediately. Python class introspection is
fully reachable: the loaded-class list can be dumped into the page and indexed.

Goal: find the process-spawning class in `__subclasses__()`, run `cat /flag`,
and read the flag out of the totals page.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 75fd5f29
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 3-10 min (measured 64s in a live black-box run).
