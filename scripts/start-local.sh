#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOGRAH_DIR="${DOGRAH_DIR:-$(cd "$ROOT_DIR/.." && pwd)/dograh}"

echo "Starting Dograh local lab"
echo "Dograh directory: $DOGRAH_DIR"

if [[ ! -f "$DOGRAH_DIR/docker-compose.yaml" ]]; then
  echo "Dograh repo not found at: $DOGRAH_DIR"
  echo "Clone it first:"
  echo "  cd $(cd "$ROOT_DIR/.." && pwd)"
  echo "  git clone https://github.com/dograh-hq/dograh.git"
  echo "Or set DOGRAH_DIR=/path/to/dograh"
  exit 1
fi

cd "$DOGRAH_DIR"
REGISTRY="${REGISTRY:-ghcr.io/dograh-hq}" ENABLE_TELEMETRY="${ENABLE_TELEMETRY:-false}" docker compose up --pull always -d

echo "Dograh is starting."
echo "UI:  http://localhost:3010"
echo "API: http://localhost:8000/api/v1/health"
echo "Run ./scripts/healthcheck.sh after containers finish starting."
