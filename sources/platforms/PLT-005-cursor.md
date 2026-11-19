---
id: PLT-005
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://cursor.com/docs/agent/subagents"
---

# Cursor

## Summary
AI code editor with an agent mode and custom subagents; target platform of the knowledge base.

## Repository
Not documented (no public source repository identified)

## Official Documentation
https://cursor.com/docs

## Category
Platform

## Priority
High

## Purpose
AI code editor for software development. Target platform of the knowledge base.

## Key Features
- Agent mode
- Custom subagents defined as Markdown files with YAML front matter
- Reads subagent definitions from other tools' project folders as well as its own (see Notes)

## Platform Compatibility

Values follow ADR-005.

| Platform | Compatibility | Evidence | Preserved / lost functionality |
|----------|---------------|----------|--------------------------------|
| OpenCode | Not Verified | — | — |
| Claude Code | Not Verified | — | — |
| Codex CLI | Not Verified | — | — |
| Gemini CLI | Not Verified | — | — |
| Cursor | Native | Platform resource (self) | — |

## Evaluation
Not evaluated yet.

## Architectural Role
Target platform with the same compatibility priority as the other four; it may become the primary platform (AD-5).

## Recommended Usage
Determined per component by the Platform Compatibility matrices (ADR-005).

## Related ADRs
ADR-005

## Related Resources
- PLT-001, PLT-002, PLT-003, PLT-004 (other target platforms)

## Last Review
2026-11-18

## Notes
Documented (not tested), from https://cursor.com/docs/agent/subagents (consulted 2026-11-13): custom subagents live in `.cursor/agents/`; Cursor also reads subagent definitions from `.claude/agents/` and `.codex/agents/`. The full component organization (instruction files, skills, plugins, MCP servers) is documented in a later stage, as required by ADR-005.
