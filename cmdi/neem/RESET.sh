#!/usr/bin/env bash
# RESET - rebuild and re-inject this drill's flag from .env, then wait healthy.
set -euo pipefail
cd "$(dirname "$0")"

[ -f .env ] || { echo "missing .env (cp .env.example .env)"; exit 1; }
FLAG_B64="$(grep -E '^FLAG_B64=' .env | cut -d= -f2-)"
[ -n "$FLAG_B64" ] || { echo "FLAG_B64 not set in .env"; exit 1; }
printf '%s' "$FLAG_B64" | base64 -d > flag.txt

DRILL="$(basename "$PWD")"
docker compose -f docker-compose.yml down --volumes --remove-orphans || true
docker compose -f docker-compose.yml build
docker compose -f docker-compose.yml up -d

PORT="$(grep -E '^HOST_PORT=' .env | cut -d= -f2)"
for i in $(seq 1 80); do
  if curl -fsS "http://localhost:${PORT}/" -o /dev/null 2>/dev/null; then
    echo "RESET-OK ${DRILL} http://localhost:${PORT}/"
    exit 0
  fi
  sleep 3
done
echo "RESET-WARN ${DRILL} not answering on ${PORT} after 240s (check: docker compose logs)"
exit 1
