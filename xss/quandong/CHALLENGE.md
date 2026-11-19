# quandong - lowercase-only sanitizer

**Difficulty 1/5 - band 0.5-3 min - entry `http://127.0.0.1:18977/`**

"Dalgona" game "Cross 3". `GET /page?name=...` lands your input in the
`value="..."` attribute of a text input. A sanitizer strips one particular
tag name from your input - case-sensitively, in one pass.

Observable: feed it the classic tag in lowercase and watch what the rendered
attribute looks like afterwards; the stripped word disappears but the rest of
your bytes survive. Other element names are not touched at all.

Goal: make a JavaScript dialog carrying the literal string `XSS` fire. The playground renders your input into a page, runs the result through an in-target headless browser, and grades the dialog text - a correct hit prints the flag on the page. The filter reads your raw bytes; the browser interprets the rendered DOM. Those two views do not have to agree.

`./RESET.sh` restores factory state.
