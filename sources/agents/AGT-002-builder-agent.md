---
id: AGT-002
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Builder Agent

## Summary
Agent responsible for implementing planned tasks into executable outputs.

## Category
Agents

## Priority
High

## Purpose
Translate structured plans into working implementations.

## Key Features
- Code generation
- Task execution
- Implementation following specs
- Iterative development

## Inputs
- Execution plan
- Specifications
- Constraints

## Outputs
- Implemented artifacts
- Code modules
- Functional components

## Workflow Role
Execution layer

## Related Skills
- Iterative refinement
- Spec-driven execution

## Dependencies
Planner Agent

## Failure Modes
- Deviation from spec
- Incomplete implementation

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | High |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | High |

## Notes
Core execution agent.
