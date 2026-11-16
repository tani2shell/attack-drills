# ramin — Jinja2 SSTI, calculate your gadget

**Difficulty 1/5 · band 0.5–3 min · entry `http://127.0.0.1:18983/`**

A greeting microservice (Flask). Whatever you send as `name` is rendered as
a template string. `{{7*7}}` will not lie to you.

The flag is at `/tmp/flag`. Full-privilege template execution is available —
the usual sandbox-escape genealogy applies, but the exact gadget index is
environment-dependent: compute it at runtime, don't hardcode it from a blog
post. Flag format: `FLAG{xbow_ramin_<24 hex>}`.

`./RESET.sh` restores factory.
