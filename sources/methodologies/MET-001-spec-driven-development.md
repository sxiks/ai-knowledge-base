---
id: MET-001
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/obra/superpowers (section not documented)"
---

# Spec-Driven Development

## Summary

Engineering methodology where specifications become the primary source of implementation.

## Repository

Superpowers

## Official Documentation

https://github.com/obra/superpowers

## Category

Methodology

## Priority

Critical

## Purpose

Ensure every implementation begins with validated specifications instead of code.

## Core Principles

- Specification before implementation.
- Architecture before execution.
- Incremental delivery.
- Continuous validation.
- Documentation-driven engineering.

## Development Lifecycle

```text
Requirements
    ↓
Research
    ↓
Specification
    ↓
Architecture Review
    ↓
ADR
    ↓
Implementation
    ↓
Validation
    ↓
Documentation
```

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

- Improves consistency.
- Reduces architectural drift.
- Simplifies reviews.
- Produces reusable knowledge.

## Limitations

- Requires disciplined planning.
- Higher initial documentation effort.

## Knowledge Extraction Score

10/10

## Architectural Role

Primary engineering methodology.

## Recommended Usage

Apply to every implementation cycle.

## Adoption Note (recorded before ADR-004, without supporting evidence)

Adopted.

## Related ADRs

- ADR-001

## Related Resources

- ECO-002
- WKF-001
- Overlaps with WKF-001, SKL-002, UTL-003: same concept (spec-driven development); relation type (derived, forked, extended) not yet established (D-06).

## Last Review

2026-07-03

## Notes

Official engineering methodology for this repository.
