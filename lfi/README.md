# Path traversal / file inclusion drills

Nine file-inclusion drills: a known-CVE Apache traversal escalated to CGI
RCE, upload-then-include chains, log poisoning past an over-eager `../`
stripper, alias-escape and directory-policy bypass reads, and an
unauthenticated plugin include sink — plus the classic one-dot escape.

| Drill | One-line | Port | Measured |
|---|---|---|---|
| [`birch`](birch/) | Path-traversal practice drill — stock Apache 2.4.49 `.%2e` traversal (CVE-2021-41773 era) escalated to CGI RCE. | 18942 | —¹ |
| [`crabapple`](crabapple/) | LFI practice drill - an upload form writes your file into the web root, and a page-inclusion endpoint will gladly run it. | 19026 | 1455 s |
| [`cypress`](cypress/) | LFI practice drill - the include filter strips '../' too eagerly, but Apache keeps a copy of your User-Agent. | 19027 | 640 s |
| [`durian`](durian/) | Path-traversal practice drill - a misconfigured location alias lets one dot-dot escape the document root. | 19028 | 77 s |
| [`padauk`](padauk/) | Static-resource include with developer commentary in the HTML — read the flag file straight off. | 28961 | 44 s (black-box run) |
| [`pecan`](pecan/) | Apache 2.4.50 path traversal — double-encode through the /icons/ alias to /FLAG.txt. | 28962 | ~1 min (black-box run; CVE table match, double-encode one-shot) |
| [`persimmon`](persimmon/) | LFI to code execution via access-log poisoning — include your own User-Agent. | 28963 | ~10 min (black-box run; the overrun was a payload-environment pitfall tax, adjudicated non-target fault) |
| [`poplar`](poplar/) | 403-guarded flag file in the webroot — case and encoding tricks walk the include open. | 28964 | 3 min 45 s (black-box run) |
| [`teak`](teak/) | WordPress plugin with an unauthenticated include sink — read the helper source, feed it a stream wrapper. | 28965 | 7 min 48 s (first flag, machine-clock delta from brief; within band) |

Arm: `cd <drill> && cp .env.example .env && docker compose up -d --build`,
then `./RESET.sh` restores factory state (birch's reset health-gates the
CGI execution channel, which occasionally comes up half-alive after a
rebuild). Full calibration table: [series README](../README.md).

The three later shots (`crabapple`, `cypress`, `durian`) ship their flag
base64-encoded in `.env.example` — no plaintext flag, no write-up; verify
your capture against the `sha256` anchor printed in each `CHALLENGE.md`.

¹ imported shot — known-CVE era box, no custom code; suite-level band
3–15 min, stopwatch value backfilling.
