---
id: MCP-011
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# GStack Playwright Wrapper

## Summary
Automation layer built on top of Playwright for structured workflow execution.

## Category
MCP Servers

## Priority
Medium

## Purpose
Enable controlled browser automation within GStack workflows.

## Key Features
- Playwright abstraction layer
- Workflow automation hooks
- Structured browser tasks
- Execution scripting

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
- Structured automation
- Reusable execution layer

## Limitations
- Browser dependency
- Setup overhead

## Notes
GStack automation extension layer.
