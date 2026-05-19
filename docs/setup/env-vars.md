# Environment Variables

This file documents the environment variables for the Scalvia Dograh lab. Do not commit real secrets.

## App Core

| Variable | Status | Notes |
|---|---|---|
| `APP_ENV` | Mock for PoC | Scalvia wrapper label; Dograh uses `ENVIRONMENT`. |
| `APP_URL` | Mock for PoC | Scalvia wrapper label; Dograh UI Docker mode is `http://localhost:3010`. |
| `ENVIRONMENT` | Required | Dograh runtime environment. Use `local`. |
| `DEPLOYMENT_MODE` | Optional | Dograh default is `oss`. |
| `AUTH_PROVIDER` | Optional | Dograh default is `local` for OSS. |
| `BACKEND_API_ENDPOINT` | Required | API public/internal base URL, default `http://localhost:8000`. |
| `UI_APP_URL` | Required | UI URL. Docker mode default `http://localhost:3010`. |
| `ENABLE_TELEMETRY` | Optional | Set `false` for internal lab. |

## Database

| Variable | Status | Notes |
|---|---|---|
| `DATABASE_URL` | Required | `postgresql+asyncpg://postgres:postgres@localhost:5432/postgres`. |
| `REDIS_URL` | Required | `redis://:redissecret@localhost:6379`. |

## Auth / Secrets

| Variable | Status | Notes |
|---|---|---|
| `OSS_JWT_SECRET` | Required | Use a strong secret outside local mock. |
| `APP_SECRET` | Mock for PoC | Scalvia generic placeholder. |
| `BETTER_AUTH_SECRET` | Mock for PoC | Not confirmed as Dograh requirement. |
| `JWT_SECRET` | Mock for PoC | Use Dograh `OSS_JWT_SECRET` unless code requires otherwise. |

## Storage

| Variable | Status | Notes |
|---|---|---|
| `ENABLE_AWS_S3` | Optional | Default false for MinIO. |
| `MINIO_ENDPOINT` | Required | `localhost:9000` locally. |
| `MINIO_PUBLIC_ENDPOINT` | Required | `http://localhost:9000` locally. |
| `MINIO_ACCESS_KEY` | Required | Local placeholder only. |
| `MINIO_SECRET_KEY` | Required | Local placeholder only. |
| `MINIO_BUCKET` | Required | Default `voice-audio`. |
| `MINIO_SECURE` | Optional | `false` locally. |

## LLM Provider

| Variable | Status | Notes |
|---|---|---|
| `LLM_PROVIDER` | Mock for PoC | Dograh config is primarily through dashboard model configuration. |
| `OPENAI_API_KEY` | Optional | Only if OpenAI is selected in Dograh. |
| `GEMINI_API_KEY` | Optional | Only if Gemini/Gemini Live is selected. |

Dograh docs say LLM providers include OpenAI, Google, Groq, Azure, and Dograh models.

## STT Provider

| Variable | Status | Notes |
|---|---|---|
| `STT_PROVIDER` | Mock for PoC | Configure actual transcriber in Dograh UI. |
| `STT_API_KEY` | Optional | Provider-specific. |
| `DEEPGRAM_API_KEY` | Optional | If Deepgram is selected. |

Dograh docs mention Deepgram, Cartesia, OpenAI, and Dograh transcribers.

## TTS Provider

| Variable | Status | Notes |
|---|---|---|
| `TTS_PROVIDER` | Mock for PoC | Configure actual voice in Dograh UI. |
| `TTS_API_KEY` | Optional | Provider-specific. |
| `ELEVENLABS_API_KEY` | Optional | If ElevenLabs is selected. |

Dograh docs mention ElevenLabs, Deepgram, OpenAI, and Dograh TTS.

## Telephony

| Variable | Status | Notes |
|---|---|---|
| `TELEPHONY_PROVIDER` | Mock for PoC | Start with `mock` or Web Call. |
| `TWILIO_ACCOUNT_SID` | Optional | For Twilio real-call testing. |
| `TWILIO_AUTH_TOKEN` | Optional | Secret. |
| `TWILIO_PHONE_NUMBER` | Optional | Real number only in secure env. |
| `TURN_HOST` | Optional | Required for reliable WebRTC in some environments. |
| `TURN_SECRET` | Optional | Secret. |
| `FORCE_TURN_RELAY` | Optional | Diagnostic only. |

## n8n

| Variable | Status | Notes |
|---|---|---|
| `N8N_WEBHOOK_URL` | Optional | Future Dograh webhook node target. |
| `N8N_WEBHOOK_SECRET` | Optional | Store as credential/header, not in workflow text. |

## Google Calendar

| Variable | Status | Notes |
|---|---|---|
| `GOOGLE_CALENDAR_ENABLED` | Mock for PoC | Start false. |
| `GOOGLE_CLIENT_ID` | Optional | Future integration. |
| `GOOGLE_CLIENT_SECRET` | Optional | Secret. |
| `GOOGLE_REFRESH_TOKEN` | Optional | Secret. |
| `GOOGLE_CALENDAR_ID` | Optional | Use placeholder locally. |

## Observability

| Variable | Status | Notes |
|---|---|---|
| `LANGFUSE_HOST` | Optional | Tracing. |
| `LANGFUSE_PUBLIC_KEY` | Optional | Tracing. |
| `LANGFUSE_SECRET_KEY` | Optional | Secret. |
| `SENTRY_DSN` | Optional | Error tracking. |
| `LOG_LEVEL` | Optional | `DEBUG`, `INFO`, `WARNING`, `ERROR`. |

## OPEN QUESTION

Dograh model/provider API keys appear to be configured mainly through the dashboard, not only environment variables. Confirm after first local run.
