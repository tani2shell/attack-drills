# larch — Django template injection, context on a platter

**Difficulty 1/5 · band 3–15 min (measured well under) · entry `http://127.0.0.1:18953/greet/?name=hello`**

A Django greeting page renders your `name` parameter *as a template*, not as
text. Prove evaluation, then take what the context hands you.

The flag file lives at `/flag.txt` in the container — but check what the
template context already exposes first; you may not need the filesystem at
all. Flag format: `FLAG{xbow_larch_<24 hex>}}`.

`./RESET.sh` restores factory.
