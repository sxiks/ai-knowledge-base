---
id: PLG-001
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/anthropics/claude-plugins-official"
---

# Claude Official Plugins

## Summary
Official plugin ecosystem providing extensibility for Claude-based workflows.

## Repository
https://github.com/anthropics/claude-plugins-official

## Official Documentation
https://github.com/anthropics/claude-plugins-official

## Category
Plugins

## Priority
High

## Purpose
Extend Claude Code capabilities through official plugin system.

## Key Features
- Official plugin architecture
- Extensibility framework
- Tool integration support
- Standardized plugin interface

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | Medium |
| Claude Code | Not Verified | — | Native |
| Codex CLI | Not Verified | — | Low |
| Gemini CLI | Not Verified | — | Low |
| Cursor | Not Verified | — | Medium |

## Advantages
- Official support
- Stable integration model
- Structured extensibility

## Limitations
- Limited to Claude ecosystem
- Dependency on Anthropic tooling

## Knowledge Extraction Score
9/10

## Architectural Role
Plugin system foundation

## Recommended Usage
Use only officially supported plugins for Claude workflows

## Adoption Note (recorded before ADR-004, without supporting evidence)
Approved for Claude ecosystem integration

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Primary plugin system for Claude-based tools.
