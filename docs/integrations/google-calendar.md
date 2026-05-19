# Google Calendar Integration

Calendar starts in mock mode for the Dograh lab.

## Mock Mode

In mock mode, Sofía does not create calendar events. She says:

`Puedo tomar tus datos para que alguien del equipo te contacte y revise disponibilidad.`

Data to capture:

- Name.
- Phone.
- Email.
- Preferred day/time.
- Business type.
- Summary.

## Future Real Mode

Real calendar booking should be handled through n8n first:

Dograh -> n8n webhook -> Google Calendar availability -> create event -> notify team.

## Required Data

- Lead name.
- Phone.
- Email if available.
- Preferred timezone.
- Preferred date/time.
- Call purpose.
- Calendar ID.

## Timezone

Default timezone options:

- `America/Monterrey`
- `America/Chicago`

Pick one per environment and keep it consistent across Dograh, n8n, Google Calendar, and reports.

## Rules

- Do not propose past times.
- Confirm exact date and time before booking.
- Confirm name and phone before creating an event.
- Offer alternatives if there is no availability.
- Do not invent availability.
- Store calendar event ID after creation.

## Risks

- Timezone mismatch.
- Duplicate events.
- User says "mañana" near midnight.
- User changes date after confirmation.
- Calendar permissions expire.

## OPEN QUESTION

Decide whether Dograh should call n8n for calendar logic or whether Dograh should eventually have a direct Google Calendar tool.
