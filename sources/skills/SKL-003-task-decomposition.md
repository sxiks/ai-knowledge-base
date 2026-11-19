---
id: SKL-003
kind: conceptual-pattern
research_status: extracted
decision: candidate
environment: unknown
evidence: []  # source section not documented (ADR-004, D-02)
---

# Task Decomposition Skill

## Summary
Skill for breaking down complex problems into smaller executable units.

## Category
Skills

## Priority
High

## Purpose
Improve clarity and execution efficiency by decomposition.

## Key Features
- Hierarchical breakdown
- Dependency mapping
- Modular task creation
- Complexity reduction

## Inputs
- Complex tasks
- Objectives

## Outputs
- Structured subtasks
- Execution hierarchy

## Workflow Role
Planning enhancement layer

## Related Agents
- Planner Agent

## Dependencies
None

## Failure Modes
- Over-decomposition
- Loss of global context

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
Core planning augmentation skill.
