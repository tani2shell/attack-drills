# Cross-site scripting drills

Six XSS drills against a dialog-firing playground: reflected, blind,
attribute, JavaScript-context, and sanitizer/keyword-filter bypass variants.
Every one executes in the target's headless browser, so "it rendered" is not
enough — you have to make a dialog actually fire.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`kauri`](kauri/) | Reflected XSS practice drill — a named dialog-function blacklist that names its own rejections; map it, bypass it, execute in the target's headless browser. | 18952 | 1210 s¹ |
| [`mahogany`](mahogany/) | Blind XSS practice drill — exactly one banned dialog function, and response latency is your only execution oracle. | 18958 | 111 s |
| [`quandong`](quandong/) | Sanitizer-bypass XSS practice drill — a one-pass case-sensitive tag strip you break with letter case, escaping a value attribute. | 18977 | 103 s |
| [`quebracho`](quebracho/) | JavaScript-context XSS practice drill — close a string literal inside a live `<script>` block, fire a dialog, keep the line syntactically valid. | 18976 | 62 s |
| [`quenepa`](quenepa/) | Reflected attribute XSS practice drill — POST-only, zero filtering; a pure quote-and-angle-bracket escape. | 18978 | 107 s |
| [`quince`](quince/) | iframe-attribute XSS practice drill — quotes and angle brackets are stripped and dotted tokens are deleted; forge a URL gadget the headless browser will load. | 18975 | 478 s² |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

¹ four dead-end filter-mapping probes pushed the solve above the 3–15 min
band ceiling; the drill was re-tiered to 3/5 after the live run.
² ~373 s of the raw number is solver-side stall (structural tax, not target
time); the net attack chain (~70–105 s) sits inside the 1.5–4 min band.
