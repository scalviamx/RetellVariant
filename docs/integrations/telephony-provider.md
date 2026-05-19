# Telephony Provider

Dograh references support for telephony providers including Twilio, Vonage, Telnyx, Vobiz, Cloudonix, and Plivo-related code paths.

## PoC Mode

Start with Dograh Web Call. Do not connect real telephony until:

- Sofía prompt works.
- Model providers are configured.
- n8n webhook is tested.
- Call notes and scoring process are ready.

## Real Call Mode

Required:

- Telephony provider account.
- Phone number.
- Provider credentials.
- Public HTTPS callback URL.
- Dograh telephony configuration.
- Test inbound and outbound call.

## Twilio Placeholder

Variables:

- `TWILIO_ACCOUNT_SID`
- `TWILIO_AUTH_TOKEN`
- `TWILIO_PHONE_NUMBER`

Do not commit real values.

## Cloudflare

For local callback testing, use a controlled tunnel only if needed. For VPS or production, use a stable HTTPS domain.

## OPEN QUESTION

Which provider is best for Mexico numbers and Scalvia's cost/quality target: Twilio, Telnyx, Vonage, or another compatible provider?
