# n8n Webhook Integration

Future flow:

Dograh call event -> n8n webhook -> save lead -> notify Telegram/email -> create follow-up task.

Dograh supports webhook nodes in workflow definitions. Webhook nodes fire asynchronously after a workflow run completes and can use context variables such as `workflow_run_id`, `workflow_name`, `initial_context`, `gathered_context`, `recording_url`, and `transcript_url`.

## MVP Mode

- Use a Dograh webhook node.
- Send to `N8N_WEBHOOK_URL`.
- Include an auth header using `N8N_WEBHOOK_SECRET`.
- In n8n, validate the secret before processing.
- Save to Google Sheets first.

## Expected Payload

```json
{
  "source": "dograh",
  "agent": "sofia-scalvia",
  "event_type": "lead_captured",
  "lead": {
    "name": "",
    "phone": "",
    "email": "",
    "business_type": "",
    "interest": "",
    "summary": ""
  },
  "call": {
    "started_at": "",
    "ended_at": "",
    "duration_seconds": 0,
    "transcript": "",
    "recording_url": ""
  }
}
```

## Dograh Payload Template Draft

Adjust after testing actual variable extraction names:

```json
{
  "source": "dograh",
  "agent": "sofia-scalvia",
  "event_type": "lead_captured",
  "workflow_run_id": "{{workflow_run_id}}",
  "workflow_name": "{{workflow_name}}",
  "lead": {
    "name": "{{gathered_context.name}}",
    "phone": "{{gathered_context.phone}}",
    "email": "{{gathered_context.email}}",
    "business_type": "{{gathered_context.business_type}}",
    "interest": "{{gathered_context.interest}}",
    "summary": "{{gathered_context.summary}}"
  },
  "call": {
    "started_at": "{{call_time}}",
    "ended_at": "",
    "duration_seconds": 0,
    "transcript_url": "{{transcript_url}}",
    "recording_url": "{{recording_url}}"
  }
}
```

## n8n Workflow

1. Webhook trigger.
2. Validate `X-Scalvia-Webhook-Secret`.
3. Normalize payload.
4. Upsert lead in Google Sheets.
5. Notify Telegram/email.
6. Create follow-up task.
7. Log result.

## OPEN QUESTION

Confirm exact Dograh gathered context keys after Sofía is built in the dashboard.
