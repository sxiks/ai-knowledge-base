---
id: WKF-002
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Research to Adoption Workflow

## Summary

Workflow that transforms research into validated implementation.

## Repository

Internal

## Official Documentation

N/A

## Category

Workflow

## Priority

High

## Purpose

Standardize how external research becomes part of the knowledge base.

## Workflow

```text
Research Sources
        ↓
Prompt B
        ↓
Claude Investigation
        ↓
Research Report
        ↓
Architecture Review
        ↓
ADR Creation
        ↓
Knowledge Base Update
        ↓
Implementation Planning
        ↓
Environment Adoption
        ↓
Continuous Review
```

## Validation Gates

- Research completed
- Sources verified
- ADR approved
- Documentation updated
- Components indexed

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | Full |
| Claude Code | Not Verified | — | Full |
| Codex CLI | Not Verified | — | Full |
| Gemini CLI | Not Verified | — | Full |
| Cursor | Not Verified | — | Full |

## Advantages

- Repeatable process
- Complete traceability
- Architecture-first decisions
- Prevents undocumented implementations

## Limitations

- Requires disciplined documentation

## Architectural Role

Research governance workflow.

## Recommended Usage

Apply to every research phase.

## Adoption Note (recorded before ADR-004, without supporting evidence)

Adopted.

## Related ADRs

- ADR-001
- ADR-002
- ADR-003

## Related Resources

- RPT-001
- Research Protocol

## Last Review

2026-07-03

## Notes

Mandatory workflow for future research phases.
