# Meta WhatsApp Cloud API Setup

Scalvia uses the official WhatsApp Cloud API / WhatsApp Business Platform. Do not use OpenWA, `whatsapp-web.js`, QR sessions, or WhatsApp Web automation.

## Setup Checklist

- Meta Business Portfolio.
- Meta Developer App.
- WhatsApp product added to the app.
- WhatsApp Business Account.
- Dedicated business phone number.
- Phone Number ID.
- WhatsApp Business Account ID.
- Permanent access token.
- Webhook verify token.
- Callback URL pointing to n8n.
- Test message flow.
- Production message flow.
- Message templates for business-initiated conversations.
- Service window handling.
- Opt-out handling.

## Required Values

Store these only in n8n credentials, VPS environment variables, or a secure secrets manager:

- `META_WHATSAPP_ACCESS_TOKEN`
- `META_WHATSAPP_PHONE_NUMBER_ID`
- `META_WHATSAPP_BUSINESS_ACCOUNT_ID`
- `META_WHATSAPP_WEBHOOK_VERIFY_TOKEN`

Do not commit real values to GitHub.

## Webhooks

The n8n webhook should receive Meta events and route only actual user messages into the assistant workflow. Statuses, read receipts, and delivery updates should be ignored or logged separately.

## Templates and Service Window

Customer-initiated WhatsApp conversations have a service window. Business-initiated messages outside the service window may require approved templates. Follow-up and reminder workflows must check whether a template is required before sending.

## Opt-Out

If a user sends `SALIR`, `BAJA`, `STOP`, or similar, mark the lead as opted out and stop proactive messaging.
