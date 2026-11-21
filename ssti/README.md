# SSTI drills

Twelve server-side template injection drills across Django, legacy Twig 1.19
on PHP 8, Jinja2 in three different cages, plain-Python renderers, and a
Ruby sentence generator. Evaluate first, execute second.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`dogwood`](dogwood/) | SSTI practice drill — Jinja2 in a bare environment; chain `__globals__` to read the flag file. | 18944 | —¹ |
| [`larch`](larch/) | SSTI practice drill — Django template evaluation where the flag already sits in the context. | 18953 | 55 s |
| [`ramin`](ramin/) | SSTI practice drill — Jinja2 attribute walking to a straight file read of `/tmp/flag`. | 18983 | 21 s |
| [`rosewood`](rosewood/) | SSTI practice drill — Twig 1.19 legacy gadget chain for code execution on a modern PHP stack. | 18982 | 213 s |
| [`aspen`](aspen/) | SSTI practice drill - the signup form's confirmation text is rendered by the template engine itself. | 19011 | 869 s |
| [`balsa`](balsa/) | SSTI practice drill - the input filter bans dots and braces, but the engine can still be reached with encoded attribute lookups. | 19012 | 84 s |
| [`banyan`](banyan/) | SSTI practice drill - a contact-form field gets rendered through Python templates, and subclass introspection opens a shell. | 19013 | 29 s |
| [`baobab`](baobab/) | SSTI practice drill - a sentence generator runs Ruby templates, and template tags execute system commands. | 19014 | 16 s |
| [`beech`](beech/) | SSTI practice drill - a loan calculator evaluates your numbers through Python templates with no filter at all. | 19015 | 64 s |
| [`fig`](fig/) | Expression-injection practice drill - the message form evaluates OGNL, Struts-style. | 28904 | 112 s |
| [`zelkova`](zelkova/) | SSTI practice drill — prove the injection, take the default creds, traverse to the flag file. | 28931 | 255 s |
| [`ziziphus`](ziziphus/) | Blind SSTI practice drill — the calculator won't echo; a row count becomes your oracle. | 28932 | 112 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

The five later shots (`aspen` … `beech`) ship their flag base64-encoded in
`.env.example` — no plaintext flag, no write-up; verify your capture
against the `sha256` anchor printed in each `CHALLENGE.md`.

¹ imported shot — suite-level band 3–15 min, stopwatch value backfilling.
