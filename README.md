# Scalvia WhatsApp AI Agents

Documentation, prompt, schema, and n8n workflow blueprint for Scalvia's official WhatsApp AI assistant product.

This repo is the source of truth for building and cloning WhatsApp AI assistants for clinics, barber shops, consultorios, dental clinics, beauty clinics, and local service businesses in Mexico.

## What This Repo Is

- A repo-ready product blueprint for Scalvia WhatsApp AI agents.
- A place to version prompts, JSON schemas, example payloads, n8n workflow exports, and client templates.
- The starting point for Scalvia's own dedicated WhatsApp AI receptionist, Sofía.
- A repeatable structure for future client implementations.

## What This Repo Is Not

- Not the runtime backend.
- Not a WhatsApp Web automation project.
- Not an OpenWA or `whatsapp-web.js` project.
- Not a place for real tokens, phone numbers, webhook secrets, customer PII, or production credentials.

## High-Level Architecture

User WhatsApp message
-> WhatsApp Cloud API
-> n8n webhook on Hostinger VPS
-> inbound payload normalizer
-> intent router
-> AI receptionist
-> Google Sheets CRM
-> Google Calendar if booking is needed
-> WhatsApp Cloud API reply
-> internal Telegram/email notification if needed
-> logs and daily debrief

## Why Official WhatsApp Cloud API

Scalvia uses the official WhatsApp Cloud API / WhatsApp Business Platform because it is the stable, production-appropriate path for business messaging. It supports webhooks, message templates, business verification, auditability, and clear operational boundaries.

OpenWA, `whatsapp-web.js`, QR session automation, and WhatsApp Web scraping are intentionally not used. They are fragile, can violate platform expectations, depend on browser sessions, and create unnecessary operational and compliance risk for a paid client product.

## Recommended MVP Stack

- WhatsApp Cloud API / Meta Business Platform
- n8n on Scalvia's Hostinger VPS
- Google Sheets as initial CRM
- Google Calendar for bookings
- Configurable LLM provider through environment variables
- Telegram or email for internal notifications
- Future-ready path to PostgreSQL

## Future Production Stack

- WhatsApp Cloud API
- n8n plus optional backend
- PostgreSQL
- Redis or queue system if needed
- Admin dashboard
- Audit logs
- Monitoring
- Backup process

## Local Usage

Use this repo locally to edit:

- `docs/` for implementation and operating documentation.
- `prompts/` for assistant behavior and niche-specific prompt extensions.
- `schemas/` for structured data contracts.
- `examples/` for fake test payloads.
- `n8n/workflows/` for exported workflow JSON files.
- `clients/_template/` for cloning a new client setup.

No local backend is required for this first version.

## n8n on the VPS

The real execution environment is the existing Scalvia Hostinger VPS running n8n. Workflows are built and tested in n8n, then exported into this repo under `n8n/workflows/` so GitHub remains the versioned source of truth.

Credentials must be configured only inside n8n credential manager or VPS environment variables. Never commit credentials to this repo.

## Client Cloning

To clone the product for a client:

1. Copy `clients/_template/` into a new client folder.
2. Fill client config, services, FAQs, booking rules, and handoff rules.
3. Create or verify the client's WhatsApp Cloud API setup.
4. Clone the n8n workflows.
5. Connect the client's calendar and CRM.
6. Test inbound, AI response, lead capture, booking, handoff, and opt-out.
7. Export final workflow JSON back into this repo.

## Safety Notes

- Use official WhatsApp Cloud API only.
- Do not use unofficial WhatsApp libraries or QR-login automation.
- Do not commit secrets or real customer PII.
- Respect opt-outs.
- Use approved WhatsApp templates for business-initiated messages when required.
- Escalate sensitive, medical, legal, financial, or urgent cases to a human.

## Next Steps

1. Complete Meta WhatsApp Cloud API setup for Scalvia's dedicated business number.
2. Configure n8n credentials on the Hostinger VPS.
3. Build the inbound router workflow.
4. Test with fake payloads from `examples/`.
5. Test with a real WhatsApp inbound message.
6. Add Google Sheets CRM logging.
7. Add Google Calendar booking.
8. Export tested workflows into `n8n/workflows/`.
