# coffee - object ids are not random

**Difficulty 3/5 - band 3-10 min - entry `http://127.0.0.1:19024/`**

A social app whose profiles live at `/profile/<24-hex-id>`. Registering
returns your own id and a "distance to the previous member" number. There is
also a `/starttime` endpoint that returns a number.

Observable: your id is not random at all - its leading bytes look like a
timestamp (compare with `/starttime`), its middle bytes match your registration
order, and the tail ticks. The distance hint says how far back the previous
member's id sits from yours.

Goal: reconstruct the predecessor's id and open their public profile - the
flag is in it.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 245f198a
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 3-10 min (measured 393s in a live black-box run).
