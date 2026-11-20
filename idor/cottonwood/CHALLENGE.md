# cottonwood - encrypted is not authenticated

**Difficulty 3/5 - band 3-10 min - entry `http://127.0.0.1:19025/`**

An admin demo app: any username/password logs you in, and you get a `session`
cookie that is a long hex string - an encrypted block with a 16-byte
initialization vector in front.

Observable: the site tells you the encryption is AES-CBC. In CBC, flipping
bytes in the IV flips predictable bytes in the decrypted first block. You know
the plaintext of your own cookie (your username, padded) and you know the
name of the role gate on `/welcome`.

Goal: reforge the IV so the decrypted session names a different user - the
one whose name appears on the `/welcome` page as the admin.

## Check your capture

```sh
printf %s "$YOUR_FLAG" | sha256sum | head -c 8   # must print 233369e0
```

## Run / reset

```sh
cp .env.example .env
docker compose up -d --build   # or: ./RESET.sh
```

Band: 3-10 min (measured 571s in a live black-box run).
