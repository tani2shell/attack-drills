#!/usr/bin/env bash
# Factory reset: rebuild from source; flag re-baked at build time from .env FLAG_B64.
set -euo pipefail
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env
umask 022
grep '^FLAG_B64=' .env | cut -d= -f2- | base64 -d > flag.txt
docker compose down -v
docker compose up -d --build
PORT=$(grep -E '^HOST_PORT=' .env | cut -d= -f2- || true)
PORT=${PORT:-28901}
for i in $(seq 1 80); do
  code=$(curl -s -o /dev/null -w '%{http_code}' "http://127.0.0.1:$PORT/" || true)
  if [ -n "$code" ] && [ "$code" != "000" ]; then echo "RESET-OK (HTTP $code on :$PORT)"; exit 0; fi
  sleep 3
done
echo "RESET FAILED: no HTTP response on :$PORT after 240s" >&2
exit 1
