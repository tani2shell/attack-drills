# quenepa - POST-only form, unfiltered

**Difficulty 1/5 - band 0.5-3 min - entry `http://127.0.0.1:18978/`**

"Dalgona" game "Cross 9". The playground moved its answer field to a POST form
(field name `solution`, endpoint `/page`). Plain `GET /page` shows only the
opening page - your bytes must travel as a POST body.

Whatever you POST is reflected into the `value="..."` attribute of the form's
input **raw**: this one strips nothing and blacklists nothing. A pure
escape-the-attribute drill.

Goal: make a JavaScript dialog carrying the literal string `XSS` fire. The playground renders your input into a page, runs the result through an in-target headless browser, and grades the dialog text - a correct hit prints the flag on the page. The filter reads your raw bytes; the browser interprets the rendered DOM. Those two views do not have to agree.

`./RESET.sh` restores factory state.
