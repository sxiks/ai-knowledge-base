---
id: ECO-001
kind: component
research_status: reviewed
decision: reference
environment: unknown
evidence:
  - "research/reports/RPT-001-ecosystems.md"
  - "docs/reviews/RPT-001-architecture-review.md"
  - "docs/decisions/ADR-003-gstack-reference-only.md"
---

# GStack

## Summary
AI coding workflow ecosystem focused on opinionated CLI-driven development patterns.

## Repository
https://github.com/garrytan/gstack

## Official Documentation
https://github.com/garrytan/gstack

## Category
Ecosystem

## Priority
Low

## Purpose
Serve as reference material for workflow patterns and structural ideas.

## Key Features
- CLI-based workflow structure
- Opinionated agent execution patterns
- Integrated task flow design

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | Partial |
| Claude Code | Not Verified | — | Partial |
| Codex CLI | Not Verified | — | Unknown |
| Gemini CLI | Not Verified | — | Unknown |
| Cursor | Not Verified | — | Partial |

## Advantages
- Well structured workflow examples
- Clear task decomposition patterns

## Limitations
- Highly opinionated architecture
- Limited portability across ecosystems
- Overlaps with other agent frameworks

## Knowledge Extraction Score
6/10

## Architectural Role
Reference knowledge source only

## Recommended Usage
Study for ideas only. Do not adopt as base system.

## Adoption Decision
Rejected as primary ecosystem. Reference-only usage approved.

## Related ADRs
ADR-003

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Use only for conceptual comparison with Superpowers and ECC.
