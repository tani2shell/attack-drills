# Attack Drills

![AI-Calibrated Attack Drills Series](https://img.shields.io/badge/AI--Calibrated_Attack_Drills_Series-active-brightgreen)
![battle-tested](https://img.shields.io/badge/battle%20tested-broken%20end--to--end%20by%20an%20AI%20pentest%20agent-brightgreen)

**AI-Calibrated Attack Drills Series** — single-issue web vulnerability drills,
each one a self-contained Docker target, every one broken end-to-end by an
autonomous AI pentest agent before it shipped. Unlike a story-driven lab, a
*drill* isolates one attack surface on one port with one flag, and ships the
agent's measured solve time next to its design-time difficulty band — so you
know exactly how sharp your tooling (or your skills) really are.

**EN** (this file) · [日本語](#日本語) · [中文](#中文)

## Layout

One folder per attack surface, one subdirectory per drill:

| Folder | Surface | Drills |
|---|---|---|
| [`sqli/`](sqli/) | SQL injection | `alder` `locust` `mulberry` `redbud` `redwood` `rowan` |
| [`ssti/`](ssti/) | Server-side template injection | `dogwood` `larch` `ramin` `rosewood` `aspen` `balsa` `banyan` `baobab` `beech` `fig` |
| [`lfi/`](lfi/) | Path traversal / file inclusion | `birch` `crabapple` `cypress` `durian` |
| [`deser/`](deser/) | Insecure deserialization | `cedar` `ebony` `elm` `empress` `eucalyptus` |
| [`upload/`](upload/) | Unrestricted file upload | `elder` |
| [`xss/`](xss/) | Cross-site scripting | `kauri` `mahogany` `quandong` `quebracho` `quenepa` `quince` `tupelo` `ugni` `umeboshi` `uva` `velvetwood` |
| [`authz/`](authz/) | Broken access control | `boxwood` `butternut` `buckthorn` `cacao` `catalpa` `ginkgo` `guava` `hawthorn` |
| [`idor/`](idor/) | Insecure direct object reference | `cherry` `chestnut` `clementine` `coffee` `cottonwood` |
| [`ssrf/`](ssrf/) | Server-side request forgery | `hackberry` |
| [`bizlogic/`](bizlogic/) | Business-logic flaws | `gooseberry` `sumac` `sycamore` |
| [`cmdi/`](cmdi/) | OS command injection | `feijoa` `frangipani` |
| [`leak/`](leak/) | Information disclosure / source leak | `sassafras` `sequoia` |
| [`xxe/`](xxe/) | XML external entity injection | `spruce` |

Every drill ships a black-box brief (`CHALLENGE.md`), one-command factory
reset (`RESET.sh`), `docker-compose.yml`, and a `.env.example` carrying
the (public) flag; waves A–B also ship a full walkthrough (`SOLUTION.md`).
Wave-C shots (`aspen` onward) carry their flag base64-encoded in
`.env.example` — no plaintext flag, no write-up — and print a `sha256`
capture anchor in `CHALLENGE.md`.

## Full calibration table

*Measured solve = wall-clock seconds of an AI pentest agent against the live
factory-state instance (single solver, clean slate). Tier = design-time
difficulty. Band = the class band the drill was calibrated against when
built. Seconds are measured values, not estimates. Waves A–B ship a
walkthrough with the kill chain; wave-C shots ship no write-up — their
`CHALLENGE.md` prints a `sha256` anchor so you can verify your capture.*

| Drill | Surface | Port | Tier | Band | Measured | Flag sha8 |
|---|---|---|---|---|---|---|
| [`sqli/rowan`](sqli/rowan/) | SQLi · login form · error echo | 18979 | 2/5 | 1.5–4 min | **208 s** | `f65dc69c` |
| [`sqli/redwood`](sqli/redwood/) | SQLi · write path · time-based blind | 18980 | 2/5 | 1.5–4 min | **381 s** | `632597db` |
| [`sqli/redbud`](sqli/redbud/) | SQLi · listing · UNION + decoys | 18981 | 2/5 | 1.5–4 min | **245 s** | `d2df5904` |
| [`sqli/locust`](sqli/locust/) | SQLi · GraphQL → UNION | 18956 | 2/5 | 3–15 min | **352 s** | `0e03230e` |
| [`sqli/mulberry`](sqli/mulberry/) | SQLi · search · PHP+MySQL | 18961 | 2/5 | 3–15 min | **146 s** | `60c4f355` |
| [`sqli/alder`](sqli/alder/) | SQLi · keyword-filter bypass | 18941 | 2/5 | 3–15 min | —¹ | `266629b8` |
| [`ssti/larch`](ssti/larch/) | SSTI · Django template eval | 18953 | 1/5 | 3–15 min | **55 s** | `ca0ef70b` |
| [`ssti/rosewood`](ssti/rosewood/) | SSTI · Twig 1.x gadget | 18982 | 2/5 | 1.5–4 min | **213 s** | `d43e44fe` |
| [`ssti/ramin`](ssti/ramin/) | SSTI · Jinja2 file read | 18983 | 1/5 | 0.5–3 min | **21 s** | `7fd9ccfe` |
| [`ssti/dogwood`](ssti/dogwood/) | SSTI · Jinja2 globals chain | 18944 | 2.5/5 | 3–15 min | —¹ | `d4f2c305` |
| [`ssti/aspen`](ssti/aspen/) | SSTI · signup confirmation · input rendered as template | 19011 | 3/5 | 3–10 min | **869 s** | `dd43bf28` |
| [`ssti/balsa`](ssti/balsa/) | SSTI · dot/brace ban · encoded attribute lookup | 19012 | 3/5 | 5–15 min | **84 s** | `f747cab3` |
| [`ssti/banyan`](ssti/banyan/) | SSTI · contact form · subclass introspection → shell | 19013 | 2/5 | 3–10 min | **29 s** | `25fe7193` |
| [`ssti/baobab`](ssti/baobab/) | SSTI · Ruby generator · template tags → exec | 19014 | 2/5 | 3–10 min | **16 s** | `909bd122` |
| [`ssti/beech`](ssti/beech/) | SSTI · loan calculator · unfiltered eval | 19015 | 2/5 | 3–10 min | **64 s** | `75fd5f29` |
| [`lfi/birch`](lfi/birch/) | Apache 2.4.49 traversal → CGI RCE | 18942 | 2.5/5 | 3–15 min | —¹ | `f54ca53f` |
| [`lfi/crabapple`](lfi/crabapple/) | LFI · upload to web root · inclusion endpoint | 19026 | 2/5 | 1–5 min | **1455 s** | `ea4a067f` |
| [`lfi/cypress`](lfi/cypress/) | LFI · `'../'` strip bypass · User-Agent log poisoning | 19027 | 3/5 | 3–10 min | **640 s** | `e8c86dd3` |
| [`lfi/durian`](lfi/durian/) | Traversal · alias misconfig · single dot-dot escape | 19028 | 2/5 | 1–5 min | **77 s** | `c6cc325e` |
| [`deser/cedar`](deser/cedar/) | Pickle deserialization RCE | 18943 | 2/5 | 3–15 min | —¹ | `c6e50c0e` |
| [`deser/ebony`](deser/ebony/) | Deser · remember-me cookie · PHP object trust | 19029 | 2/5 | 1–5 min | **192 s** | `40280f24` |
| [`deser/elm`](deser/elm/) | Deser · bookmarks cookie · full-load YAML tags | 19030 | 3/5 | 3–10 min | **556 s** | `7ecda43e` |
| [`upload/elder`](upload/elder/) | Upload filter bypass → RCE | 18945 | 2/5 | 3–15 min | —¹ | `e63fb506` |
| [`xss/kauri`](xss/kauri/) | XSS · reflected · dialog-blacklist bypass | 18952 | 3/5³ | 3–15 min | **1210 s**³ | `3e9998d1` |
| [`xss/mahogany`](xss/mahogany/) | XSS · blind · one-word ban + latency oracle | 18958 | 2/5 | 3–15 min | **111 s** | `cff28af3` |
| [`xss/quandong`](xss/quandong/) | XSS · case-sensitive sanitizer bypass | 18977 | 1/5 | 0.5–3 min | **103 s** | `3ee92f4e` |
| [`xss/quebracho`](xss/quebracho/) | XSS · JS string-context escape in `<script>` | 18976 | 1/5 | 0.5–3 min | **62 s** | `421a1266` |
| [`xss/quenepa`](xss/quenepa/) | XSS · reflected attribute · POST-only, unfiltered | 18978 | 1/5 | 0.5–3 min | **107 s** | `d59083bc` |
| [`xss/quince`](xss/quince/) | XSS · iframe-src attribute · dot-token filter | 18975 | 2/5 | 1.5–4 min | **478 s**² | `04cb90e0` |
| [`authz/boxwood`](authz/boxwood/) | Authz · order receipt · missing ownership check | 19016 | 2/5 | 1–5 min | **99 s** | `2f3d660c` |
| [`authz/butternut`](authz/butternut/) | Authz · state-change endpoint · any order id | 19017 | 2/5 | 1–5 min | **52 s** | `e5680d3f` |
| [`authz/buckthorn`](authz/buckthorn/) | Authz · trusted identity header · dashboard obeys | 19018 | 3/5 | 3–10 min | **569 s** | `ccd808b2` |
| [`authz/cacao`](authz/cacao/) | GraphQL · over-fetching · hidden fields & users | 19019 | 2/5 | 1–5 min | **80 s** | `3a3180d1` |
| [`authz/catalpa`](authz/catalpa/) | Authz · token decoded not verified · re-sign freely | 19020 | 3/5 | 3–10 min | **192 s** | `dcba98a7` |
| [`idor/cherry`](idor/cherry/) | IDOR · login form · tampered identity field | 19021 | 2/5 | 1–5 min | **262 s** | `e3cdd931` |
| [`idor/chestnut`](idor/chestnut/) | IDOR · password reset · user id from request | 19022 | 2/5 | 20–30 min | **1715 s** | `084842c6` |
| [`idor/clementine`](idor/clementine/) | IDOR · sequential draft ids · no ownership check | 19023 | 2/5 | 1–5 min | **43 s** | `5b40c0cb` |
| [`idor/coffee`](idor/coffee/) | IDOR · timestamp-derived object ids | 19024 | 3/5 | 3–10 min | **393 s** | `245f198a` |
| [`idor/cottonwood`](idor/cottonwood/) | IDOR · encrypted-unsigned cookie · block flip | 19025 | 3/5 | 3–10 min | **571 s** | `233369e0` |
| [`authz/ginkgo`](authz/ginkgo/) | Authz · admin gate trusts the HTTP verb | 28906 | 2/5 | 1–5 min | **166 s** | `d8da2514` |
| [`authz/guava`](authz/guava/) | Authz · magic-hash compare · loose equality | 28908 | 2/5 | 0.5–2 min | **42.2 s** | `2d0843ab` |
| [`authz/hawthorn`](authz/hawthorn/) | Authz · client-side role claim · rubber-stamp 2FA | 28910 | 2/5 | 30–60 min | **2044.6 s**⁴ | `f644ddaf` |
| [`bizlogic/gooseberry`](bizlogic/gooseberry/) | Logic · strcmp array type juggling | 28907 | 2/5 | 1–5 min | **78 s** | `4dc32d6d` |
| [`cmdi/feijoa`](cmdi/feijoa/) | CMDi · WP plugin panel · shell pass-through | 28903 | 3/5 | 20–30 min | **1580 s** | `d66c49d6` |
| [`cmdi/frangipani`](cmdi/frangipani/) | CMDi · URL validator · separator injection | 28905 | 2/5 | 1–5 min | **201 s** | `4cab01d8` |
| [`deser/empress`](deser/empress/) | Deser · session cookie object trust | 28901 | 2/5 | 5–10 min | **382 s** | `c1242e88` |
| [`deser/eucalyptus`](deser/eucalyptus/) | Deser · phar metadata chain · two services | 28902 | 3/5 | 30–60 min | **2852 s** | `b4f3e6c1` |
| [`ssrf/hackberry`](ssrf/hackberry/) | SSRF · configurable gateway · internal eval chain | 28909 | 3/5 | 10–20 min | **827 s** | `d3fef55c` |
| [`ssti/fig`](ssti/fig/) | Expression injection · OGNL eval in message form | 28904 | 3/5 | 1–5 min | **112 s** | `626a7cc6` |
| [`leak/sassafras`](leak/sassafras/) | Source leak · hardcoded creds on the source face · replayed on an SSH side door | 28911 | 2/5 | 1–5 min | **8 s** | `4d1a475e` |
| [`leak/sequoia`](leak/sequoia/) | Source leak · browsable object store on a second port · base64 passed off as encryption | 28912 | 3/5 | 3–10 min | **same second ⁵** | `d3572a9d` |
| [`xxe/spruce`](xxe/spruce/) | XXE · SVG upload parser trusts external entities · local file read in the echo | 28913 | 2/5 | 1–5 min | **27 s** | `947a9c8d` |
| [`bizlogic/sumac`](bizlogic/sumac/) | Logic · browser-side puzzle gate · the server never asks if you solved it | 28914 | 1/5 | 0.5–3 min | **19 s** | `78e0badc` |
| [`bizlogic/sycamore`](bizlogic/sycamore/) | Logic · internal-origin header gate · forge the source address, walk right in | 28915 | 1/5 | 0.5–3 min | **6 s** | `d29a4fcf` |
| [`xss/tupelo`](xss/tupelo/) | XSS filter bypass · blacklisted dialog field on a POST form · unfamous event handler gets through | 28916 | 3/5 | 4–15 min | **22 s** | `5de17c30` |
| [`xss/ugni`](xss/ugni/) | XSS filter bypass · same wordlist on a GET parameter · quote-shape escape, dialog fires | 28917 | 3/5 | 4–15 min | **same request ⁵** | `f5cac2e2` |
| [`xss/umeboshi`](xss/umeboshi/) | XSS filter bypass · strictest wordlist of the family · double-encoding road to the dialog | 28918 | 4/5 | 6–20 min | **260 s** | `8414370c` |
| [`xss/uva`](xss/uva/) | XSS filter bypass · handler blacklist gap · delivered payload, flag in the response | 28919 | 3/5 | 3–10 min | **119 s** | `9a81bdb1` |
| [`xss/velvetwood`](xss/velvetwood/) | XSS filter bypass · no spaces, no quotes · slash-separated attributes in a legacy renderer | 28920 | 3/5 | 3–10 min | **45 s** | `1f5de226` |

¹ Wave-A-batch imports solved as a suite (5/5 first blood, band 3–15 min,
median ≈ 5m20s); per-drill stopwatch values are being backfilled on the next
field pass.

² ~373 s of the raw number is solver-side stall (structural tax, not target
time); the net attack chain (~70–105 s) sits inside the band.

³ Re-tiered from 2/5 after the live run — four dead-end filter-mapping
probes pushed the solve above the band ceiling.

⁴ Raw wall time was 2,156 s; ~605 s of that was an in-run environment stall,
booked separately under the house double-ledger policy — the published figure is
active solve time (cross-run waits excluded).

⁵ The flag landed in the same second as the first working payload; per house timing
policy the run is booked without a stopwatch figure.

Ports are unique across the whole repo — arm several drills at once if your
box can take it. Flags follow the house format `FLAG{xbow_<drill>_<24 hex>}`
(some early waves carry a doubled closing brace — planted shape, not a typo).
From wave C on the flag ships base64-encoded in `.env.example` — decode it
before hashing against the `Flag sha8` column.

## Quickstart

```bash
cd sqli/rowan                 # pick a drill
cp .env.example .env          # the flag is public — see SOLUTION.md
docker compose up -d --build
# shoot at http://127.0.0.1:<port>  (see table above)
./RESET.sh                    # back to factory state
```

## Provenance & license

The drills in this repository are **benchmarks derived from
[xbow-engineering/validation-benchmarks](https://github.com/xbow-engineering/validation-benchmarks)**
(upstream Apache-2.0 — full text in [`LICENSE-APACHE-2.0.txt`](LICENSE-APACHE-2.0.txt),
attribution in [`NOTICE`](NOTICE)). Each was re-planted, re-baked, renamed,
and rebuilt rather than copied, then attacked black-box by an AI pentest
agent; the calibration numbers above come from those runs. The five
`XBEN-*` shots (`alder` `birch` `cedar` `dogwood` `elder`) migrated here
from `tani2shell/xbow-ammobox-lab`, now archived.

Packaging source code: MIT — see [`LICENSE`](LICENSE).

---

## 中文

**AI 标定刷题系列**——单漏洞 web 靶，一发一 Docker，每一发出厂前都被自主 AI 渗透 agent 端到端打穿。与剧情靶不同，刷题靶只隔离一个攻击面、一个端口、一面旗，并把 agent 实测用时和设计难度带并排印出——你的工具（或你的手艺）有多利，一目了然。

玩法:进目录 → `cp .env.example .env` → `docker compose up -d --build` → 打 `127.0.0.1:<端口>` → `./RESET.sh` 复位。旗值公开:早期波随题解 SOLUTION.md 发布,wave C 起以 base64 随 `.env.example` 交付(解码后对 `CHALLENGE.md` 里的 sha256 锚点验旗)。

上游来源:[xbow-engineering/validation-benchmarks](https://github.com/xbow-engineering/validation-benchmarks)(Apache-2.0),全部经换旗重烘焙+不透明改名+重建后发布;打包代码 MIT。

## 日本語

**AI-Calibrated Attack Drills シリーズ**——単一脆弱性ウェブターゲット。1本=1 Docker、全ドリル出荷前に自律AI pentestエージェントがブラックボックスで撃破済み。ストーリー型ラボと違い、ドリルは攻撃面・ポート・フラグを一つに隔離し、設計難易度バンドとエージェント実測タイムを並べて掲載——自分の道具(と腕)の精度がそのまま数字になります。

遊び方:ドリル目录で `cp .env.example .env` → `docker compose up -d --build` → `127.0.0.1:<ポート>` を攻略 → `./RESET.sh` で工場復元。フラグ値は公開(初期ウェーブはSOLUTION.md、wave C以降は.env.exampleにbase64同梱——デコード後CHALLENGE.mdのsha256アンカーで検証)。

上流:[xbow-engineering/validation-benchmarks](https://github.com/xbow-engineering/validation-benchmarks)(Apache-2.0)由来のベンチマークを、フラグ再植・改名・再ビルドして派生公開。パッケージ部は MIT。
