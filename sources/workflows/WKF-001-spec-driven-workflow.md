---
id: WKF-001
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/obra/superpowers (section not documented)"
---

# Spec-Driven Workflow

## Summary

Specification-first development workflow adopted as the primary engineering methodology.

## Repository

Superpowers

## Official Documentation

https://github.com/obra/superpowers

## Category

Workflow

## Priority

Critical

## Purpose

Establish a specification-driven process before implementation begins.

## Workflow

```text
Requirements
    ↓
Research
    ↓
Specification
    ↓
Architecture Review
    ↓
ADR Generation
    ↓
Implementation Plan
    ↓
Development
    ↓
Review
    ↓
Testing
    ↓
Documentation
    ↓
Deployment
```

## Key Principles

- Specification before implementation
- Small iterative changes
- Architecture-first decisions
- Continuous validation
- Documentation as part of development

## Inputs

- Research Reports
- ADRs
- Requirements
- Existing Knowledge Base

## Outputs

- Approved implementation plan
- Updated documentation
- Reusable knowledge

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

- Reduces implementation mistakes
- Improves consistency
- Promotes reusable knowledge
- Facilitates architecture reviews

## Limitations

- Requires upfront planning
- Less suitable for rapid prototyping

## Architectural Role

Primary workflow.

## Recommended Usage

Use for every new research and implementation cycle.

## Adoption Note (recorded before ADR-004, without supporting evidence)

Adopted.

## Related ADRs

- ADR-001

## Related Resources

- ECO-002
- MET-001

## Last Review

2026-07-03

## Notes

Official workflow for this repository.
