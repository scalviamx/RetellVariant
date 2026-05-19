# Webhook Payload Normalization

The inbound router receives Meta WhatsApp Cloud API callback payloads and converts user messages into a consistent internal object.

## Expected Inbound Data

From Meta payload:

- Sender phone.
- Profile name.
- Message type.
- Message text when type is text.
- Timestamp.
- WhatsApp message ID.
- Raw payload for debugging if needed.

## Normalized Output

```json
{
  "channel": "whatsapp",
  "provider": "meta_cloud_api",
  "phone": "521XXXXXXXXXX",
  "profile_name": "Demo User",
  "message_text": "Hola, quiero información sobre asistentes de IA para mi clínica",
  "message_type": "text",
  "timestamp": "2026-05-18T20:00:00-05:00",
  "wa_message_id": "wamid.demo"
}
```

## Rules

- Ignore statuses and read receipts.
- Reject malformed payloads or route them to the error monitor.
- Keep normalized field names stable.
- Do not expose secrets in logs.
