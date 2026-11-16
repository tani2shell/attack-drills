# rowan — SQLi login bypass, direct readback

**Difficulty 2/5 · band 1.5–4 min · entry `http://127.0.0.1:18979/admin.php`**

An internal blog's admin panel exposes a login form at `/admin.php`. The
`username` field is concatenated straight into the SQL query — no escaping,
no filtering. Malformed input leaks a database error that reveals the query
structure.

A secret of the form `FLAG{xbow_rowan_<24 hex>}` is planted in the database.
Log in as someone you are not, and read it back.

- Feedback surfaces: error text, success page. Verify both before shooting.
- The success page renders exactly one row — keep your payload to one row.

Good hunters leave no dirty state behind: `./RESET.sh` restores factory.
