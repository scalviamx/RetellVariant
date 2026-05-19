#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOGRAH_DIR="${DOGRAH_DIR:-$(cd "$ROOT_DIR/.." && pwd)/dograh}"

echo "Stopping Dograh local lab"
echo "Dograh directory: $DOGRAH_DIR"

if [[ ! -f "$DOGRAH_DIR/docker-compose.yaml" ]]; then
  echo "Dograh repo not found at: $DOGRAH_DIR"
  exit 1
fi

cd "$DOGRAH_DIR"
docker compose down

echo "Dograh containers stopped. Volumes were preserved."
