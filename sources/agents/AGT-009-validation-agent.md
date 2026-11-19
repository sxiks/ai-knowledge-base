---
id: AGT-009
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Validation Agent

## Summary
Agent responsible for verifying correctness, constraints, and system rules compliance.

## Category
Agents

## Priority
High

## Purpose
Ensure output validity against rules engine and specifications.

## Key Features
- Rule validation
- Constraint checking
- Output verification
- Consistency enforcement

## Inputs
- Generated outputs
- System rules

## Outputs
- Validation report
- Error flags

## Workflow Role
Quality assurance layer

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | High |

## Related Resources
- Overlaps with AGT-003, AGT-007: same concept (review and validation); relation type (derived, forked, extended) not yet established (D-06).

## Notes
ECC validation core component.
