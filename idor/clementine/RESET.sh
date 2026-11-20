#!/usr/bin/env bash
# Factory reset: rebuild from source; flag re-baked at build time from .env FLAG_B64.
set -euo pipefail
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env
docker compose down -v
docker compose up -d --build
PORT=${HOST_PORT:-19023}
for i in $(seq 1 60); do
  code=$(curl -s -o /dev/null -w '%{http_code}' "http://127.0.0.1:$PORT/" || true)
  if [ -n "$code" ] && [ "$code" != "000" ]; then echo "RESET-OK (HTTP $code on :$PORT)"; exit 0; fi
  sleep 3
done
echo "RESET FAILED: no HTTP response on :$PORT after 180s" >&2
exit 1
