# cypress - a filter with a blind spot

**Difficulty 3/5 - band 3-10 min - entry `http://127.0.0.1:19027/`**

A blog demo. `/post.php?id=` includes a PHP file from a posts directory, with
a filter meant to stop directory traversal.

Observable: the filter removes `../` in a single pass - which you can test
directly, because removing text leaves a measurable difference in the answer.
But it only looks for that one spelling: an alternate separator survives the
strip and still means "up" to the filesystem. Also remember the server logs
every request, log files are world-readable on this image, and the flag file
`/FLAG.php` opens with `<?php` - so `cat` and direct display both swallow it;
read it as data instead.

Goal: escape the posts directory, include the web server's own access log,
and get a line you planted in it executed to print the flag.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print e8c86dd3
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 3-10 min (measured 640s in a live black-box run).
