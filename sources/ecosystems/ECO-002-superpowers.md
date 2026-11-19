---
id: ECO-002
kind: component
research_status: reviewed
decision: adopted
environment: unknown
evidence:
  - "research/reports/RPT-001-ecosystems.md"
  - "docs/reviews/RPT-001-architecture-review.md"
  - "docs/decisions/ADR-001-primary-ecosystem.md"
---

# Superpowers

## Summary
Modular AI development ecosystem designed for structured agent workflows, reproducibility and cross-platform compatibility.

## Repository
https://github.com/obra/superpowers

## Official Documentation
https://github.com/obra/superpowers

## Category
Ecosystem

## Priority
Critical

## Purpose
Primary methodological foundation for AI workflow architecture in this project.

## Key Features
- Modular agent system
- Structured workflows
- Cross-platform compatibility
- Reproducible execution patterns
- Tool-agnostic design

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | High |
| Gemini CLI | Not Verified | — | High |
| Cursor | Not Verified | — | High |

## Advantages
- Strong architectural consistency
- High portability
- Active development
- Clear separation of concerns

## Limitations
- Learning curve moderate
- Requires structured adoption

## Knowledge Extraction Score
10/10

## Architectural Role
Primary ecosystem foundation

## Recommended Usage
Base framework for all agent and workflow design

## Adoption Decision
Fully adopted as core ecosystem

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
All other ecosystems must align conceptually with this system.
