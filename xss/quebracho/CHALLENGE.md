# quebracho - reflection inside a script tag

**Difficulty 1/5 - band 0.5-3 min - entry `http://127.0.0.1:18976/`**

"Dalgona" game "Cross 6". `GET /page?name=...` reflects your input into a live
script block on the page - JavaScript **string** context, not HTML. The page
also writes out a greeting built from the variable your input became.

One word sits on the blacklist (the rejection page names it). To win you must
close the string literal you live in, fire a dialog, and keep the remainder of
the line from throwing a syntax error before your dialog runs.

Goal: make a JavaScript dialog carrying the literal string `XSS` fire. The playground renders your input into a page, runs the result through an in-target headless browser, and grades the dialog text - a correct hit prints the flag on the page. The filter reads your raw bytes; the browser interprets the rendered DOM. Those two views do not have to agree.

`./RESET.sh` restores factory state.
