---
id: MCP-008
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Tool Bridge MCP

## Summary
Abstraction layer for connecting multiple tools and execution environments.

## Category
MCP Servers

## Priority
High

## Purpose
Unify heterogeneous tool interfaces into a single execution layer.

## Key Features
- Tool abstraction
- Cross-platform execution
- Unified API layer
- Adapter system

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | High |
| Gemini CLI | Not Verified | — | High |
| Cursor | Not Verified | — | High |

## Notes
ECC integration backbone.
