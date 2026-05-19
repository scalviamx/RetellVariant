# Client Cloning Process

Use this process to clone the Scalvia assistant system for a new client.

1. Copy `clients/_template/` into a new client folder.
2. Fill `business-config.json`.
3. Fill `services.md`.
4. Fill `faq.md`.
5. Fill booking rules.
6. Create or verify WhatsApp Cloud API number.
7. Clone n8n workflows.
8. Replace prompt extension.
9. Connect client calendar and CRM.
10. Run test conversations.
11. Validate handoff.
12. Go live.

## Client Folder Naming

Use a simple internal slug such as:

`clients/acme-dental-demo/`

Do not include real customer PII in committed files.

## Validation

Before launch, test:

- Greeting.
- Service question.
- Price question.
- Booking request.
- Cancellation or reschedule request.
- Human handoff.
- Opt-out.
- Sensitive or urgent request.
