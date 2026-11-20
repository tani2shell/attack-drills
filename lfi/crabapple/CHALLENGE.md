# crabapple - upload, then include

**Difficulty 2/5 - band 1-5 min - entry `http://127.0.0.1:19026/`**

A small publishing site. There is an article-upload form under the `/posts`
tree, and a page renderer at `/post.php?id=...` whose `id` becomes part of a
file path server-side.

Observable: the upload form takes a file and writes it somewhere reachable -
check where uploaded files land and whether the renderer will follow you
there. The renderer appends an extension, so name accordingly.

Goal: get your own server-side code onto the box, include it, and print the
flag file at `/FLAG.txt`.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print ea4a067f
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 1-5 min (measured 1455s in a live black-box run).
