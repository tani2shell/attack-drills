#!/usr/bin/env bash
# dogwood — reset to factory state (fresh build) and health-gate the port.
set -uo pipefail
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env
docker compose down -v --remove-orphans >/dev/null 2>&1 || true
if ! docker compose up -d --build >/dev/null 2>&1; then
  echo "RESET-DEGRADED dogwood — compose up failed (check: docker compose logs)" >&2
  exit 1
fi
c=000
for i in $(seq 1 40); do
  c=$(curl -s -o /dev/null -m 3 -w '%{http_code}' "http://127.0.0.1:18944/" 2>/dev/null) || c=000
  [ "$c" != "000" ] && break
  sleep 2
done
if [ "$c" = "000" ]; then
  echo "RESET-DEGRADED dogwood (:18944) — no HTTP answer after 80s" >&2
  exit 1
fi

echo "RESET-OK dogwood http://127.0.0.1:18944"
