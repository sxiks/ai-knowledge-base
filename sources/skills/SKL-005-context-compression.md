---
id: SKL-005
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Context Compression Skill

## Summary
Skill for reducing large context into high-density, relevant representations.

## Category
Skills

## Priority
High

## Purpose
Optimize token usage and improve reasoning efficiency.

## Key Features
- Information summarization
- Signal extraction
- Noise reduction
- Context prioritization

## Inputs
- Large context blocks
- Documentation
- Logs

## Outputs
- Compressed context representations
- Key information summaries

## Workflow Role
Optimization layer

## Related Agents
- Review Agent

## Dependencies
None

## Failure Modes
- Loss of critical information
- Over-compression

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
Critical for long-context agent systems.
