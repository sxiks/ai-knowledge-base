# ADR-003 — Use GStack as a Knowledge Reference Only

- Status: Accepted
- Date: 2026-07-02
- Decision Makers: Repository Maintainer
- Category: Architecture
- Scope: AI Development Ecosystem

---

## Context

GStack represents a mature and opinionated AI engineering ecosystem.

It provides valuable ideas regarding:

- Workflow design
- Agent orchestration
- Prompt organization
- Development practices
- Team-oriented engineering

However, the repository embeds many architectural assumptions that conflict with the project's objective of maintaining an independent, provider-agnostic ecosystem.

---

## Decision

GStack will be treated exclusively as a knowledge reference.

Its engineering concepts may be studied and selectively adapted.

Its complete workflow will not be adopted.

Its architecture will not become the primary foundation of this repository.

---

## Rationale

The decision is based on the following findings:

- Valuable engineering concepts.
- High educational value.
- Strong workflow ideas.
- Good documentation.

However:

- Highly opinionated architecture.
- Strong ecosystem assumptions.
- Lower flexibility.
- Reduced portability compared to Superpowers.

Knowledge Extraction Score: **6/10**

---

## Consequences

### Positive

- Access to valuable engineering ideas.
- Reduced architectural lock-in.
- Greater flexibility.
- Easier ecosystem evolution.

### Negative

- Some useful automation patterns will require manual adaptation.
- Certain workflow integrations will not be adopted directly.

### Explicit Restrictions

The following actions are prohibited:

- Adopting GStack as the primary workflow.
- Replacing the official engineering methodology with GStack.
- Copying the complete ecosystem architecture without evaluation.

Only individual concepts, patterns and implementation ideas may be incorporated after technical review.

---

## Related Decisions

- ADR-001 — Primary Engineering Methodology
- ADR-002 — Selective ECC Adoption
