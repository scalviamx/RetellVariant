# Human Handoff Rules

Trigger human handoff when the assistant should stop autonomous handling and notify the Scalvia team or client team.

## Always Handoff

- User asks to speak with a person.
- User is angry, confused, or repeatedly dissatisfied.
- User requests pricing negotiation or a custom quote.
- User shares sensitive medical, legal, financial, or safety information.
- User reports an emergency or urgent situation.
- User asks for something outside approved business data.
- Assistant confidence is low after one clarification.
- Booking failed more than once.
- WhatsApp send, CRM save, or calendar workflow fails.

## Handoff Output

```json
{
  "action": "trigger_handoff",
  "handoff_required": true,
  "reply": "Claro. Le aviso al equipo para que te contacte y revise tu caso.",
  "data_to_save": {
    "lead_status": "handoff_required"
  }
}
```

## User Message

Keep handoff confirmations short:

`Claro. Le aviso al equipo para que te contacte y revise tu caso.`

## Internal Notification

Include:

- Lead name.
- Phone.
- Business.
- Need.
- Urgency.
- Conversation summary.
- Recommended next action.
- Appointment info.
- Raw notes.
