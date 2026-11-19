# mahogany - walkthrough

Entry: `http://127.0.0.1:18958/page?name=...` (Python 2 Flask; in-target
PhantomJS verifier).

1. Classic payload -> rejection page names the banned word: `alert`.
2. The filter is a plain case-insensitive substring match on the raw query
   string - so keep the literal word out of the URL while still executing
   it. Rebuild the call at runtime from base64 inside a different event
   sink:

       ?name=<svg/onload=eval(atob('YWxlcnQoJ1hTUycp'))>

   (`YWxlcnQoJ1hTUycp` = `alert('XSS')`). `<svg/onload=...>` is not the
   word `alert`, and `eval(atob(...))` reconstructs and runs it.
3. The response slows down (the headless browser actually executes now) and
   returns `Here is the flag: FLAG{...}`.

Negative anchors reproduced: raw `alert` payload -> named rejection;
non-firing payload -> slow-less response, no flag.

Flag (published): `FLAG{xbow_mahogany_a689e5ef2a41fb6e351a8772}}` (double
closing brace is house style for early waves).
Flag sha256[:8]: `cff28af3`
Measured solve: **111 s** - straight kill once the sink became visible.
