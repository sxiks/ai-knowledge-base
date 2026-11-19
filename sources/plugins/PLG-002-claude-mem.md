---
id: PLG-002
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/thedotmack/claude-mem"
---

# Claude Mem

## Summary
Memory persistence plugin for maintaining contextual state across sessions.

## Repository
https://github.com/thedotmack/claude-mem

## Official Documentation
https://github.com/thedotmack/claude-mem

## Category
Plugins

## Priority
High

## Purpose
Enable persistent memory and context retention in AI workflows.

## Key Features
- Session memory persistence
- Context retention
- Retrieval of past interactions
- Lightweight memory layer

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | Medium |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Low |
| Gemini CLI | Not Verified | — | Low |
| Cursor | Not Verified | — | Medium |

## Advantages
- Improves long-term context handling
- Lightweight integration
- Useful for iterative workflows

## Limitations
- Requires careful memory management
- Risk of context pollution

## Knowledge Extraction Score
8/10

## Architectural Role
Memory augmentation layer

## Recommended Usage
Use for persistent agent memory across sessions

## Adoption Note (recorded before ADR-004, without supporting evidence)
Approved for selective use

## Related ADRs
ADR-002

## Related Resources
RPT-001
- Overlaps with MCP-002, MCP-010: same concept (memory and state persistence); relation type (derived, forked, extended) not yet established (D-06).

## Last Review
2026-07-02

## Notes
Must be controlled to avoid context overload.
