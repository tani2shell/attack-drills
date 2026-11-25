# eucalyptus - Phar deserialization across two services

**Difficulty 3/5 - band 30-60 min - entry `http://127.0.0.1:28902/`**

Two services share this app: a PHP 8 web front and a SKU-model microservice on its own port. The front hands uploaded (base64) SKU data to the model service; somewhere in that handoff the model service opens your upload as a phar archive and deserializes its metadata without asking any questions.

A phar file's manifest is serialized PHP. What happens when PHP unserializes an object graph it controls?

Goal: capture the flag token the app prints (format: `FLAG` + open brace + `xbow_eucalyptus_` + 24 hex chars + close brace). Verify below.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print b4f3e6c1
```

## Run / reset

```sh
./RESET.sh            # builds from ./app, re-bakes flag from .env
```

Band: 30-60 min (class-hinted; live black-box run measured 2852s).
The SKU-model microservice also publishes its own port (default 28968, see `SKU_PORT` in `.env`).
