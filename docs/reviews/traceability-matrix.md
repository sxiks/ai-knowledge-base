# Traceability Matrix

Status: Active

---

# Architecture Traceability

| ADR | Ecosystem | Components | Status |
|------|-----------|------------|--------|
| ADR-001 | ECO-002 | Agents, Skills, MCPs, Workflows | Active |
| ADR-002 | ECO-003 | Curated Components | Active |
| ADR-003 | ECO-001 | Reference Knowledge | Active |

---

# Resource Traceability

```text
Research Source

↓

Research Report

↓

Architecture Review

↓

ADR

↓

Knowledge Base Resource

↓

Implementation

↓

Environment
```

---

# Repository Traceability

```text
research/

↓

reports/

↓

docs/reviews/

↓

docs/decisions/

↓

sources/

↓

implementation
```

---

# Validation Rules

- Every ADR must reference at least one ecosystem.
- Every ecosystem must reference at least one ADR.
- Every extracted component must reference its source ecosystem.
- Every implementation must originate from a documented component.
- No undocumented component may be implemented.

---

# Status

Maintained continuously.
