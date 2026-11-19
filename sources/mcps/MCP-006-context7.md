---
id: MCP-006
kind: component
research_status: extracted
decision: candidate
environment: installed
evidence:
  - "https://github.com/upstash/context7"
  - "research/research-environment.md · Installed MCP Servers"
---

# Context7 MCP

## Summary
MCP server providing contextual retrieval and structured context injection for AI coding workflows.

## Repository
https://github.com/upstash/context7

## Official Documentation
https://github.com/upstash/context7

## Category
MCP

## Priority
Critical

## Purpose
Provide structured context retrieval for AI agents within development workflows.

## Key Features
- Context retrieval system
- Structured knowledge injection
- Integration with AI coding agents
- Memory augmentation support

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | Native |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | High |

## Advantages
- Improves contextual accuracy
- Reduces hallucination risk
- Strong integration with agent systems

## Limitations
- Requires proper indexing
- Dependent on external context sources

## Knowledge Extraction Score
9/10

## Architectural Role
Core context provider MCP

## Recommended Usage
Use as primary context retrieval system for AI workflows

## Adoption Note (recorded before ADR-004, without supporting evidence)
Approved

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Core dependency for multi-agent reasoning systems.
