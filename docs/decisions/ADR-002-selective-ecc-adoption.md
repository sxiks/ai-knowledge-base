# ADR-002 — Adopt ECC as a Curated Component Library

- Status: Accepted
- Date: 2026-07-02
- Decision Makers: Repository Maintainer
- Category: Architecture
- Scope: AI Development Ecosystem

---

## Context

ECC provides one of the largest collections of:

- Skills
- Agents
- Commands
- Rules
- Automation components

The ecosystem is comprehensive but significantly larger than the project's actual requirements.

The objective of this repository is to maintain a minimal, maintainable, high-quality AI ecosystem rather than maximizing the number of installed components.

---

## Decision

ECC will **not** be installed as a complete ecosystem.

ECC will be used exclusively as a curated component library.

Only carefully selected components may be adopted after technical evaluation.

Target adoption limits:

- Approximately 15 Skills
- Approximately 10 Agents
- Selected MCP Servers
- Selected Rules
- Selected Commands

Every adopted component must be individually evaluated before integration.

---

## Rationale

The decision is based on the following findings:

- Excellent repository breadth.
- Large collection of reusable components.
- High platform compatibility.
- Strong source of engineering knowledge.

However:

- Full installation introduces unnecessary complexity.
- High redundancy with existing ecosystem.
- Increased maintenance cost.
- Reduced long-term maintainability.

Knowledge Extraction Score: **8/10**

---

## Consequences

### Positive

- Minimal installation footprint.
- Lower maintenance burden.
- Better quality control.
- Easier long-term evolution.
- Reduced duplication.

### Negative

- Requires manual curation.
- Higher initial evaluation effort.

### Explicit Restrictions

The following actions are prohibited:

- Installing the complete ECC ecosystem.
- Importing all Skills.
- Importing all Agents.
- Importing all Commands.
- Importing every available Rule.

Only individually approved components may be integrated.

---

## Related Decisions

- ADR-001 — Primary Engineering Methodology
- ADR-003 — GStack Reference Only
