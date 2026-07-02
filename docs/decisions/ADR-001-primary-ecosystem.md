# ADR-001 — Adopt Superpowers as the Primary Engineering Methodology

- Status: Accepted
- Date: 2026-07-02
- Decision Makers: Repository Maintainer
- Category: Architecture
- Scope: AI Development Ecosystem

---

## Context

The initial ecosystem evaluation compared the three primary AI engineering ecosystems:

- Superpowers
- ECC
- GStack

The evaluation considered:

- Provider independence
- Cross-platform compatibility
- Engineering methodology
- Documentation quality
- Testing practices
- Release cadence
- Maintainability
- Reusability
- Alignment with long-term project goals

The project aims to build a reusable, provider-agnostic AI development environment supporting multiple coding platforms while maintaining a single engineering methodology.

---

## Decision

Adopt **Superpowers** as the primary engineering methodology for the repository.

Superpowers becomes the reference implementation for:

- Development workflow
- Project organization
- Engineering practices
- Specification-first development
- Task execution methodology
- Documentation standards
- Cross-platform workflows

Superpowers is adopted as a methodology, not as an exclusive platform dependency.

Platform-specific implementations remain independent.

---

## Rationale

The decision is based on the following findings:

- Provider-agnostic architecture
- Native support for multiple AI coding platforms
- Strong engineering methodology
- Mature documentation
- Active maintenance
- Consistent release process
- Modular design
- High portability
- High compatibility with future ecosystem growth

Evaluation score:

| Criterion | Result |
|-----------|--------|
| Methodology | Excellent |
| Portability | Excellent |
| Documentation | Excellent |
| Maintainability | Excellent |
| Provider Independence | Excellent |
| Long-Term Scalability | Excellent |

Knowledge Extraction Score: **10/10**

---

## Consequences

### Positive

- Single engineering methodology across all AI platforms.
- Reduced vendor lock-in.
- Consistent project organization.
- Simplified onboarding.
- Better long-term maintainability.
- Easier migration between AI coding tools.

### Negative

- Requires adapting existing workflows.
- Some platform-specific practices may be intentionally ignored.

### Risks

- Future project evolution may require revisiting this decision.
- New ecosystems may surpass current methodology.

---

## Related Decisions

- ADR-002 — Selective ECC Adoption
- ADR-003 — GStack Reference Only
