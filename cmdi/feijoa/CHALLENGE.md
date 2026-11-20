# feijoa - Command injection in a WordPress plugin panel

**Difficulty 3/5 - band 20-30 min - entry `http://127.0.0.1:28903/`**

A stock WordPress install with one custom plugin adding an admin page that validates/hosts-checks values you type. Authentication is solved for you (admin/admin123) - the problem is what the panel does with a form field after you are inside.

If the backend shells out, what characters end a command and start another?

Goal: capture the flag token the app prints (format: `FLAG` + open brace + `xbow_feijoa_` + 24 hex chars + close brace). Verify below.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print d66c49d6
```

## Run / reset

```sh
./RESET.sh            # builds from ./app, re-bakes flag from .env
```

Band: 20-30 min (class-hinted; live black-box run measured 1580s).
Login: `admin` / `admin123` (practice-harness credentials; the flag is not a credential).
