# Troubleshooting

## Port Already In Use

Check the common ports:

```bash
lsof -i :3010
lsof -i :8000
lsof -i :5432
lsof -i :6379
lsof -i :9000
lsof -i :9001
```

Stop conflicting services only after confirming they are safe to stop.

## Docker Not Running

Start Docker Desktop, then run:

```bash
docker info
```

## Dograh UI Does Not Open

Check containers:

```bash
cd "$DOGRAH_DIR"
docker compose ps
docker compose logs -f ui
```

## API Health Fails

```bash
curl -i http://localhost:8000/api/v1/health
docker compose logs -f api
```

## Database Not Healthy

```bash
docker compose logs -f postgres
docker compose logs -f redis
```

## MinIO Fails

```bash
docker compose logs -f minio
```

Confirm ports `9000` and `9001` are free.

## Full Reset

Use:

```bash
./scripts/reset-local.sh
```

The script requires confirmation before removing Docker volumes.

## OPEN QUESTION

If Web Call audio fails locally, test with TURN enabled and document whether the issue is browser permissions, WebRTC negotiation, or model provider configuration.
