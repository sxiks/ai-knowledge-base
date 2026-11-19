# ADR-005 — Multi-Platform Component Model

- Status: Accepted
- Date: 2026-11-13
- Decision Makers: Repository Maintainer
- Category: Architecture
- Scope: `sources/`, `templates/resources/`

---

## Context

`research/research-goals.md` requires the knowledge base to support multiple AI coding platforms. The target platforms are OpenCode, Claude Code, Codex CLI, Gemini CLI and Cursor. OpenCode is the current primary platform, but any of the five may become the primary one, so all of them are compatibility targets with the same priority.

Today the structure does not reflect this objective:

- Resources rate compatibility (`High`, `Medium`) without evidence. 0 of 48 resources have verified compatibility.
- There is no separation between a component's shared definition, its platform-specific implementations and the adaptations between platforms.
- There is no resource file for Cursor.

`ai-workspace`, the repository planned for platform configuration, does not exist yet. This repository must not set up the platforms, but it must document how each platform organizes its components.

This was registered as D-05 and D-11 in the 2026-11-13 architectural reconciliation.

---

## Alternatives

1. Add only a compatibility table to each resource. Keeps compatibility as an unverifiable label.
2. Separate canonical definitions, a compatibility matrix with evidence and documented adapter requirements, and keep adapter files in `ai-workspace`. **Chosen.**
3. Store adapter files in this repository. Rejected: it mixes this repository's responsibility (knowledge and decisions) with `ai-workspace`'s (configuration).

---

## Decision

### 1. Component layers

| Layer | Definition | Where it lives |
|-------|------------|----------------|
| Shared component | Canonical, platform-independent definition: purpose, behavior, inputs and outputs, original source and evidence. | Resource file in `sources/` |
| Platform-specific component | Exists for one platform only, because it depends on features that platform alone provides. | Resource file in `sources/`, marked as such |
| Platform adapter | Transformation of a shared component into one platform's format. | Requirements documented here; adapter files in `ai-workspace` |

### 2. Compatibility matrix

Every resource has one compatibility value per target platform:

| Value | Meaning |
|-------|---------|
| Native | Built for this platform, in its own format. |
| Fully Compatible | Works unchanged. |
| Adaptable | Works through an adapter without losing functionality. |
| Partially Compatible | Works through an adapter, losing functionality (listed). |
| Platform-Specific | Depends on features exclusive to another platform; no equivalent here. |
| Unsupported | Cannot work on this platform. |
| Not Verified | No evidence yet. Default value. |

Every value other than `Not Verified` needs evidence: a source link or a test record. Evidence that comes only from the platform's own documentation is labeled as documented, not tested. Each entry also lists the functionality preserved, the functionality lost and the known limitations.

### 3. Adapter requirements

For every value `Adaptable` or `Partially Compatible`, the resource documents what the adapter needs: target location, format, field mapping and lost functionality. The adapter files themselves are not stored in this repository.

### 4. Component organization per platform

Each platform resource file (`sources/platforms/`) documents how that platform organizes its components, with sources:

- Instruction files
- Skills
- Agents and subagents
- Plugins or extensions
- MCP servers

It records locations, formats, discovery rules and scope. It does not include installation or setup steps for the platform.

### 5. Verification

Compatibility is marked as tested only after a real test on the platform. Tests run outside this repository; their results are recorded here as evidence.

### 6. Platform coverage

The five target platforms each have a resource file. Cursor is added as PLT-005.

---

## Consequences

### Positive

- Reuse across platforms becomes a verifiable fact instead of a label.
- Each platform's organization is documented once and reused by every resource.
- The boundary with `ai-workspace` is explicit.

### Negative

- Every compatibility value starts as `Not Verified` until evidence is gathered.
- Verification requires access to each platform, outside this repository.

---

## Related Decisions

- ADR-001 — Primary Engineering Methodology
- ADR-004 — Resource Lifecycle and Status Vocabulary
