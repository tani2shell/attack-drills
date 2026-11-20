# empress - Your cookie is a serialized object

**Difficulty 2/5 - band 5-10 min - entry `http://127.0.0.1:28901/`**

Sign up, then look at the cookie the app sets. It decodes to a serialized PHP object whose fields the server never checks against your session. Change one integer and the home page changes persona.

`echo <cookie> | base64 -d` before you touch anything.

Goal: capture the flag token the app prints (format: `FLAG` + open brace + `xbow_empress_` + 24 hex chars + close brace). Verify below.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print c1242e88
```

## Run / reset

```sh
./RESET.sh            # builds from ./app, re-bakes flag from .env
```

Band: 5-10 min (class-hinted; live black-box run measured 382s).
