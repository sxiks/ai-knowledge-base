---
id: AGT-005
kind: component
research_status: extracted
decision: candidate
environment: installed
evidence:
  - "research/research-environment.md · Installed Agents"
---

# Dev Code Agent

## Summary
Agent focused on software development assistance, refactoring and iterative code improvement.

## Repository
Internal configuration (OpenCode ecosystem)

## Official Documentation
N/A

## Category
Agents

## Priority
High

## Purpose
Support iterative development and code improvement workflows.

## Key Features
- Code refactoring
- Debugging assistance
- Iterative improvement
- Pattern recognition

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
- Improves code quality
- Supports iterative workflows
- Flexible usage

## Limitations
- Requires structured prompts
- Dependent on user context quality

## Knowledge Extraction Score
8/10

## Architectural Role
Development assistant agent

## Recommended Usage
Use for refactoring and iterative development

## Adoption Note (recorded before ADR-004, without supporting evidence)
Approved

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Supports build agent workflows.
