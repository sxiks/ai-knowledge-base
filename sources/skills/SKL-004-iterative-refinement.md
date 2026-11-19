---
id: SKL-004
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Iterative Refinement Skill

## Summary
Skill for progressively improving outputs through multiple controlled iterations.

## Category
Skills

## Priority
High

## Purpose
Enhance output quality through iterative improvement cycles.

## Key Features
- Iterative enhancement
- Feedback incorporation
- Progressive optimization
- Error correction loops

## Inputs
- Initial outputs
- Feedback signals

## Outputs
- Improved versions
- Refined artifacts

## Workflow Role
Optimization layer

## Related Agents
- Review Agent
- Builder Agent

## Dependencies
None

## Failure Modes
- Infinite loops
- Overfitting to feedback

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
Core refinement mechanism.
