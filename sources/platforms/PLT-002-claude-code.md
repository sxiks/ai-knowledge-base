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
Secondary AI development environment for research, prototyping and agent execution.

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
Research and reasoning layer

## Recommended Usage
Use for analysis, validation and generation of structured research outputs

## Adoption Note (recorded before ADR-004, without supporting evidence)
Secondary platform adopted

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Used primarily for research and validation phases, not execution layer.
