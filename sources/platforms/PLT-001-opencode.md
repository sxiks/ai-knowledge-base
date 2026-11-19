---
id: PLT-001
kind: component
research_status: extracted
decision: candidate
environment: installed
evidence:
  - "https://github.com/anomalyco/opencode"
  - "research/research-environment.md · AI Platforms"
---

# OpenCode

## Summary
Primary AI-native development environment used for agent-based coding workflows.

## Repository
https://github.com/anomalyco/opencode (https://github.com/sst/opencode resolves to the same repository)

## Official Documentation
https://opencode.ai/docs

## Category
Platform

## Priority
Critical

## Purpose
Primary execution environment for AI-assisted development workflows.

## Key Features
- Agent-based coding workflows
- MCP integration support
- Skill execution system
- Plugin extensibility
- CLI-driven interaction model

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Native | Platform resource (self) | Native |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | High |

## Advantages
- Core development environment
- High extensibility
- Strong integration with MCPs and agents

## Limitations
- Requires structured configuration
- Dependency on external skills/plugins ecosystem

## Knowledge Extraction Score
10/10

## Architectural Role
Primary execution layer

## Recommended Usage
Main environment for implementation phase after research approval

## Adoption Note (recorded before ADR-004, without supporting evidence)
Already adopted

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
All approved components must be validated against OpenCode compatibility first.
