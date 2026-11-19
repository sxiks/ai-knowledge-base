# Component Registry

Status: Active

---

# Purpose

Summary of the decisions recorded for knowledge base resources.

The state of every resource is kept in its own file, in the YAML front matter defined by ADR-004 (`kind`, `research_status`, `decision`, `environment`, `evidence`). This registry does not repeat it: it lists only the resources with a decision other than `candidate`.

---

# Decided Resources

| ID | Resource | Decision | Evidence |
|----|----------|----------|----------|
| ECO-002 | Superpowers | adopted | ADR-001 |
| ECO-003 | ECC | selective | ADR-002 |
| ECO-001 | GStack | reference | ADR-003 |

Every other resource is `candidate` until a reviewed report or an ADR supports a decision.

---

# Lifecycle

Resources follow the Resource Lifecycle in [docs/architecture/repository-workflow.md](../architecture/repository-workflow.md).

---

# Status Values

Defined in [ADR-004](../decisions/ADR-004-resource-lifecycle.md):

- `research_status`: not-researched, extracted, report-backed, reviewed, verified
- `decision`: candidate, adopted, selective, reference, rejected, superseded
- `environment`: installed, not-installed, unknown
- `kind`: component, conceptual-pattern
