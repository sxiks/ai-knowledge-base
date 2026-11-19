---
id: AGT-003
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Review Agent

## Summary
Agent responsible for validating outputs against specifications and quality standards.

## Category
Agents

## Priority
High

## Purpose
Ensure correctness, quality and alignment with requirements.

## Key Features
- Code review
- Quality validation
- Spec compliance checks
- Error detection

## Inputs
- Generated artifacts
- Specifications
- Rules engine constraints

## Outputs
- Review reports
- Issues list
- Improvement suggestions

## Workflow Role
Validation layer

## Related Skills
- Context compression
- Iterative refinement

## Dependencies
Builder Agent

## Failure Modes
- Overstrict validation
- False positives

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
Quality assurance layer.
