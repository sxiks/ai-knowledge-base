---
id: ECO-004
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# GStack Workflow Chain

## Summary
Opinionated execution pipeline defining structured workflow stages for AI-assisted development.

## Category
Ecosystems

## Priority
Medium

## Purpose
Define structured end-to-end execution flow for tasks.

## Key Features
- Sequential workflow stages
- Opinionated execution flow
- Task lifecycle management
- Structured delivery pipeline

## Workflow Stages
- CEO: High-level intent definition
- Design: System and solution design
- Build: Implementation phase
- Ship: Delivery phase
- Reflect: Post-execution analysis

## Inputs
- User intent
- Project requirements

## Outputs
- Structured execution lifecycle

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | Medium |
| Claude Code | Not Verified | — | Medium |
| Codex CLI | Not Verified | — | Low |
| Gemini CLI | Not Verified | — | Low |
| Cursor | Not Verified | — | Medium |

## Advantages
- Clear execution lifecycle
- Strong structure for beginners
- Enforces discipline

## Limitations
- Highly opinionated
- Redundant with Superpowers workflow model

## Knowledge Extraction Score
7/10

## Architectural Role
Execution lifecycle framework

## Notes
Reference-only workflow model.
