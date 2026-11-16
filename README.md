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
| [`ssti/`](ssti/) | Server-side template injection | `dogwood` `larch` `ramin` `rosewood` |
| [`lfi/`](lfi/) | Path traversal / file inclusion | `birch` |
| [`deser/`](deser/) | Insecure deserialization | `cedar` |
| [`upload/`](upload/) | Unrestricted file upload | `elder` |
| [`xss/`](xss/) | Cross-site scripting | *loading — next wave* |
| [`ssrf/`](ssrf/) | Server-side request forgery | *loading — next wave* |
| [`bizlogic/`](bizlogic/) | Business-logic flaws | *loading — next wave* |

Every drill ships the same kit: black-box brief (`CHALLENGE.md`), full
walkthrough with the flag (`SOLUTION.md`), one-command factory reset
(`RESET.sh`), `docker-compose.yml`, and a `.env.example` carrying the
(public) flag.

## Full calibration table

*Measured solve = wall-clock seconds of an AI pentest agent against the live
factory-state instance (single solver, clean slate). Tier = design-time
difficulty. Band = the class band the drill was calibrated against when
built. Seconds are measured values, not estimates — see each drill's
walkthrough for the kill chain.*

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
| [`lfi/birch`](lfi/birch/) | Apache 2.4.49 traversal → CGI RCE | 18942 | 2.5/5 | 3–15 min | —¹ | `f54ca53f` |
| [`deser/cedar`](deser/cedar/) | Pickle deserialization RCE | 18943 | 2/5 | 3–15 min | —¹ | `c6e50c0e` |
| [`upload/elder`](upload/elder/) | Upload filter bypass → RCE | 18945 | 2/5 | 3–15 min | —¹ | `e63fb506` |

¹ Wave-A-batch imports solved as a suite (5/5 first blood, band 3–15 min,
median ≈ 5m20s); per-drill stopwatch values are being backfilled on the next
field pass.

Ports are unique across the whole repo — arm several drills at once if your
box can take it. Flags follow the house format `FLAG{xbow_<drill>_<24 hex>}`
(some early waves carry a doubled closing brace — planted shape, not a typo).

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

玩法:进目录 → `cp .env.example .env` → `docker compose up -d --build` → 打 `127.0.0.1:<端口>` → `./RESET.sh` 复位。旗值随题解公开。

上游来源:[xbow-engineering/validation-benchmarks](https://github.com/xbow-engineering/validation-benchmarks)(Apache-2.0),全部经换旗重烘焙+不透明改名+重建后发布;打包代码 MIT。

## 日本語

**AI-Calibrated Attack Drills シリーズ**——単一脆弱性ウェブターゲット。1本=1 Docker、全ドリル出荷前に自律AI pentestエージェントがブラックボックスで撃破済み。ストーリー型ラボと違い、ドリルは攻撃面・ポート・フラグを一つに隔離し、設計難易度バンドとエージェント実測タイムを並べて掲載——自分の道具(と腕)の精度がそのまま数字になります。

遊び方:ドリル目录で `cp .env.example .env` → `docker compose up -d --build` → `127.0.0.1:<ポート>` を攻略 → `./RESET.sh` で工場復元。フラグ値はSOLUTION.mdに公開。

上流:[xbow-engineering/validation-benchmarks](https://github.com/xbow-engineering/validation-benchmarks)(Apache-2.0)由来のベンチマークを、フラグ再植・改名・再ビルドして派生公開。パッケージ部は MIT。
