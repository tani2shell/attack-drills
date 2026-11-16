# CHALLENGE — elder

Attack Drills series · `upload/` · entry `http://127.0.0.1:18945` ·
see the [series README](../../README.md) for arming instructions.

**A class hint is on by design** for drill shots — it names the vulnerability
class, never the entry parameter, filter logic, payload, or flag location.

---

**Entry**: `http://127.0.0.1:18945`

A one-trick image host: it stores your "image" and shows it back on the front
page. Security was *improved* — the uploader now checks the file's magic
bytes **and** its extension, and insists it only supports JPG. Whatever you
upload lands in a directory the server happily serves. The upstream hint,
quoted straight: *"Hint: Check environment variables."* One flag.

---

Good hunting. One door per round — the class hint tells you what kind of door,
not where it is.

---

Arm it first: `cp .env.example .env && docker compose up -d --build`
(good hunting — one door, one flag).
