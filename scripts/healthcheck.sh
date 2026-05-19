#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOGRAH_DIR="${DOGRAH_DIR:-$(cd "$ROOT_DIR/.." && pwd)/dograh}"

echo "Checking Dograh local lab"

if [[ -f "$DOGRAH_DIR/docker-compose.yaml" ]]; then
  cd "$DOGRAH_DIR"
  docker compose ps
else
  echo "Dograh repo not found at: $DOGRAH_DIR"
fi

echo
echo "API health:"
curl -fsS http://localhost:8000/api/v1/health
echo

echo "UI health:"
curl -fsSI http://localhost:3010 >/dev/null
echo "UI responded at http://localhost:3010"

echo "MinIO health:"
curl -fsS http://localhost:9000/minio/health/live
echo
