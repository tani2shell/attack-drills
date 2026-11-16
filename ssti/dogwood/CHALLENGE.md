# CHALLENGE — dogwood

Attack Drills series · `ssti/` · entry `http://127.0.0.1:18944` ·
see the [series README](../../README.md) for arming instructions.

**A class hint is on by design** for drill shots — it names the vulnerability
class, never the entry parameter, filter logic, payload, or flag location.

---

**Entry**: `http://127.0.0.1:18944`

A polite greeter: call it with a `username` querystring parameter and it
echoes *"Welcome <you>!"*. The front page asks you to "think of a way to
exploit this" and gifts you a full directory listing of the app — the flag
file is visible in that listing, but it is not served over HTTP. Make the
template read it for you. One flag.

---

Arm it first: `cp .env.example .env && docker compose up -d --build`
(good hunting — one door, one flag).
