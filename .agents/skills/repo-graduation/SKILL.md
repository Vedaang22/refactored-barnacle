---
name: repo-graduation
description: >
  Decides whether a finalized idea is ready to move to its own dedicated
  repository, and generates the graduation checklist, new repo structure,
  and handoff notes. Use when an idea has completed roadmapping and the
  team is asking "should we start building?", "should this get its own repo?",
  "is this idea done here?", "ready to build", or "graduate this idea".
  Also generates the initial folder structure and README for the new repo.
  Do NOT use for ideas still in Seed or Analysis stage.
---

# Repo Graduation

## When To Use
Activate when an idea has a completed roadmap and the team is ready to start building. This skill makes the graduation decision and prepares everything needed to spin up the new repo.

## Output
1. Update `/ideas/[name]/status.md` with graduation decision and rationale.
2. Create `/ideas/[name]/graduation-handoff.md` with the full handoff package.
3. Move the idea folder to `/archive/graduated/[name]/` (or note this step for the human to do).

---

## Graduation Checklist

Before recommending graduation, verify all of the following. A single ❌ should pause graduation until resolved.

```markdown
# Graduation Checklist — [Idea Name]

Date: YYYY-MM-DD

## Idea Completeness
- [ ] README.md exists with a clear one-liner and defined target user
- [ ] At least 3 key assumptions documented
- [ ] MVP scope explicitly defined and agreed upon

## Analysis Quality
- [ ] Feasibility verdict is 🟢 or 🟡 (not 🔴)
- [ ] All 🔴 risks from feasibility have a mitigation plan
- [ ] Profitability model exists with stated assumptions
- [ ] LTV:CAC ratio is > 3:1 OR a clear path to it is documented

## Roadmap Readiness
- [ ] Feature inventory complete
- [ ] MVP feature set agreed and locked
- [ ] Dependency map drawn
- [ ] Critical path identified
- [ ] Phase 0 (foundation) tasks are specific enough to start tomorrow
- [ ] At least one person knows what to build on day 1

## Decision
- [ ] Both collaborators have agreed to build this
- [ ] There is a named owner / lead for the new repo
```

---

## Graduation Handoff Template

```markdown
# Graduation Handoff — [Idea Name]

**Graduated on:** YYYY-MM-DD  
**From:** [this repo] `ideas/[name]/`  
**To:** New repo `[suggested-repo-name]`  
**Owner:** [person]  
**Co-owner:** [person]

---

## New Repo Setup

### Suggested repo name
`[kebab-case-name]`

### Suggested description (for GitHub)
[One sentence — what the product does and who it's for]

### Suggested repo structure
```
/
├── README.md           # Product overview + quickstart
├── docs/
│   ├── architecture.md
│   ├── data-model.md
│   └── api.md
├── src/                # or /app, /packages — depends on stack
├── tests/
├── .agents/            # Copy relevant skills from this repo
│   └── skills/
├── AGENTS.md           # New repo's agent instructions (generate fresh)
└── .github/
    └── AGENTS.md       # Same content for GitHub Copilot compatibility
```

### First week checklist (copy to new repo's issues)
- [ ] Initialize repo with the structure above
- [ ] Copy `ideas/[name]/roadmap.md` → `docs/roadmap.md`
- [ ] Set up dev environment (document in README.md)
- [ ] Create GitHub Project board with Phase 0 tasks
- [ ] Identify and spike on the highest-risk technical dependency
- [ ] Book first weekly sync

---

## Reference Documents
All of these should be migrated to the new repo's `docs/`:
- [feasibility.md](../feasibility.md)
- [profitability.md](../profitability.md)
- [roadmap.md](../roadmap.md)
- [synthesis.md](../synthesis.md) ← if this idea integrates with another

---

## Key Decisions Made in This Repo
[Summarize the 3–5 most important decisions that shaped this idea — so future contributors understand the "why"]
1. [decision + rationale]
2.
3.

---

## What Was Explicitly Ruled Out
[Features, approaches, or markets deliberately excluded — and why]
- [excluded thing]: [reason]

---

## Remaining Open Questions
[Things not resolved in this repo — carry them forward as the new repo's first GitHub issues]
- [ ] [question]
- [ ] [question]
```

---

## Should This Stay in One Repo?

Sometimes ideas should NOT graduate to a new repo. Use this decision tree:

```
Is the idea a standalone product with its own codebase?
  Yes → Graduate to new repo
  No → Is it a feature of an existing product?
    Yes → Add to that product's repo directly
    No → Is it a module/library?
      Yes → Graduate as a package repo (e.g. npm/PyPI)
      No → Keep it here until it's more defined
```

## Agent Instructions

1. Run through the graduation checklist first. Report the status of every item.
2. If any item is ❌, stop and tell the user what needs to be resolved before graduating. Don't skip this.
3. If all ✅, generate the full handoff document.
4. Generate a suggested AGENTS.md for the new repo (lean — 30–50 lines max, specific to a build repo, not an idea repo).
5. Update this repo's `status.md` to stage: Graduated. Archive the idea folder.
6. The new repo's AGENTS.md should reflect that it's a build repo — different conventions from this idea repo.