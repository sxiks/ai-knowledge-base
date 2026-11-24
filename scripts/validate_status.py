#!/usr/bin/env python3
"""validate_status.py

Checks docs/status/project-status.json against the repository:
vocabularies, referenced paths and commits, release (CHANGELOG), phases
(research roadmap), ADRs (docs/decisions) and resource counts (front
matter of sources/).

Standard library only. Exit code 0 when every check passes, 1 otherwise.
"""

import collections
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
STATUS = ROOT / "docs" / "status" / "project-status.json"

VOCAB = {
    "phase": {"not-started", "research-in-progress", "review-pending", "completed"},
    "plan": {"not-started", "in-progress", "completed"},
    "discrepancy": {"open", "in-progress", "resolved"},
    "severity": {"Critical", "High", "Medium", "Low", "Informational"},
    "task": {"pending", "in-progress", "needs-review", "needs-validation", "blocked", "deferred"},
    "priority": {"High", "Medium", "Low", None},
}
REQUIRED = ["schema_version", "updated", "based_on_commit", "project", "release",
            "current_stage", "phases", "decisions", "reconciliation", "open_tasks", "resources"]
RESOURCE_FIELDS = {"by_research_status": "research_status", "by_decision": "decision",
                   "by_kind": "kind", "by_environment": "environment"}

errors = []


def fail(message):
    errors.append(message)


def git(*args):
    return subprocess.run(["git", "-C", str(ROOT), *args], capture_output=True, text=True)


def front_matter(path):
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---\n"):
        return None
    block = text.split("---\n", 2)[1]
    values = {}
    for line in block.splitlines():
        match = re.match(r"^([a-z_]+):\s*(\S.*?)\s*(?:#.*)?$", line)
        if match:
            values[match.group(1)] = match.group(2).strip('"')
    return values


def check_commit(value, where):
    if value is None:
        return
    if not re.fullmatch(r"[0-9a-f]{7,40}", value):
        fail(f"{where}: invalid commit '{value}'")
    elif git("cat-file", "-e", f"{value}^{{commit}}").returncode != 0:
        fail(f"{where}: commit {value} not found")


def main():
    try:
        status = json.loads(STATUS.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        print(f"[FAIL] {STATUS.relative_to(ROOT)}: {exc}")
        return 1

    for key in REQUIRED:
        if key not in status:
            fail(f"missing top-level key '{key}'")
    if errors:
        return report()

    # Commits
    base = status["based_on_commit"]
    check_commit(base, "based_on_commit")
    if base and git("merge-base", "--is-ancestor", base, "HEAD").returncode != 0:
        fail(f"based_on_commit {base} is not an ancestor of HEAD")

    # Release against the CHANGELOG
    release = status["release"]
    version = release.get("current_version")
    changelog = (ROOT / "CHANGELOG.md").read_text(encoding="utf-8")
    heading = f"## [{version}] - {release.get('date')} - {release.get('title')}"
    if heading not in changelog:
        fail(f"release: '{heading}' not found in CHANGELOG.md")
    if release.get("tag") != f"v{version}":
        fail(f"release: tag '{release.get('tag')}' does not match version {version}")

    # Phases against the research roadmap
    roadmap = (ROOT / "research" / "research-roadmap.md").read_text(encoding="utf-8")
    for phase in status["phases"]:
        label = f"phase {phase['number']}"
        if phase["status"] not in VOCAB["phase"]:
            fail(f"{label}: status '{phase['status']}'")
        if f"## Phase {phase['number']}\n\n{phase['name']}\n" not in roadmap:
            fail(f"{label}: name '{phase['name']}' not in research-roadmap.md")
        report_name = Path(phase["report"]).name
        if report_name not in roadmap:
            fail(f"{label}: report {report_name} not in research-roadmap.md")
        if phase["report_present"] != (ROOT / phase["report"]).exists():
            fail(f"{label}: report_present does not match {phase['report']}")
        for review in phase.get("review") or []:
            if not (ROOT / review).exists():
                fail(f"{label}: review {review} not found")

    # ADRs against docs/decisions
    adr_files = sorted((ROOT / "docs" / "decisions").glob("ADR-*.md"))
    if len(adr_files) != len(status["decisions"]):
        fail(f"decisions: {len(status['decisions'])} listed, {len(adr_files)} ADR files")
    for adr in status["decisions"]:
        path = ROOT / adr["file"]
        if not path.exists():
            fail(f"{adr['id']}: {adr['file']} not found")
            continue
        text = path.read_text(encoding="utf-8")
        first = text.splitlines()[0] if text else ""
        if adr["id"] not in first or adr["title"] not in first:
            fail(f"{adr['id']}: title does not match {adr['file']}")
        if f"- Status: {adr['status'].capitalize()}" not in text:
            fail(f"{adr['id']}: status does not match")
        if f"- Date: {adr['date']}" not in text:
            fail(f"{adr['id']}: date does not match")

    # Reconciliation
    recon = status["reconciliation"]
    open_steps = set()
    for step in recon["plan"]:
        if step["status"] not in VOCAB["plan"]:
            fail(f"plan {step['id']}: status '{step['status']}'")
        for commit in step["commits"]:
            check_commit(commit, f"plan {step['id']}")
            if commit is None:
                open_steps.add(step["id"])
    seen = set()
    for item in recon["discrepancies"]:
        if item["id"] in seen:
            fail(f"{item['id']}: duplicated")
        seen.add(item["id"])
        if item["status"] not in VOCAB["discrepancy"] or item["severity"] not in VOCAB["severity"]:
            fail(f"{item['id']}: status or severity outside the vocabulary")
        if item["status"] == "resolved":
            resolved = item.get("resolved_in") or {}
            check_commit(resolved.get("commit"), item["id"])
            if resolved.get("commit") is None and not item.get("evidence") \
                    and resolved.get("step") not in open_steps:
                fail(f"{item['id']}: resolved without commit or evidence")

    # Open tasks
    seen = set()
    for task in status["open_tasks"]:
        if task["id"] in seen:
            fail(f"{task['id']}: duplicated")
        seen.add(task["id"])
        if task["status"] not in VOCAB["task"] or task["priority"] not in VOCAB["priority"]:
            fail(f"{task['id']}: status or priority outside the vocabulary")

    # Resources against the front matter of sources/
    counts = {key: collections.Counter() for key in ["by_category", *RESOURCE_FIELDS]}
    total = 0
    for path in sorted((ROOT / "sources").glob("*/*.md")):
        if path.name == "README.md":
            continue
        meta = front_matter(path)
        if meta is None:
            fail(f"{path.relative_to(ROOT)}: no front matter")
            continue
        total += 1
        counts["by_category"][path.parent.name] += 1
        for key, field in RESOURCE_FIELDS.items():
            counts[key][meta.get(field)] += 1
    resources = status["resources"]
    if resources["total"] != total:
        fail(f"resources.total: {resources['total']} recorded, {total} found")
    for key, counter in counts.items():
        if dict(counter) != resources.get(key):
            fail(f"resources.{key} does not match the resource files")

    return report()


def report():
    if errors:
        for message in errors:
            print(f"[FAIL] {message}")
        print(f"[FAIL] {len(errors)} problem(s) in docs/status/project-status.json")
        return 1
    print("[ OK ] docs/status/project-status.json matches the repository.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
