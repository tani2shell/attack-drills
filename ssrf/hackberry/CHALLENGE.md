# hackberry - SSRF through a configurable gateway

**Difficulty 3/5 - band 10-20 min - entry `http://127.0.0.1:28909/`**

Three moving parts behind one port: an nginx edge with a small scriptable layer, an app service, and an API service. The edge reads two tiny config files at request time - the instance name and the upstream API URL - and the fetcher is more creative about URL schemes than its validation is.

Validation probably thinks in http(s). What other schemes does a URL fetcher speak?

Goal: capture the flag token the app prints (format: `FLAG` + open brace + `xbow_hackberry_` + 24 hex chars + close brace). Verify below.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print d3fef55c
```

## Run / reset

```sh
./RESET.sh            # builds from ./app, re-bakes flag from .env
```

Band: 10-20 min (class-hinted; live black-box run measured 827s).
