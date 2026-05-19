# Credentials Needed

Configure these credentials in n8n credential manager or VPS environment variables. Do not commit real values.

- Meta WhatsApp Cloud API token.
- Webhook verify token.
- Google Sheets OAuth.
- Google Calendar OAuth.
- LLM provider key.
- Telegram bot token optional.
- SMTP/Gmail optional.

## Notes

- Use least privilege access.
- Rotate any credential that is exposed.
- Keep client credentials separated.
- Do not paste secrets into workflow names, node labels, notes, or exported docs.
