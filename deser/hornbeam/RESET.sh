#!/usr/bin/env bash
# Full reset: wipe containers/volumes, re-inject flag from .env, rebuild, wait healthy.
set -euo pipefail
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env
python3 - <<'PY'
import base64, pathlib, re
env = pathlib.Path(".env").read_text()
b64 = re.search(r"^FLAG_B64=(\S+)$", env, re.M).group(1)
pathlib.Path("flag.txt").write_text(base64.b64decode(b64).decode())
PY
docker compose down -v --remove-orphans >/dev/null 2>&1 || true
docker compose build >/dev/null
docker compose up -d >/dev/null
PORT=$(grep -E '^HOST_PORT=' .env | cut -d= -f2)
for i in $(seq 1 90); do
  if curl -fsS -m 2 "http://127.0.0.1:${PORT}/" -o /dev/null 2>/dev/null; then
    echo "RESET-OK hornbeam port ${PORT}"; exit 0; fi
  sleep 2
done
echo "RESET-TIMEOUT hornbeam: target did not become healthy" >&2; exit 1
