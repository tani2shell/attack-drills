# cherry - login form field you shouldn't touch

**Difficulty 2/5 - band 1-5 min - entry `http://127.0.0.1:19021/`**

A small community site. Anyone can create an account and view their own
dashboard.

Observable: inspect the login form - it posts more fields than the visible
inputs. Add that field back to your POST and the session you get is not the
one you earned. User ids are numeric and small.

Goal: log in as the account whose dashboard carries the flag.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print e3cdd931
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 1-5 min (measured 262s in a live black-box run).
