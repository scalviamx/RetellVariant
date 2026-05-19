# Local Setup

This guide is for running Dograh locally as a Scalvia internal lab.

## Requirements

- macOS on Apple Silicon.
- Docker Desktop.
- Git.
- For Docker image mode: no local Node or Python required.
- For source development mode:
  - Node `v24.11.1` from Dograh `.nvmrc`.
  - Python `3.13.7` from Dograh `.python-version`.
  - npm, confirmed by `ui/package-lock.json`.

## Recommended First Path: Docker Image Mode

Clone Dograh next to this repo:

```bash
cd /Users/robertomagallanes/Downloads/Scalvia/05_Repos
git clone https://github.com/dograh-hq/dograh.git
```

Start from this repo:

```bash
cd /Users/robertomagallanes/Downloads/Scalvia/05_Repos/scalvia-whatsapp-agents
./scripts/start-local.sh
```

Or start directly from Dograh:

```bash
cd /Users/robertomagallanes/Downloads/Scalvia/05_Repos/dograh
REGISTRY=ghcr.io/dograh-hq ENABLE_TELEMETRY=false docker compose up --pull always -d
```

## Validate

```bash
curl http://localhost:8000/api/v1/health
```

Open:

- `http://localhost:3010`
- `http://localhost:9001`

## Logs

```bash
docker compose logs -f api
docker compose logs -f ui
docker compose ps
```

## Stop

```bash
./scripts/stop-local.sh
```

Or directly:

```bash
cd /Users/robertomagallanes/Downloads/Scalvia/05_Repos/dograh
docker compose down
```

## Source Development Mode

Use this only if we need to modify Dograh itself.

```bash
cd /Users/robertomagallanes/Downloads/Scalvia/05_Repos/dograh
bash scripts/setup_fork.sh
source venv/bin/activate
nvm use 24
cd ui && npm install && cd ..
docker compose -f docker-compose-local.yaml up -d
bash scripts/setup_requirements.sh
bash scripts/start_services_dev.sh
cd ui && npm run dev
```

Source dev URLs:

- API: `http://localhost:8000/api/v1/health`
- UI: `http://localhost:3000`

## Common Port Conflicts

Check:

```bash
lsof -i :3010
lsof -i :8000
lsof -i :5432
lsof -i :6379
lsof -i :9000
lsof -i :9001
```

## OPEN QUESTION

Confirm whether Scalvia should use Docker image mode only for evaluation, or keep a fork of Dograh for code-level experiments.
