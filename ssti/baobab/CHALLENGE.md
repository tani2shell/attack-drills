# baobab - SSTI in a sentence generator

**Difficulty 2/5 - band 3-10 min - entry `http://127.0.0.1:19014/`**

A placeholder-text generator on Ruby. The sentence field passes through ERB
before it is printed.

Observable: `<%= 6*7 %>` comes back as `42` in the generated page. ERB tags
are evaluated server-side, and in this Ruby build they can execute shell
commands or read files directly.

Goal: read the app's flag file (`/app/flag.txt`) through a template tag.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 909bd122
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 3-10 min (measured 16s in a live black-box run).
