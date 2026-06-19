---
name: feature-roadmapping
description: >
  Breaks an idea into features, maps their dependencies, defines a rollout
  sequence, and identifies the critical path. Use when an idea has been
  assessed and the user wants to plan what to build and in what order.
  Triggers on "what do we build first", "roadmap", "feature list", "dependencies",
  "what's the MVP", "rollout plan", "critical path", "sprints", "phases",
  or when moving from Analysis → Roadmap stage. Also use when adding new
  features to an existing roadmap. Do NOT use for initial idea capture or
  feasibility — use those skills first.
---

# Feature Roadmapping

## When To Use
Activate when an idea has passed feasibility analysis and the team wants to plan execution. Works for single ideas or integrated multi-idea products.

## Output
Create or update `/ideas/[name]/roadmap.md`.

---

## Roadmap Template

```markdown
# Feature Roadmap — [Idea Name]

**Date:** YYYY-MM-DD  
**Based on:** [feasibility.md + profitability.md — link them]  
**Horizon:** [e.g. 12 weeks to MVP, 6 months to v1.0]

---

## Feature Inventory

List every feature the full product would eventually have. Don't filter yet.

| ID | Feature | Description | User story (as a ___ I want to ___ so that ___) |
|---|---|---|---|
| F-01 | | | |
| F-02 | | | |
| ...  | | | |

---

## Feature Classification

| ID | Feature | Must-have (MVP) | Nice-to-have | Future | Kill |
|---|---|---|---|---|---|
| F-01 | | ✅ | | | |
| F-02 | | | ✅ | | |

**MVP features:** [list F-IDs]  
**MVP rationale:** [Why these? What assumption does the MVP validate?]

---

## Dependency Map

```
F-01 (Auth)
  └── F-03 (User profile)
        └── F-07 (Personalization)
F-02 (Core data model)
  ├── F-04 (Search)
  └── F-05 (Recommendations)
        └── F-09 (ML ranking)  ← blocked by: F-02, F-05 + data volume
```

**Blocking dependencies** (cannot start until X is done):
- [F-X] blocks [F-Y] because: [reason]

**External dependencies** (third-party APIs, services, data):
- [what] → [risk if unavailable]

---

## Critical Path

The shortest sequence of features that gets us to a shippable MVP:

```
[F-01] → [F-02] → [F-04] → [F-06] → MVP
  2d        5d       3d       2d     = 12 days minimum
```

**Critical path length:** X days / weeks  
**Float** (what can slip without delaying MVP): [list features with slack]

---

## Rollout Phases

### Phase 0 — Foundation (Week 1–X)
Goal: [what does done look like?]
- [ ] F-01: [feature name]
- [ ] F-02: [feature name]

### Phase 1 — MVP (Week X–Y)
Goal: [the minimum thing a real user can use and get value from]
- [ ] F-03
- [ ] F-04

### Phase 2 — v1.0 (Week Y–Z)
Goal: [stable, shareable, productized]
- [ ] F-05
- [ ] F-06

### Phase 3 — Growth features
[deferred — revisit after MVP validation]

---

## Algorithm / Technical Sketches (if relevant)

For any feature requiring a non-obvious algorithm or data flow, sketch it here:

**[Feature name]:**
```
[pseudocode or flow diagram in ASCII]
Input: X
Process: 
  1. 
  2.
Output: Y
```

---

## Open Questions Before Building Starts
- [ ] [question blocking F-X]
- [ ] [question blocking F-Y]

---

## Risk Register

| Risk | Affects | Mitigation | Owner |
|---|---|---|---|
| [risk] | [feature IDs] | | |
```

---

## Agent Instructions

1. Read `README.md`, `feasibility.md`, and `profitability.md` before starting. The MVP should validate the most critical profitability assumption.
2. Generate the full feature inventory before filtering. Don't self-censor at the listing stage.
3. Be ruthless about MVP scope. Default to cutting, not including.
4. Draw the dependency map as an ASCII tree — it surfaces blockers that prose descriptions miss.
5. Identify the critical path explicitly. Every team wastes time not knowing what's actually blocking them.
6. For any non-trivial algorithm (ML ranking, graph traversal, pricing engine), write a pseudocode sketch — this repo is the right place for that thinking.
7. Update `status.md` to stage: Roadmap after completion.