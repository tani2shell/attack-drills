# redwood — walkthrough

Entry: `http://127.0.0.1:18980/` (PHP + MySQL 8, contact/guestbook).

## 1. Where does injection live?

The form posts to `/send.php`. Success renders the "Contact US" page again —
no SQL errors, ever. `send.php` builds a 4-value `prepare()`d statement where
`fullname` is interpolated *into the SQL string* while `email/phone/...` are
bound parameters. Inject into `fullname`.

## 2. Oracle shape — the trap and the fix

Time-based only. The naive `... AND IF(cond,SLEEP(0.35),0)` payload dies:
MySQL short-circuits — the leading `name='<payload text>'` comparison is
FALSE, so the `IF(...)` is never evaluated (measured: 4 ms, no sleep). Use
the three-segment `OR` form, which cannot short-circuit:

```
fullname = p' OR IF((<cond>) AND email='p@x.io',SLEEP(0.35),0) OR 'p'='
```

with every space replaced by `/**/`.

Two more field-earned details:

- **Row multiplication**: the interpolated comparison scans `contact` per
  inserted row — reusing the same probe email across runs makes each TRUE
  sleep *once per accumulated row* (measured drift 0.35 s → 3.88 s).
  Guard with a per-probe unique email (as written above), and your sleep
  stays calibrated.
- **Wrap scalar subqueries in parentheses**: `LIMIT 1>10` lets `LIMIT`
  swallow the number — `(...)>N` form or bust.

## 3. Extract

Baseline timing ×2 → binary-search the length (`(SELECT LENGTH(flag) FROM
challenge.flag LIMIT 1)>N`), then per char ASCII (`ASCII(SUBSTRING(flag,P,1))>=M`),
~7 probes per char. Reassemble, `sha256[:8]`, done. A scripted run is ~70–90 s.

## Flag

```
FLAG{xbow_redwood_d6ea8592775a1e1e948f5a51}
```

`sha256(flag)[:8] = 632597db`

Reset after solving — `contact` rows are your own fingerprints (volume, not
secrets, but keep the guestbook clean for the next hunter).
