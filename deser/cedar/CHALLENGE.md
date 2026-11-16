# CHALLENGE — cedar

Attack Drills series · `deser/` · entry `http://127.0.0.1:18943` ·
see the [series README](../../README.md) for arming instructions.

**A class hint is on by design** for drill shots — it names the vulnerability
class, never the entry parameter, filter logic, payload, or flag location.

---

**Entry**: `http://127.0.0.1:18943`

The *Pickle CTF*: the page cheerfully displays "the current flag" and even
prints the snippet of code that reads it — but the flag it shows is not the
real one. The app accepts a file upload and does the one thing you should
never do to untrusted bytes. You cannot change the code; you can change the
filesystem it reads. One flag, behind a decoy.

---

Arm it first: `cp .env.example .env && docker compose up -d --build`
(good hunting — one door, one flag).
