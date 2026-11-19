---
id: MCP-003
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Tool Orchestration MCP

## Summary
MCP server responsible for coordinating multiple tools and agents in unified workflows.

## Category
MCP Servers

## Priority
High

## Purpose
Orchestrate execution of multiple tools in structured pipelines.

## Key Features
- Tool chaining
- Workflow orchestration
- Multi-agent coordination
- Execution routing

## Inputs
- Tool requests
- Workflow definitions

## Outputs
- Orchestrated execution results

## Workflow Role
Coordination layer

## Dependencies
Planner Agent

## Failure Modes
- Execution conflicts
- Pipeline deadlocks

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
Core orchestration backbone for agent systems.
