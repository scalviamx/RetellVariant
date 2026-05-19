# Workflow Design Principles

- Keep workflows modular.
- Do not put long prompts directly in many nodes unless needed.
- Use reusable prompt files as source of truth.
- Log structured data.
- Avoid duplicate leads.
- Keep client-specific config separate.
- Never hardcode secrets.
- Use clear workflow names.

## Practical Standards

- Validate AI output before sending messages or creating appointments.
- Use workflow execution IDs in logs.
- Keep human handoff simple and reliable.
- Prefer explicit branching over hidden prompt-only behavior.
- Store only what is needed for the business process.
