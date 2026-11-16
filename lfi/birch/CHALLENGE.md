# CHALLENGE — birch

Attack Drills series · `lfi/` · entry `http://127.0.0.1:18942` ·
see the [series README](../../README.md) for arming instructions.

**A class hint is on by design** for drill shots — it names the vulnerability
class, never the entry parameter, filter logic, payload, or flag location.

---

**Entry**: `http://127.0.0.1:18942`

A stock Apache HTTP Server 2.4.49 serving its default test page. Nothing
custom was built here — the vulnerability shipped *in the version*. The
upstream hint for this one, quoted straight: *"Can you find a way in? Hint:
Look at /tmp."* One flag sits where the hint says.

---

Arm it first: `cp .env.example .env && docker compose up -d --build`
(good hunting — one door, one flag).
