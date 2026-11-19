---
id: AGT-007
kind: component
research_status: extracted
decision: candidate
environment: installed
evidence:
  - "research/research-environment.md · Installed Agents"
---

# QA Architect Agent

## Summary
Agent responsible for validation, quality assurance and architectural consistency checks.

## Repository
Internal configuration (OpenCode ecosystem)

## Official Documentation
N/A

## Category
Agents

## Priority
High

## Purpose
Ensure outputs meet quality, consistency and architectural standards.

## Key Features
- Quality validation
- Architecture compliance checks
- Output verification
- Consistency enforcement

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
- Improves reliability
- Reduces architectural drift
- Enforces consistency

## Limitations
- Adds additional validation overhead
- Requires clear evaluation criteria

## Knowledge Extraction Score
9/10

## Architectural Role
Validation layer agent

## Recommended Usage
Use after implementation and before final commits

## Adoption Note (recorded before ADR-004, without supporting evidence)
Approved

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Final quality gate in workflow.
