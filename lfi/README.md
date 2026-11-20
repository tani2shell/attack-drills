# Path traversal / file inclusion drills

Four file-inclusion drills: a known-CVE Apache traversal escalated to CGI
RCE, an upload-then-include chain, log poisoning past an over-eager `../`
stripper, and a one-dot alias escape.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`birch`](birch/) | Path-traversal practice drill — stock Apache 2.4.49 `.%2e` traversal (CVE-2021-41773 era) escalated to CGI RCE. | 18942 | —¹ |
| [`crabapple`](crabapple/) | LFI practice drill - an upload form writes your file into the web root, and a page-inclusion endpoint will gladly run it. | 19026 | 1455 s |
| [`cypress`](cypress/) | LFI practice drill - the include filter strips '../' too eagerly, but Apache keeps a copy of your User-Agent. | 19027 | 640 s |
| [`durian`](durian/) | Path-traversal practice drill - a misconfigured location alias lets one dot-dot escape the document root. | 19028 | 77 s |

Arm: `cd <drill> && cp .env.example .env && docker compose up -d --build`,
then `./RESET.sh` restores factory state (birch's reset health-gates the
CGI execution channel, which occasionally comes up half-alive after a
rebuild). Full calibration table: [series README](../README.md).

The three later shots (`crabapple`, `cypress`, `durian`) ship their flag
base64-encoded in `.env.example` — no plaintext flag, no write-up; verify
your capture against the `sha256` anchor printed in each `CHALLENGE.md`.

¹ imported shot — known-CVE era box, no custom code; suite-level band
3–15 min, stopwatch value backfilling.
