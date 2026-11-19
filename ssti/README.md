# SSTI drills

Four server-side template injection drills across four engines — Django,
ancient Twig 1.x on PHP 8, and Jinja2 twice with different cages. One gift
horse, one gadget-era classic, one runtime-computed escape, one bare-env
globals chain. Evaluate first, execute second.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`dogwood`](dogwood/) | SSTI practice drill — Jinja2 in a bare environment; chain `__globals__` to read the flag file. | 18944 | —¹ |
| [`larch`](larch/) | SSTI practice drill — Django template evaluation where the flag already sits in the context. | 18953 | 55 s |
| [`ramin`](ramin/) | SSTI practice drill — Jinja2 attribute walking to a straight file read of `/tmp/flag`. | 18983 | 21 s |
| [`rosewood`](rosewood/) | SSTI practice drill — Twig 1.19 legacy gadget chain for code execution on a modern PHP stack. | 18982 | 213 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

¹ imported shot — suite-level band 3–15 min, stopwatch value backfilling.
