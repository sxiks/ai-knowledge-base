---
id: MCP-009
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Command Abstraction MCP

## Summary
System that standardizes execution commands across different AI environments.

## Category
MCP Servers

## Priority
High

## Purpose
Normalize CLI and tool execution formats.

## Key Features
- Command normalization
- Cross-platform syntax mapping
- Execution standardization
- Compatibility layer

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
Critical ECC execution standardization layer.
