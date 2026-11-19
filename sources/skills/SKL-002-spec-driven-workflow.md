---
id: SKL-002
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Spec Driven Workflow Skill

## Summary
Skill enabling execution based strictly on structured specifications rather than ad-hoc instructions.

## Category
Skills

## Priority
High

## Purpose
Enforce specification-first development methodology.

## Key Features
- Spec interpretation
- Constraint enforcement
- Structured execution flow
- Deterministic outputs

## Inputs
- Specifications
- Requirements
- Constraints

## Outputs
- Structured execution alignment
- Reduced ambiguity outputs

## Workflow Role
Methodology layer

## Related Agents
- Planner Agent
- Builder Agent

## Dependencies
None

## Failure Modes
- Over-rigid execution
- Misinterpretation of specs

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | High |
| Cursor | Not Verified | — | High |

## Notes
Core methodology extracted from Superpowers framework.
