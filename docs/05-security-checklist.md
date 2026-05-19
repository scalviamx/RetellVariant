# Security Checklist

## Secrets

- Never commit tokens.
- Never commit customer PII.
- Use `.env.example` only for placeholder names.
- Rotate Meta tokens immediately if exposed.
- Use least privilege credentials.

## Webhooks and Network

- Use HTTPS.
- Validate webhook signatures if possible.
- Protect n8n with strong credentials.
- Use Cloudflare if available.
- Keep n8n updated.

## Data

- Backup workflows.
- Backup CRM data.
- Separate client data.
- Log errors without exposing secrets.
- Avoid storing full raw payloads unless needed.

## WhatsApp Compliance

- Respect opt-out.
- Avoid spam.
- Use approved templates for business-initiated messages where required.
- Do not send promotional messages unless the client has proper consent and template approval.

## Sensitive Conversations

- Escalate medical, legal, financial, safety, billing dispute, and urgent cases to a human.
- Assistants for clinics, consultorios, and dental clinics must not diagnose or give medical advice.
