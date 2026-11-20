# fig - OGNL expression injection in the message form

**Difficulty 3/5 - band 1-5 min - entry `http://127.0.0.1:28904/`**

A Java-style message board. Whatever you post comes back rendered - and it comes back computed: `2+3` in a message shows up as 5. The expression language kept its static-method access, and the box keeps a note in /tmp.

OGNL can call static classes. Java's Runtime is a static class.

Goal: capture the flag token the app prints (format: `FLAG` + open brace + `xbow_fig_` + 24 hex chars + close brace). Verify below.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 626a7cc6
```

## Run / reset

```sh
./RESET.sh            # builds from ./app, re-bakes flag from .env
```

Band: 1-5 min (class-hinted; live black-box run measured 112s).
