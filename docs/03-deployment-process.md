# Deployment Process

Use this process to move from local repo changes to production workflow updates.

1. Edit docs, prompts, and schemas locally.
2. Commit changes to GitHub.
3. Build or update the n8n workflow on the Hostinger VPS.
4. Test with a WhatsApp test payload.
5. Test with a real inbound WhatsApp message.
6. Test AI response generation.
7. Test CRM save to Google Sheets.
8. Test Google Calendar booking.
9. Export the workflow JSON from n8n.
10. Commit the workflow export to this repo.

## Pre-Go-Live Checks

- No real secrets committed.
- Webhook uses HTTPS.
- Meta webhook verification works.
- Non-message events are ignored.
- Opt-out handling works.
- Handoff notification works.
- Error monitor catches failed sends, malformed payloads, and calendar failures.
