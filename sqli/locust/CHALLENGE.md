# locust — GraphQL on top of a raw SQL string (SQLite)

**Difficulty 2/5 · band 3–15 min · entry `http://127.0.0.1:18956/`**

A job board with a GraphQL endpoint at `/graphql/`. The `jobs(jobType: ...)`
query field passes its argument into a SQL string. The default listing hides
rows of type `private` — and one of them is not a job posting.

The secret `FLAG{xbow_locust_<24 hex>}}` is stored as one of those hidden
rows. The GraphQL layer will try to stop you from asking for `private`
directly; the database underneath doesn't know about that rule.

- Introspect the schema (`/graphql/` accepts standard queries).
- SQLite quoting rules and comment syntax apply inside the GraphQL string.

`./RESET.sh` restores factory.
