---
id: ECO-003
kind: component
research_status: reviewed
decision: selective
environment: unknown
evidence:
  - "research/reports/RPT-001-ecosystems.md"
  - "docs/reviews/RPT-001-architecture-review.md"
  - "docs/decisions/ADR-002-selective-ecc-adoption.md"
---

# ECC

## Summary
Collection of AI components including agents, skills and MCP-like modules designed for selective integration.

## Repository
https://github.com/affaan-m/ECC

## Official Documentation
https://github.com/affaan-m/ECC

## Category
Ecosystem

## Priority
High

## Purpose
Provide curated reusable components for augmentation of the primary ecosystem.

## Key Features
- Large library of agents and skills
- Modular components
- Reusable MCP-like tools
- Multi-framework compatibility

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | High |

## Advantages
- Large component ecosystem
- Flexible integration options
- High reuse potential

## Limitations
- Risk of redundancy
- Requires strict filtering
- Not designed as full architecture

## Knowledge Extraction Score
8/10

## Architectural Role
Component library (not full framework)

## Recommended Usage
Selective extraction of high-value agents, skills and MCPs only

## Adoption Decision
Partial adoption. No full installation permitted.

## Related ADRs
ADR-002

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Only curated components may be integrated into ai-workspace.
