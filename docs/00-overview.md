# Product Overview

Scalvia WhatsApp AI Agents is a product blueprint for building official WhatsApp AI assistants for local service businesses in Mexico. The first implementation is Sofía, Scalvia's own AI receptionist running on a dedicated Scalvia Telcel number.

The repo keeps documentation, prompts, schemas, workflow exports, and client templates in one versioned place. It is designed so Scalvia can build its own assistant first, then clone the operating model for clinics, barber shops, consultorios, dental clinics, beauty clinics, and other service businesses.

## MVP

The MVP focuses on a stable, low-risk path:

- Official WhatsApp Cloud API.
- n8n on Scalvia's Hostinger VPS.
- Google Sheets for initial CRM.
- Google Calendar for booking.
- Configurable LLM provider.
- Telegram or email for internal notifications.

The first assistant should be able to receive a WhatsApp message, normalize it, identify intent, respond briefly, collect lead information, schedule a demo when appropriate, save the lead, and notify the Scalvia team when human follow-up is needed.

## Long-Term Vision

The long-term product can evolve into a repeatable AI receptionist system with:

- Client-specific WhatsApp numbers.
- Reusable workflow templates.
- PostgreSQL data storage.
- Audit logs.
- Admin dashboard.
- Monitoring and backup process.
- Industry-specific prompt libraries.
- Reporting for leads, bookings, and handoffs.

## Operating Principle

GitHub is the source of truth. Localhost is for documentation, prompt, schema, and workflow template development. The Hostinger VPS n8n instance is the real execution environment.
