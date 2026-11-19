---
id: AGT-006
kind: component
research_status: extracted
decision: candidate
environment: installed
evidence:
  - "research/research-environment.md · Installed Agents"
---

# Doc Master Agent

## Summary
Agent responsible for generating, maintaining and structuring technical documentation.

## Repository
Internal configuration (OpenCode ecosystem)

## Official Documentation
N/A

## Category
Agents

## Priority
High

## Purpose
Maintain consistent and structured documentation across the knowledge base.

## Key Features
- Documentation generation
- Markdown structuring
- Knowledge organization
- Standardization enforcement

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
- Ensures documentation consistency
- Reduces structural drift
- Improves readability

## Limitations
- Requires strict formatting rules
- Can over-standardize if misused

## Knowledge Extraction Score
9/10

## Architectural Role
Documentation layer agent

## Recommended Usage
Use for all documentation creation and updates

## Adoption Note (recorded before ADR-004, without supporting evidence)
Approved

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Core documentation enforcement agent.
