---
id: AGT-001
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Planner Agent

## Summary
Agent responsible for structured planning of tasks, decomposition of objectives and definition of execution steps.

## Category
Agents

## Priority
High

## Purpose
Break down complex tasks into structured, executable plans.

## Key Features
- Task decomposition
- Step sequencing
- Dependency identification
- Execution planning

## Inputs
- User objectives
- Context data
- Constraints

## Outputs
- Structured execution plan
- Task hierarchy
- Priority ordering

## Workflow Role
Initial orchestration layer

## Related Skills
- Task decomposition
- Spec-driven workflow

## Dependencies
None

## Failure Modes
- Overcomplex planning
- Missing constraints

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | High |

## Notes
Core orchestration agent extracted from Superpowers workflow model.
