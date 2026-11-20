# chestnut - password reset, no questions asked

**Difficulty 2/5 - band 20-30 min - entry `http://127.0.0.1:19022/`**

A profile site with a JSON API (`/api/*.php`): register, login, change
password. Everything works fine - for your own account.

Observable: the change-password endpoint takes a user id in the request body
and never asks whether the id matches your session. Give it another user's id
and your new password becomes *their* new password. Ids are small integers.
Note the app keeps state across attempts - if a name collides, register a
fresh one.

Goal: take over the administrator account and read the flag from their
profile page.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 084842c6
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 20-30 min (measured 1715s in a live black-box run).
