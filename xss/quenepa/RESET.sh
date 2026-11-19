#!/usr/bin/env bash
# Factory reset: re-create the container from the baked image (flag re-baked at build time).
set -euo pipefail
cd "$(dirname "$0")"
docker compose up -d --force-recreate web
for i in $(seq 1 30); do
  st=$(docker inspect -f '{{.State.Health.Status}}' quenepa 2>/dev/null || echo starting)
  echo "health: $st"
  [ "$st" = "healthy" ] && exit 0
  sleep 2
done
echo "RESET FAILED: quenepa not healthy after 60s" >&2
exit 1
