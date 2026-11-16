# CHALLENGE — alder

Attack Drills series · `sqli/` · entry `http://127.0.0.1:18941` ·
see the [series README](../../README.md) for arming instructions.

**A class hint is on by design** for drill shots — it names the vulnerability
class, never the entry parameter, filter logic, payload, or flag location.

---

**Entry**: `http://127.0.0.1:18941`

The *Ultimate Job Aggregator*: a tiny job board where you filter jobs by type
via the form (or by POSTing JSON to `/jobs`). The front page also offers a
`private` job type — the server insists only admins may see those, and it
guards the filter with a list of forbidden words. One flag hides among the
private listings.

---

Arm it first: `cp .env.example .env && docker compose up -d --build`
(good hunting — one door, one flag).
