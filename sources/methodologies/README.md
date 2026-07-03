# Methodologies

## Purpose

Document engineering methodologies adopted by the knowledge base.

## Resource Index

| ID | Name | Status | Priority |
|----|------|--------|----------|
| MET-001 | Spec-Driven Development | Active | Critical |
| MET-002 | Provider-Agnostic Engineering | Active | High |
| MET-003 | Bootstrap Philosophy | Active | High |

## Relationships

```text
Methodologies
        ↓
Workflows
        ↓
Architecture Decisions
        ↓
Knowledge Base
        ↓
Implementation
```

## Conventions

- One methodology per file.
- Methodologies define engineering principles.
- Workflows implement methodologies.
- Methodologies should remain platform-independent whenever possible.
- Architectural changes require ADR updates.

## Related Directories

- workflows/
- ecosystems/
- agents/
- skills/
- mcps/
