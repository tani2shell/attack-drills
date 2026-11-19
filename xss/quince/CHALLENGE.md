# quince - iframe src sandbox, dot-based filter

**Difficulty 2/5 - band 1.5-4 min - entry `http://127.0.0.1:18975/`**

"Dalgona" game "Cross 0": instead of echoing into text, `GET /page?url=...`
places your value into an `<iframe>` tag's attributes and the headless browser
loads the result. The filter is unusual:

- double quotes and angle brackets are stripped from your value;
- any token containing a dot that is not an `http(s)://` / `file://` URL
  ending in an image extension is deleted outright.

Probe behavior to calibrate on: a plain `http://host/x.exe` gets deleted and
the page falls back to its default frame; a value with no dot at all passes
through untouched.

Goal: make a JavaScript dialog carrying the literal string `XSS` fire. The playground renders your input into a page, runs the result through an in-target headless browser, and grades the dialog text - a correct hit prints the flag on the page. The filter reads your raw bytes; the browser interprets the rendered DOM. Those two views do not have to agree.

`./RESET.sh` restores factory state.
