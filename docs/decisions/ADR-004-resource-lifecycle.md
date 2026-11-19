# ADR-004 — Resource Lifecycle and Status Vocabulary

- Status: Accepted
- Date: 2026-11-13
- Decision Makers: Repository Maintainer
- Category: Knowledge Base
- Scope: `sources/`, `templates/resources/`, `docs/reviews/component-registry.md`

---

## Context

Every resource file uses a single `Status` field. In practice it carries at least three different meanings:

- **Installed** in the workstation (for example AGT-005 to AGT-007 and MCP-004 to MCP-007).
- **Adopted** through an ADR (for example ECO-002, ADR-001).
- **Only documented**, without a research report behind it (for example SKL-006 or UTL-002).

23 resources are marked `Active` with these mixed meanings. Three vocabularies coexist: the resource files (`Active`, `Extracted`, `Reference Only`, `Selective Adoption`, `Evaluated`, `Planned`), `component-registry.md` (`Planned`, `Active`, `Deprecated`, `Archived`, `Reference`) and the resource template (`New`).

In addition, 19 resources marked `Extracted` describe abstractions derived from a source rather than components that exist as such, and SKL-008 is an empty placeholder.

As a result, the knowledge base cannot tell adopted resources apart from documented ones. This was registered as D-01 (critical), D-02 and D-17 in the 2026-11-13 architectural reconciliation.

---

## Alternatives

1. Keep the single field and annotate each case. Fast, but the ambiguity remains.
2. Downgrade every resource to `Extracted`. Loses the installation and adoption information.
3. Replace the single field with independent fields. **Chosen.**

---

## Decision

The single `Status` field is replaced by four independent fields.

### `research_status` — how far the research has gone

| Value | Meaning | Required evidence |
|-------|---------|-------------------|
| `not-researched` | No research yet. | — |
| `extracted` | Created from a source, without a phase report behind it. | Source reference |
| `report-backed` | Covered by a research report that is not yet reviewed. | `research/reports/RPT-*` |
| `reviewed` | Covered by a report with an accepted architecture review. | `docs/reviews/*` |
| `verified` | Behavior checked in practice on at least one platform. | Test record (per-platform detail in the compatibility matrix, ADR-005) |

### `decision` — what the project decided

| Value | Meaning | Required evidence |
|-------|---------|-------------------|
| `candidate` | No decision yet. Default value. | — |
| `adopted` | Approved for use. | ADR or accepted review |
| `selective` | Only some parts are approved. | ADR |
| `reference` | Knowledge only; not to be adopted. | ADR or accepted review |
| `rejected` | Evaluated and not to be adopted. | ADR or accepted review |
| `superseded` | Replaced by another resource, which must be named. | ADR or accepted review |

### `environment` — presence in the workstation

| Value | Meaning |
|-------|---------|
| `installed` | Listed as installed in `research/research-environment.md`. |
| `not-installed` | Confirmed as not installed. |
| `unknown` | No information. |

### `kind` — what the resource is

| Value | Meaning |
|-------|---------|
| `component` | A resource that exists as such in a source (repository, product or documented artifact). |
| `conceptual-pattern` | An abstraction derived from a source. It must reference the source and the section it comes from. |

### Rules

- `decision` values other than `candidate` require the evidence listed above.
- No placeholder resources: a resource file is created only when it has content. IDs are never reused.
- The same vocabulary applies to the resource template and to `component-registry.md`.

---

## Migration of current values

Applied in the next stage of the reconciliation (R3b), resource by resource.

| Current `Status` | `research_status` | `decision` | `kind` | Resources |
|------------------|-------------------|------------|--------|-----------|
| `Active` backed by an ADR | `reviewed` | `adopted` | `component` | ECO-002 (ADR-001) |
| `Selective Adoption` | `reviewed` | `selective` | `component` | ECO-003 (ADR-002) |
| `Reference Only` | `reviewed` | `reference` | `component` | ECO-001 (ADR-003) |
| `Active` without an ADR or report | `extracted` | `candidate` | `component` | The remaining `Active` resources |
| `Extracted` | `extracted` | `candidate` | `conceptual-pattern` | The 19 `Extracted` resources |
| `Evaluated`, `Reference` | `extracted` | `candidate` | `component` | PLT-003, PLT-004, UTL-004 |
| `Planned` (empty) | — | — | — | SKL-008 is removed |

`environment` is taken from `research/research-environment.md`: `installed` for the components listed there, `unknown` for the rest.

---

## Consequences

### Positive

- Adopted, documented and installed resources become distinguishable.
- Every non-default value is traceable to evidence.
- Conceptual patterns remain in the knowledge base without being presented as existing components.

### Negative

- All 48 resource files must be migrated.
- Each new resource requires four fields instead of one.

---

## Related Decisions

- ADR-001 — Primary Engineering Methodology
- ADR-002 — Selective ECC Adoption
- ADR-003 — GStack Reference Only
- ADR-005 — Multi-Platform Component Model
