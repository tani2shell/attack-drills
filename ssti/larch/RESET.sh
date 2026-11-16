#!/usr/bin/env bash
# larch — reset to factory state (fresh build incl. clean database) and health-gate.
set -euo pipefail
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env
docker compose down -v --remove-orphans
docker compose up -d --build
for i in $(seq 1 60); do
  st=$(docker inspect -f '{{.State.Health.Status}}' larch 2>/dev/null || echo starting)
  if [ "$st" = healthy ]; then
    echo "RESET-OK larch http://127.0.0.1:18953"
    exit 0
  fi
  sleep 5
done
echo "RESET-FAIL: larch not healthy within 300s" >&2
exit 1
