---
id: AGT-004
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Ship Agent

## Summary
Agent responsible for final packaging, deployment preparation and delivery of outputs.

## Category
Agents

## Priority
High

## Purpose
Finalize and prepare deliverables for production or integration.

## Key Features
- Packaging
- Deployment preparation
- Release structuring
- Final validation

## Inputs
- Validated outputs
- Review reports
- Release constraints

## Outputs
- Final deliverables
- Deployment-ready artifacts
- Release bundles

## Workflow Role
Delivery layer

## Related Skills
- Spec-driven workflow
- Execution orchestration

## Dependencies
Review Agent

## Failure Modes
- Incomplete packaging
- Missing dependencies

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
Final stage of Superpowers execution chain.
