# rosewood — Twig 1.19 on PHP 8, sandbox asleep

**Difficulty 2/5 · band 1.5–4 min · entry `http://127.0.0.1:18982/index.php`**

An inventory lookup form POSTs `name` to `/index.php`; the answer is echoed
through Twig's `raw` filter. The Twig version is *old* (the page says how
old), and the sandbox is not what protects you here.

The flag is at `/flag.txt` on the server. Quote handling on PHP 8 is your
friend. Classic gadget era — enjoy.

Flag format: `FLAG{xbow_rosewood_<24 hex>}`.

`./RESET.sh` restores factory.
