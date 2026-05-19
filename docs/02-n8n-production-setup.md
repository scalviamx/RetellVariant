# n8n Production Setup

n8n on the Scalvia Hostinger VPS is the real execution environment for this product.

## Source of Truth

- Workflows are created and tested in n8n.
- Exports are committed to GitHub under `n8n/workflows/`.
- Prompts and schemas in this repo should guide the n8n workflow logic.

## Credentials

Configure credentials only inside n8n credential manager or VPS environment variables. Do not commit credentials to GitHub.

Expected credentials include:

- Meta WhatsApp Cloud API token.
- Webhook verify token.
- Google Sheets OAuth.
- Google Calendar OAuth.
- LLM provider key.
- Optional Telegram bot token.
- Optional SMTP or Gmail credentials.

## Workflow Naming

Use clear names with numeric prefixes:

- `01 - WhatsApp Inbound Router`
- `02 - Scalvia AI Receptionist`
- `03 - Calendar Availability`
- `04 - Create Appointment`
- `05 - Lead CRM Logger`
- `06 - Human Handoff`
- `07 - Follow-up and Reminder Sender`
- `08 - Daily Debrief`
- `09 - Error Monitor`

## Export Process

After workflow changes:

1. Test the workflow in n8n.
2. Export the workflow JSON.
3. Replace the matching file in `n8n/workflows/`.
4. Commit the export with a clear message.

## Important

Keep client-specific data and credentials out of exports whenever possible. If an export includes sensitive values by accident, remove the file, rotate the secret, and recommit a cleaned export.
