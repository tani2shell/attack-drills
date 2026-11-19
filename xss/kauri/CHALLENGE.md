# kauri - dialog-word blacklist bypass

**Difficulty 3/5 - band 3-15 min - entry `http://127.0.0.1:18952/`**

The "Dalgona" XSS playground, game "Cross 5". `GET /page?name=...` echoes your
input into the rendered page right beside the form field, then the in-target
headless browser executes whatever you managed to inject.

The playground keeps a word list: the first dialog functions you would reach
for are on it. The rejection page names the exact word it disliked, so a few
requests are enough to map the blacklist.

Goal: make a JavaScript dialog carrying the literal string `XSS` fire. The playground renders your input into a page, runs the result through an in-target headless browser, and grades the dialog text - a correct hit prints the flag on the page. The filter reads your raw bytes; the browser interprets the rendered DOM. Those two views do not have to agree.

`./RESET.sh` restores factory state.
