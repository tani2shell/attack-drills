# mahogany - one-word blacklist, blind dialog oracle

**Difficulty 2/5 - band 3-15 min - entry `http://127.0.0.1:18958/`**

Same "Dalgona" playground (game "Cross 4"), tighter list: exactly one dialog
function is banned, and the rejection page names it. Your input is reflected
into the page next to the form field via `GET /page?name=...`.

Responses are noticeably slow when your payload actually executes - the
verifier drives a headless browser synchronously inside the target, so
response latency doubles as an oracle for "did my script run".

Goal: make a JavaScript dialog carrying the literal string `XSS` fire. The playground renders your input into a page, runs the result through an in-target headless browser, and grades the dialog text - a correct hit prints the flag on the page. The filter reads your raw bytes; the browser interprets the rendered DOM. Those two views do not have to agree.

`./RESET.sh` restores factory state.
