# Intent Router

The intent router classifies the normalized WhatsApp message and helps decide the next workflow action.

## Common Intents

- `greeting`
- `service_question`
- `pricing_question`
- `booking_request`
- `reschedule_request`
- `cancel_request`
- `demo_request`
- `lead_qualification`
- `human_request`
- `sensitive_request`
- `opt_out`
- `unknown`

## Actions

- `send_message`
- `ask_followup`
- `save_lead`
- `check_calendar`
- `create_appointment`
- `trigger_handoff`
- `close_conversation`

## Routing Rules

- If the message is only a greeting, ask what business or service the user needs.
- If the user asks for pricing and pricing is not explicitly approved, explain that pricing depends on scope and offer a call.
- If the user requests a demo or appointment, collect required booking data and check calendar.
- If the user asks for a human, trigger handoff.
- If the user sends `SALIR`, `BAJA`, `STOP`, or similar, set opt-out and close the conversation.
- If the message is medical, legal, financial, urgent, or sensitive, trigger handoff.
- If confidence is low, ask one short clarification.

## Minimum Output

```json
{
  "intent": "booking_request",
  "action": "check_calendar",
  "confidence": 0.82,
  "reason": "User asked for available times"
}
```
