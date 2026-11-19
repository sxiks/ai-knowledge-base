# Phase 2 — Agents Extraction Prompt (archived)

## Origin

- Archived from: `scripts/README.md` (section "PASO 3"), commit `6b1f84a` (2026-07-03).
- Reason: the prompt was pasted into the scripts documentation by mistake. It is preserved here verbatim as historical research data (see `research/README.md` · `archives/`).
- Related deliverable: `research/reports/RPT-002-agents.md`. The prompt names its output "AER-002"; the roadmap name `RPT-002` is canonical and "AER" is kept only as the name of the extraction format.

## Prompt (verbatim)

```text
You are entering PHASE 2 of a structured AI Knowledge Base extraction process.

TASK:
Perform exhaustive research and extraction of ALL relevant agents, sub-agents, roles, workflows, and automation patterns from the following repositories:

- agency-agents
- multica
- ruflo
- trifecta perfecta
- all-deploy
- the-architect
- cyber-neo

CRITICAL RULES:

1. There is NO limit on quantity.
   
   - Do NOT stop at any number of agents or components.
   
   - Extract EVERYTHING of architectural or operational value.

2. Focus areas:
   
   - AI agents (planning, execution, review, deployment, orchestration)
   
   - Sub-agents and specialized roles
   
   - Workflow chains and pipelines
   
   - Tooling abstractions and orchestration layers
   
   - Memory systems and state handling
   
   - Multi-agent coordination patterns

3. Output format:
   
   - Structured list of agents and subagents
   
   - Clear naming conventions
   
   - Functional responsibility per component
   
   - Source repository reference per item

4. Do NOT summarize repositories.
   
   - You must DECONSTRUCT them into atomic components.

5. Prioritize:
   
   - Reusable agents
   
   - Composable workflows
   
   - Orchestration systems
   
   - High-value automation logic

6. If duplication exists across repositories:
   
   - Keep all variants
   
   - Mark relationships explicitly (derived, forked, extended)

OUTPUT:
A complete Agent Extraction Report (AER-002) ready for architecture review and ADR generation.
```
