#!/usr/bin/env bash
# ramin — reset to factory state (fresh build incl. clean database) and health-gate.
set -euo pipefail
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env
docker compose down -v --remove-orphans
docker compose up -d --build
for i in $(seq 1 60); do
  st=$(docker inspect -f '{{.State.Health.Status}}' ramin 2>/dev/null || echo starting)
  if [ "$st" = healthy ]; then
    echo "RESET-OK ramin http://127.0.0.1:18983"
    exit 0
  fi
  sleep 5
done
echo "RESET-FAIL: ramin not healthy within 300s" >&2
exit 1
