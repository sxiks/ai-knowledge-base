---
id: MET-002
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/obra/superpowers (section not documented)"
---

# Provider-Agnostic Engineering

## Summary

Methodology focused on minimizing dependency on a single AI provider.

## Repository

Superpowers

## Official Documentation

https://github.com/obra/superpowers

## Category

Methodology

## Priority

High

## Purpose

Design reusable workflows compatible with multiple AI coding platforms.

## Core Principles

- Vendor independence.
- Portable workflows.
- Standardized documentation.
- Reusable prompts.
- Modular architecture.

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | Yes |
| Claude Code | Not Verified | — | Yes |
| Codex CLI | Not Verified | — | Yes |
| Gemini CLI | Not Verified | — | Yes |
| Cursor | Not Verified | — | Yes |

## Advantages

- Long-term maintainability.
- Lower migration cost.
- Greater ecosystem flexibility.
- Reusable engineering assets.

## Limitations

- Avoids provider-specific optimizations.
- Requires abstraction layers.

## Knowledge Extraction Score

10/10

## Architectural Role

Cross-platform engineering foundation.

## Recommended Usage

Apply to all new resources and workflows.

## Adoption Note (recorded before ADR-004, without supporting evidence)

Adopted.

## Related ADRs

- ADR-001

## Related Resources

- ECO-002
- WKF-001
- WKF-002

## Last Review

2026-07-03

## Notes

All repository documentation should follow this methodology.
