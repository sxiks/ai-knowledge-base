---
id: AGT-008
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Task Splitter Agent

## Summary
Agent responsible for decomposing complex tasks into atomic executable units.

## Category
Agents

## Priority
High

## Purpose
Break execution units into minimal independent tasks.

## Key Features
- Atomic decomposition
- Dependency mapping
- Parallelization readiness
- Granular task structuring

## Inputs
- Complex tasks
- Execution plans

## Outputs
- Atomic task list
- Dependency graph

## Workflow Role
Pre-execution decomposition layer

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
Core ECC decomposition agent.
