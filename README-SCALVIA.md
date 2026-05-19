# Scalvia Dograh Voice Lab

This repo now includes an internal lab layer to evaluate whether Dograh can replace or complement Retell AI for Scalvia voice assistants.

## What We Are Testing

We are testing Dograh as a controlled proof of concept for Scalvia voice agents, especially a Spanish Mexican voice assistant similar to Sofía.

Primary questions:

- Can Dograh run reliably on a local MacBook Apple Silicon setup?
- Can we create a realistic Spanish Mexican voice agent?
- Can Dograh match Retell on latency, interruption handling, voice naturalness, and debugging?
- Can Dograh send call results to n8n for lead capture and follow-up?
- Is Dograh worth exploring for self-hosted or hybrid voice agent infrastructure?

## What Dograh Is

Dograh is an open-source, self-hostable voice agent platform positioned as an alternative to Vapi and Retell. Its repo includes a Python API, Next.js UI, Docker Compose setup, workflow builder, web calls, telephony provider support, model configuration, and webhook nodes.

Inspected source:

- Repository: `https://github.com/dograh-hq/dograh`
- Audit commit: `0097974`

## Why Compare Against Retell

Retell is currently the production-grade reference for Sofía. Dograh may be useful if Scalvia needs:

- More source-level control.
- Self-hosted infrastructure.
- Lower vendor lock-in.
- Custom workflows and debugging.
- Deeper integration with internal tooling.

Retell remains the production baseline until Dograh passes controlled tests.

## What This Is Not Yet

- Not production.
- Not a Retell replacement decision.
- Not connected to real calls by default.
- Not connected to real Google Calendar by default.
- Not connected to client data.
- Not a place for API keys or secrets.

## How To Run Dograh Locally

This repo does not vendor Dograh source code. Clone Dograh next to this repo or set `DOGRAH_DIR`.

```bash
cd /Users/robertomagallanes/Downloads/Scalvia/05_Repos
git clone https://github.com/dograh-hq/dograh.git
cd scalvia-whatsapp-agents
./scripts/start-local.sh
```

Default local UI:

- Dograh UI: `http://localhost:3010`
- Dograh API: `http://localhost:8000/api/v1/health`
- MinIO console: `http://localhost:9001`

## How To Test Sofía

1. Start Dograh locally.
2. Open `http://localhost:3010`.
3. Create a new voice agent named `Sofía - Scalvia Internal Voice Test`.
4. Use the prompt from `docs/agents/sofia-scalvia.md`.
5. Configure mock/default providers first.
6. Use Web Call before connecting real telephony.
7. Record notes with `docs/logs/call-test-notes-template.md`.
8. Score against `docs/retell-comparison/scoring-rubric.md`.

## How To Register Results

For each test call:

- Use one scenario from `docs/retell-comparison/test-call-script.md`.
- Record latency, interruptions, Spanish quality, context retention, and close quality.
- Compare against equivalent Retell behavior.
- Do not migrate until Dograh completes at least 20 test calls with average score `>= 4/5`.

## Next Steps

1. Run Dograh locally with Docker.
2. Create Sofía in the Dograh dashboard.
3. Run 5 mock Web Call scenarios.
4. Add n8n webhook node in Dograh workflow.
5. Compare against Retell using the rubric.
6. Decide whether to continue Dograh as lab, hybrid option, or future replacement candidate.
