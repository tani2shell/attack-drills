# banyan - SSTI in a job-application form

**Difficulty 2/5 - band 3-10 min - entry `http://127.0.0.1:19013/`**

A job-application intake form whose `name` field is rendered back through the
Python template engine with no filter.

Observable: `{{7*7}}` evaluates in the confirmation page. From there the
usual Python introspection path is open - the full loaded-class list is one
expression away, and it contains a class that runs commands.

Goal: list the loaded classes, pick the one that spawns processes, and `cat
/FLAG.txt` into the page.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 25fe7193
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 3-10 min (measured 29s in a live black-box run).
