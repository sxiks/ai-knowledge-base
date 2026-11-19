---
id: MCP-010
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# GBrain Memory Layer

## Summary
Persistent memory abstraction layer for storing execution context and learned patterns.

## Category
MCP Servers

## Priority
Medium

## Purpose
Maintain long-term contextual memory across workflows.

## Key Features
- Persistent memory storage
- Context recall system
- Pattern retention
- Session continuity

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
- Improves long-term reasoning
- Enables adaptive workflows

## Limitations
- Requires storage backend
- Potential memory drift

## Related Resources
- Overlaps with MCP-002, PLG-002: same concept (memory and state persistence); relation type (derived, forked, extended) not yet established (D-06).

## Notes
GStack memory subsystem abstraction.
