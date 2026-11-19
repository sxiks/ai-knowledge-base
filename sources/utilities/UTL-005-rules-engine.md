---
id: UTL-005
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# ECC Rules Engine

## Summary
Policy and constraint enforcement system for execution safety and correctness.

## Category
Utilities

## Priority
Critical

## Purpose
Enforce system-wide rules across all agents and workflows.

## Key Features
- Rule enforcement
- Policy validation
- Execution constraints
- Security layer

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
Core ECC governance system.
