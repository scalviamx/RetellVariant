#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOGRAH_DIR="${DOGRAH_DIR:-$(cd "$ROOT_DIR/.." && pwd)/dograh}"

echo "This will stop Dograh and remove its Docker volumes."
echo "Dograh directory: $DOGRAH_DIR"
echo "This deletes local Postgres, Redis, and MinIO data for the Dograh lab."
read -r -p "Type RESET to continue: " CONFIRM

if [[ "$CONFIRM" != "RESET" ]]; then
  echo "Reset cancelled."
  exit 0
fi

if [[ ! -f "$DOGRAH_DIR/docker-compose.yaml" ]]; then
  echo "Dograh repo not found at: $DOGRAH_DIR"
  exit 1
fi

cd "$DOGRAH_DIR"
docker compose down -v

echo "Dograh local volumes removed."
