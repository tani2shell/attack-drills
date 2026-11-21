# Cross-site scripting drills

Eighteen XSS drills against a dialog-firing playground: reflected, blind,
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
| [`tupelo`](tupelo/) | XSS practice drill — xss filter bypass — unfamous event handler gets through. | 28916 | 22 s |
| [`ugni`](ugni/) | XSS practice drill — xss filter bypass — quote-shape escape, dialog fires. | 28917 | same request ⁵ |
| [`umeboshi`](umeboshi/) | XSS practice drill — xss filter bypass — double-encoding road to the dialog. | 28918 | 260 s |
| [`uva`](uva/) | XSS practice drill — xss filter bypass — delivered payload, flag in the response. | 28919 | 119 s |
| [`velvetwood`](velvetwood/) | XSS practice drill — xss filter bypass — slash-separated attributes in a legacy renderer. | 28920 | 45 s |
| [`viburnum`](viburnum/) | XSS practice drill — xss filter bypass — unclosed-tag survival; ride a handler attribute to execution. | 28921 | 15 s |
| [`vochysia`](vochysia/) | XSS practice drill — xss filter bypass — the one-word filter; escape the attribute, attach an event. | 28922 | 2 s |
| [`walnut`](walnut/) | XSS practice drill — xss filter bypass — unbanned element plus handler past a famous-tags-only list. | 28923 | 39 s |
| [`willow`](willow/) | XSS practice drill — xss filter bypass — parentheses are banned; entity-encode them and call the handler. | 28924 | 38 s |
| [`whitebeam`](whitebeam/) | XSS practice drill — xss filter bypass — a missing image's error event fires the dialog. | 28925 | 16 s |
| [`wisteria`](wisteria/) | XSS practice drill — xss filter bypass — merge one survivor tag onto the page's own element. | 28926 | 11 s |
| [`ximenia`](ximenia/) | XSS practice drill — xss filter bypass — the event blacklist has a hole; use it. | 28927 | 3 s |

Arm any drill: `cd <drill> && cp .env.example .env && docker compose up -d
--build`, then shoot at `http://127.0.0.1:<port>`. `./RESET.sh` restores
factory state. Full calibration table lives in the
[series README](../README.md).

¹ four dead-end filter-mapping probes pushed the solve above the 3–15 min
band ceiling; the drill was re-tiered to 3/5 after the live run.
² ~373 s of the raw number is solver-side stall (structural tax, not target
time); the net attack chain (~70–105 s) sits inside the 1.5–4 min band.
