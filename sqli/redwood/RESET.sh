#!/usr/bin/env bash
# redwood — reset to factory state (fresh build incl. clean database) and health-gate.
set -euo pipefail
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env
docker compose down -v --remove-orphans
docker compose up -d --build
for i in $(seq 1 60); do
  st=$(docker inspect -f '{{.State.Health.Status}}' redwood 2>/dev/null || echo starting)
  if [ "$st" = healthy ]; then
    echo "RESET-OK redwood http://127.0.0.1:18980"
    exit 0
  fi
  sleep 5
done
echo "RESET-FAIL: redwood not healthy within 300s" >&2
exit 1
