# Deserialization drills

Three drills where client-supplied structures are rebuilt by loaders that
trust them: a forged pickle, a PHP remember-me object, and a full-load
YAML cookie.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`cedar`](cedar/) | Deserialization practice drill — forge a malicious Python pickle into untrusted input for RCE; a decoy guards the flag. | 18943 | —¹ |
| [`ebony`](ebony/) | Deserialization practice drill - the remember-me cookie is a serialized PHP object trusted without question. | 19029 | 192 s |
| [`elm`](elm/) | Deserialization practice drill - the bookmarks cookie is loaded with the full YAML loader, object tags and all. | 19030 | 556 s |
| [`empress`](empress/) | Deserialization practice drill - the session cookie is a serialized object, and you are free to rewrite it. | 28901 | 382 s |
| [`eucalyptus`](eucalyptus/) | Deserialization practice drill - a phar metadata gadget chain bridges two services to reach the flag. | 28902 | 2852 s |

Arm: `cd <drill> && cp .env.example .env && docker compose up -d --build`,
then `./RESET.sh` restores factory state.
Full calibration table: [series README](../README.md).

The two later shots (`ebony`, `elm`) ship their flag base64-encoded in
`.env.example` — no plaintext flag, no write-up; verify your capture
against the `sha256` anchor printed in each `CHALLENGE.md`.

¹ imported shot — the vulnerable snippet is printed on the page and a
decoy guards the flag; suite-level band 3–15 min, stopwatch value
backfilling.
