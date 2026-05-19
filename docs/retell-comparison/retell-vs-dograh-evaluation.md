# Retell vs Dograh Evaluation

## Objective

Evaluate whether Dograh can replace or complement Retell AI for Scalvia voice assistants.

## Current Decision

Retell remains production. Dograh is evaluated as an internal lab. Do not migrate until Dograh passes at least 20 calls with average score `>= 4/5`.

## Retell Setup Used

| Item | Value |
|---|---|
| Agent | Sofía production/baseline |
| Language | Spanish, Mexico |
| LLM | OPEN QUESTION |
| Voice | OPEN QUESTION |
| Telephony | OPEN QUESTION |
| Integrations | OPEN QUESTION |
| Prompt version | OPEN QUESTION |

## Dograh Setup Used

| Item | Value |
|---|---|
| Agent | Sofía - Scalvia Internal Voice Test |
| Dograh source | `dograh-hq/dograh` |
| Audit commit | `0097974` |
| Local mode | Docker image mode first |
| UI | `http://localhost:3010` |
| API | `http://localhost:8000` |
| Telephony | Web Call/mock first |
| n8n | Future webhook node |
| Calendar | Mock first |

## Comparison Table

| Criterion | Retell | Dograh | Winner | Notes |
|---|---|---|---|---|
| Setup speed |  |  |  |  |
| Latency |  |  |  |  |
| Voice quality |  |  |  |  |
| Mexican Spanish |  |  |  |  |
| Interruptions |  |  |  |  |
| Debugging |  |  |  |  |
| Tool calling |  |  |  |  |
| Webhooks |  |  |  |  |
| Cost |  |  |  |  |
| Control |  |  |  |  |
| Stability |  |  |  |  |

## 20 Call Checklist

- [ ] Call 01 - AI agents prospect.
- [ ] Call 02 - AI agents prospect.
- [ ] Call 03 - Marketing prospect.
- [ ] Call 04 - Marketing prospect.
- [ ] Call 05 - Confused prospect.
- [ ] Call 06 - Confused prospect.
- [ ] Call 07 - Interruptions.
- [ ] Call 08 - Interruptions.
- [ ] Call 09 - Pricing early.
- [ ] Call 10 - Pricing early.
- [ ] Call 11 - Clinic lead.
- [ ] Call 12 - Barbería lead.
- [ ] Call 13 - Dental lead.
- [ ] Call 14 - Estética lead.
- [ ] Call 15 - Bad audio / noise.
- [ ] Call 16 - Silence handling.
- [ ] Call 17 - User changes topic.
- [ ] Call 18 - User gives long context.
- [ ] Call 19 - Handoff request.
- [ ] Call 20 - Final mixed scenario.

## Criteria To Migrate

- Average score `>= 4/5`.
- No critical latency issue.
- No critical Spanish quality issue.
- Interruption handling is acceptable.
- Webhook to n8n works reliably.
- Debugging is good enough for operations.
- Cost model is better or strategically justified.

## Criteria To Stay On Retell

- Dograh average score `< 4/5`.
- Spanish voice quality is not acceptable.
- Setup or maintenance cost is too high.
- Real calls are unstable.
- Tool/webhook flow is unreliable.
- Retell remains materially faster to ship.

## Criteria To Use Both

- Retell remains production for paid clients.
- Dograh is used for internal experiments, self-hosted pilots, or custom research.
- Dograh is used when source-level control matters more than time-to-market.
