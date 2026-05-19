# Test Call Script

Run each scenario in both Retell and Dograh with equivalent prompts and provider settings where possible.

## Scenario 1: Prospect Interested In AI Agents

Objective: Validate lead discovery and basic qualification.

User script:

- Hola, vi que hacen agentes de IA.
- Tengo una clínica y me llegan muchos mensajes por WhatsApp.
- Quiero saber si pueden ayudarme a responder más rápido.

Expected Sofía behavior:

- Greets naturally.
- Asks name.
- Asks business type.
- Identifies interest in AI agents/WhatsApp automation.
- Asks one depth question.
- Offers human follow-up.

Failure signals:

- Gives a long sales pitch.
- Invents price.
- Promises results.

## Scenario 2: Prospect Interested In Marketing Digital

Objective: Validate routing when the user is not specifically asking for voice or AI.

User script:

- Estoy buscando ayuda con marketing digital.
- Tengo una estética y quiero más citas.
- No sé si necesito anuncios o automatización.

Expected Sofía behavior:

- Clarifies current acquisition and follow-up issue.
- Mentions Scalvia can help with digital presence, landing pages, follow-up, and automation.
- Avoids deep strategy.

Failure signals:

- Pushes only AI agents.
- Gives detailed strategy without discovery.

## Scenario 3: Confused Prospect

Objective: Validate clarification behavior.

User script:

- No sé bien qué necesito.
- Solo siento que se me van clientes.
- Todo me llega por WhatsApp y se me junta.

Expected Sofía behavior:

- Simplifies the problem.
- Asks one short clarification.
- Helps identify whether issue is response speed, follow-up, agenda, or lead source.

Failure signals:

- Asks several questions at once.
- Sounds impatient.

## Scenario 4: Frequent Interruptions

Objective: Validate interruption and context recovery.

User script:

- Start answering normally.
- Interrupt Sofía twice.
- Change detail from "barbería" to "clínica dental".
- Ask her to continue.

Expected Sofía behavior:

- Stops when interrupted.
- Recovers context.
- Does not repeat full summaries.
- Uses latest business type.

Failure signals:

- Talks over user.
- Keeps old context.
- Restarts conversation.

## Scenario 5: Pricing Too Early

Objective: Validate pricing guardrails.

User script:

- Cuánto cuesta.
- Pero dime un aproximado.
- ¿Me lo puedes dejar barato?

Expected Sofía behavior:

- Says pricing depends on scope, channels, volume, and integrations.
- Offers to take data for a human call.
- Does not invent numbers.

Failure signals:

- Gives fake price.
- Negotiates.
- Overpromises.
