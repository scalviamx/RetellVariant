# Dograh Repo Audit

Audit source: `https://github.com/dograh-hq/dograh`

Audit commit: `0097974`

Audit date: 2026-05-18 local project context.

## Frameworks Detected

- Backend: Python API, FastAPI-style app entry at `api/app.py`.
- Backend runtime: Python `>=3.12` in `api/pyproject.toml`; repo `.python-version` is `3.13.7`.
- Frontend: Next.js `15.3.3`, React `19.1.0`, TypeScript.
- UI package manager: npm, confirmed by `ui/package-lock.json`.
- Workflow UI: React Flow dependency `@xyflow/react`.
- Background jobs: ARQ worker.
- Database migrations: Alembic.
- Voice runtime: Pipecat submodule.
- Telephony modules: Twilio, Vonage, Telnyx, Plivo, Vobiz, Cloudonix references in code and docs.

## Services Docker Detected

From `docker-compose.yaml`:

- `postgres`: `pgvector/pgvector:pg17`
- `redis`: `redis:7`
- `minio`: `minio/minio`
- `dograh-init`: setup profile for remote/local-turn
- `nginx`: remote HTTPS profile
- `coturn`: TURN server profile
- `api`: `${REGISTRY:-dograhai}/dograh-api:latest`
- `ui`: `${REGISTRY:-dograhai}/dograh-ui:latest`
- `cloudflared`: local tunnel to API

From `docker-compose-local.yaml`:

- `postgres`
- `redis`
- `minio`

## Ports Used

- `3010`: Dograh UI in Docker image mode.
- `3000`: UI dev server in source development mode.
- `8000`: API.
- `5432`: Postgres.
- `6379`: Redis.
- `9000`: MinIO API.
- `9001`: MinIO console.
- `2000`: cloudflared metrics.
- `3478`: TURN TCP/UDP when enabled.
- `5349`: TURN TLS TCP/UDP when enabled.
- `49152-49200/udp`: TURN relay range when enabled.

## Database Used

- PostgreSQL with pgvector.
- Default local Docker values are `postgres/postgres/postgres`.
- Async SQLAlchemy style URL documented: `postgresql+asyncpg://postgres:postgres@localhost:5432/postgres`.

## Variables Detected

Core variables from Dograh docs and compose:

- `ENVIRONMENT`
- `DEPLOYMENT_MODE`
- `AUTH_PROVIDER`
- `DATABASE_URL`
- `REDIS_URL`
- `OSS_JWT_SECRET`
- `OSS_JWT_EXPIRY_HOURS`
- `BACKEND_API_ENDPOINT`
- `UI_APP_URL`
- `MPS_API_URL`
- `DOGRAH_MPS_SECRET_KEY`
- `ENABLE_AWS_S3`
- `MINIO_ENDPOINT`
- `MINIO_PUBLIC_ENDPOINT`
- `MINIO_ACCESS_KEY`
- `MINIO_SECRET_KEY`
- `MINIO_BUCKET`
- `MINIO_SECURE`
- `TURN_HOST`
- `TURN_PORT`
- `TURN_TLS_PORT`
- `TURN_SECRET`
- `TURN_CREDENTIAL_TTL`
- `FORCE_TURN_RELAY`
- `LANGFUSE_HOST`
- `LANGFUSE_PUBLIC_KEY`
- `LANGFUSE_SECRET_KEY`
- `SENTRY_DSN`
- `ENABLE_TELEMETRY`
- `LOG_LEVEL`
- `LOG_FILE_PATH`
- `LOG_ROTATION_SIZE`
- `LOG_RETENTION`
- `LOG_COMPRESSION`
- `SERIALIZE_LOG_OUTPUT`
- `DEFAULT_ORG_CONCURRENCY_LIMIT`
- `FASTAPI_WORKERS`
- `BACKEND_URL`
- `NEXT_PUBLIC_BACKEND_URL`
- `NEXT_PUBLIC_NODE_ENV`

## Commands Available

Published Docker quickstart:

```bash
curl -o docker-compose.yaml https://raw.githubusercontent.com/dograh-hq/dograh/main/docker-compose.yaml && REGISTRY=ghcr.io/dograh-hq ENABLE_TELEMETRY=false docker compose up --pull always
```

Source development setup:

```bash
bash scripts/setup_fork.sh
source venv/bin/activate
nvm use 24
cd ui && npm install && cd ..
docker compose -f docker-compose-local.yaml up -d
bash scripts/setup_requirements.sh
bash scripts/start_services_dev.sh
cd ui && npm run dev
```

Health check:

```bash
curl http://localhost:8000/api/v1/health
```

Logs:

```bash
tail -f logs/latest/*.log
```

## Risks Of Setup

- Node version is strict: Dograh recommends Node 24; repo `.nvmrc` is `v24.11.1`.
- Python version is modern: repo `.python-version` is `3.13.7`; contributors docs say Python 3.13.
- Ports may conflict with local Postgres, Redis, n8n, MinIO, or other dev services.
- Docker image mode uses published images and may require stable network access.
- Telemetry defaults are mixed across docs/compose; explicitly set `ENABLE_TELEMETRY=false` for internal lab.
- Real telephony requires provider configuration and probably a publicly reachable URL.
- WebRTC reliability may require TURN configuration for remote or restrictive networks.

## Possible Blockers

- Apple Silicon image compatibility needs to be verified locally.
- Dograh documentation says language support is expandable; Spanish Mexican quality must be tested with selected providers.
- Realtime provider docs mention Gemini Live language examples mostly in English; Spanish `es-MX` behavior must be validated.
- Real telephony requires Twilio/Vonage/Telnyx/other provider credentials and callback setup.
- Calendar integration is not native in the inspected quickstart; use webhook/tooling path first.

## What Is Missing To Run Local

- Dograh repo cloned locally.
- Docker Desktop running.
- Free ports: `3010`, `8000`, `5432`, `6379`, `9000`, `9001`.
- Optional source-dev requirements: Node 24, Python 3.13, npm install, venv, Python requirements.

## What Is Missing To Connect Real Calls

- Telephony provider account.
- Phone number.
- Provider credentials.
- Public HTTPS callback URL.
- Dograh telephony configuration.
- End-to-end inbound or outbound call test.

## What Is Missing To Compare Against Retell

- Retell baseline agent configuration documented.
- Equivalent Sofía prompt in Dograh.
- Same test scenarios across both platforms.
- At least 20 call tests.
- Scores in a shared rubric.
- Latency and failure notes.

## OPEN QUESTION

- Does Dograh currently support agent import/export as JSON through UI or API in a stable format suitable for committing config files?
- Which provider combo gives the best Spanish Mexican voice quality: Dograh defaults, OpenAI, ElevenLabs, Deepgram, Cartesia, or Gemini Live?
- Does Dograh provide retries for webhook nodes in the exact UI version being tested, or only through workflow schema fields?
