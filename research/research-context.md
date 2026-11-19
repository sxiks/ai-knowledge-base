# Research Context

## Project Purpose

Build a complete, maintainable and reproducible AI development ecosystem.

The objective is not to collect the largest number of tools.

The objective of adoption is to identify the smallest set of high-quality tools that together provide a complete AI-assisted software development environment. Research itself is exhaustive (see `research-goals.md` · Selection Policy).

This repository provides the knowledge and the decisions. The environment itself is materialized by other repositories (see Desired End State).

---

Version: v1.1
Last Updated: 2026-11-18

---

# Developer Profile

Current level

- Programming student

Current knowledge

- Python
- HTML
- CSS
- JavaScript

Learning goals

- AI Engineering
- Machine Learning
- Data Analysis
- Software Engineering
- Linux

---

# Long-Term Goals

The ecosystem should support:

- Daily software development
- AI-assisted programming
- Code review
- Specification Driven Development
- Automation
- Knowledge management

---

# Design Principles

Always prioritize

- Simplicity
- Reproducibility
- Automation
- Provider independence
- Reusability
- Scalability
- Long-term maintainability

Avoid

- Duplicate tools
- Vendor lock-in
- Unmaintained repositories
- Over-engineering
- Unnecessary complexity

---

# Desired End State

Starting from a clean Debian installation:

git clone

↓

bootstrap.sh

↓

Automatic installation

↓

Ready-to-use AI workstation

This end state is achieved by `linux-dev-workstation` (system, dotfiles and packages) and `ai-workspace` (AI platform configuration; planned, not created yet), using the decisions recorded in this repository.

`ai-knowledge-base` does not install or set up AI platforms. It documents components, their compatibility and how each platform organizes skills, agents, plugins and MCP servers (ADR-005).

---

# Expected Deliverables

Research should recommend:

- Platforms
- Ecosystems
- Agents
- Subagents
- Skills
- MCP Servers
- Plugins
- LSPs
- Utilities
- Workflows
- Methodologies

Every recommendation must include technical justification.
