# ebony - the cookie is PHP code

**Difficulty 2/5 - band 1-5 min - entry `http://127.0.0.1:19029/`**

A login page whose "remember me" state lives in a base64 cookie. The page's
own source reveals how authentication works, including a fixed password
constant.

Observable: base64-decode your cookie after logging in - it is a serialized
PHP array. The server unserializes it and trusts whatever it decodes. The
serialized form encodes string lengths explicitly, so edits must keep the
counts honest.

Goal: hand-craft a cookie that makes the server believe it is talking to the
administrator, and read the flag the admin page prints.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 40280f24
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 1-5 min (measured 192s in a live black-box run).
