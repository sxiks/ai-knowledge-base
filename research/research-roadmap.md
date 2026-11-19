# Research Roadmap

This document defines the order in which the complete ecosystem will be investigated.

---

Version: v2.0
Last Updated: 2026-11-18

Seven phases, approved on 2026-11-13 (architectural reconciliation, AD-1). Version v1.0 had five phases and a final phase: Phase 4 was Plugins only (`RPT-004-plugins.md`) and Phase 5 was Utilities only (`RPT-005-utilities.md`).

Each phase follows the Phase Execution Workflow (`docs/architecture/repository-workflow.md`). A phase starts only after the previous one is closed (`research-protocol.md` · Incremental Research Mode).

The nine categories of the Incremental Research Mode map to these phases: Ecosystems (1), Agents (2), Skills (3), Plugins and MCP Servers (4), LSPs, Utilities and Workflows (5), Additional References (6).

---

## Phase 1

Ecosystems

Sources

- GStack
- Superpowers
- ECC

Output

RPT-001-ecosystems.md

---

## Phase 2

Agents

Sources

- agency-agents
- multica
- ruflo
- trifecta perfecta
- all-deploy
- the-architect
- cyber-neo

Output

RPT-002-agents.md

---

## Phase 3

Skills

Sources

- karpathy-skills
- caveman
- prompt-master
- skills.sh

Output

RPT-003-skills.md

---

## Phase 4

Plugins and MCP Servers

Sources

- claude-mem
- claude-plugins-official
- MCP Servers listed in `research-sources.md` · MCP Servers

Output

RPT-004-plugins-mcps.md

---

## Phase 5

Engineering Utilities, Methodologies, LSPs and Workflows

Sources

- spec-kit
- OpenSpec
- MarkItDown
- Scrapling
- gsd-core
- ai-engineering-hub
- Claude Code Security Review
- LSPs and workflows referenced by the sources above

Output

RPT-005-engineering-utilities.md

---

## Phase 6

Additional References

Sources

- Documentation, OpenAI and Additional References sections of `research-sources.md`, except skills.sh, which is covered in Phase 3

Output

RPT-006-additional-references.md

---

## Phase 7

Final Consolidation

Review every previous report.

Compare all recommendations.

Remove redundant tools.

Generate the definitive ecosystem, with compatibility for each target platform (ADR-005).

Output

RPT-999-final-recommendation.md
