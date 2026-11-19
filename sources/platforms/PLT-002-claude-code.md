---
id: PLT-002
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/anthropics/claude-code"
---

# Claude Code

## Summary
AI coding environment used for agent-assisted development and research execution.

## Repository
https://github.com/anthropics/claude-code

## Official Documentation
https://docs.anthropic.com/

## Category
Platform

## Priority
High

## Purpose
AI coding agent for software development from the terminal. Target platform of the knowledge base.

## Key Features
- Agent execution environment
- Tool calling capabilities
- MCP compatibility (via integrations)
- Code generation and refactoring support

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Native | Platform resource (self) | Native |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Low |
| Cursor | Not Verified | — | High |

## Advantages
- Strong reasoning model integration
- High-quality code generation
- Good for research phase execution

## Limitations
- External platform dependency
- Limited local customization

## Knowledge Extraction Score
9/10

## Architectural Role
Target platform with the same compatibility priority as the other four; it may become the primary platform (AD-5).

## Recommended Usage
Determined per component by the Platform Compatibility matrices (ADR-005).

## Adoption Note (recorded before ADR-004, without supporting evidence)
Secondary platform adopted

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-11-18

## Notes
Previous note (before AD-5): used for research and validation phases, not as execution layer. Superseded by research/research-environment.md v1.1.
