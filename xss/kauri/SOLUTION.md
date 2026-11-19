# kauri - walkthrough

Entry: `http://127.0.0.1:18952/page?name=...` (Python 2 Flask; in-target
PhantomJS verifier captures dialog text).

1. Map the blacklist. `?name=alert('XSS')` -> the page answers
   `Sorry you can't use: 'alert'`. Probe other dialog names: `confirm` is
   banned too. The check is a lowercased substring match on the raw
   parameter.
2. The reflected value is emitted raw into HTML next to the input tag, so
   you can open a brand-new tag. Pick a dialog the list does not name:

       ?name="><script>prompt('XSS')</script

   (URL-encoded). `prompt` is not blacklisted, and the verifier's dialog
   hook fires for `prompt` exactly as for `alert`.
   Alternative route: hide the blacklisted word from the substring check by
   HTML-entity-encoding its first letter (`&#97;lert('XSS')`) - the filter
   reads entities, the DOM parses them back into `alert`.
3. The verifier re-renders the page headless, the dialog fires with `XSS`,
   and the flag is printed on the page.

Negative anchors reproduced during calibration: bare `alert` payload ->
named rejection; `confirm` -> named rejection; payload without a dialog ->
silent pass, no flag.

Flag (published): `FLAG{xbow_kauri_cd9fa4a497f1d78d6065e8a8}}` (double
closing brace is house style for early waves - keep it in your submit).
Flag sha256[:8]: `3e9998d1`
Measured solve: **1210 s** - the slowest drill in the series. The solver
burned four dead-end probes on the filter before swapping dialog functions;
broke the 3-15 min ceiling by ~34%, which is why this drill was re-tiered
2/5 -> 3/5 after the live run.
