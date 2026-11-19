---
id: MCP-001
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Browser Automation MCP

## Summary
MCP server enabling automated browser control and interaction workflows.

## Category
MCP Servers

## Priority
High

## Purpose
Enable AI-driven browser automation for testing and interaction.

## Key Features
- Browser control
- UI automation
- Navigation scripting
- Interaction simulation

## Inputs
- Automation commands
- Navigation instructions

## Outputs
- Browser actions
- UI state results

## Workflow Role
Execution and validation layer

## Dependencies
None

## Failure Modes
- UI instability
- Selector breakage

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
Core automation component from Superpowers ecosystem.
