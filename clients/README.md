# Clients

Client folders are templates and configuration examples only.

Do not commit:

- Real secrets.
- Real API keys.
- Real access tokens.
- Webhook secrets.
- Customer PII.
- Private notes that should not live in Git.

Use `clients/_template/` as the starting point for new client implementations. Keep client-specific credentials in n8n credential manager, VPS environment variables, or an approved secrets manager.
