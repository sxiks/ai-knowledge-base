---
id: MCP-002
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Memory State MCP

## Summary
MCP server providing persistent memory and state management for agent workflows.

## Category
MCP Servers

## Priority
High

## Purpose
Maintain persistent context across multi-step agent executions.

## Key Features
- State persistence
- Context retention
- Session memory
- Cross-task continuity

## Inputs
- State updates
- Context data

## Outputs
- Persistent memory state

## Workflow Role
Context persistence layer

## Dependencies
None

## Failure Modes
- State corruption
- Memory inconsistency

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | High |

## Related Resources
- Overlaps with MCP-010, PLG-002: same concept (memory and state persistence); relation type (derived, forked, extended) not yet established (D-06).

## Notes
Essential for multi-step reasoning workflows.
