---
name: repo-graduation
description: >
  Orchestrates the full graduation of a finalized idea to its own build
  repository. Runs in sequence: graduation checklist → vision doc (via
  graduation-vision skill) → agents blueprint + bootstrap script (via
  graduation-blueprint skill) → archive. Use when an idea has completed
  roadmapping and both collaborators agree it is ready to build. Triggers on
  "graduate this idea", "is this ready to build", "should this get its own repo",
  "ready to ship", or "finalize this idea". Do NOT use for ideas still in
  Seed, Analysis, or Roadmap stage — the checklist will catch this, but it
  wastes time. Do NOT use this skill for analysis tasks — use feasibility-analysis
  or assumption-challenger instead.
---

# Repo Graduation

## What this skill does

Graduation is a four-step pipeline. This skill runs each step in order and
stops if anything fails. It does NOT rush — a bad graduation wastes more time
than a delayed one.

```
Step 1: Graduation Checklist    ← gate. All items must pass.
Step 2: graduation-vision       ← generates vision.md (human validates)
Step 3: graduation-blueprint    ← generates agents-blueprint.md + bootstrap.sh
Step 4: Archive + status update ← moves folder, updates status.md
```

Steps 2 and 3 are delegated to their own skills via subagents so the
generated documents stay clean and isolated.

---

## Step 1 — Graduation Checklist

Run this before anything else. A single ❌ stops graduation and tells the
user exactly what to fix. Do not proceed if any item fails.

```
IDEA COMPLETENESS
- [ ] README.md exists with a clear one-liner and defined target user
- [ ] At least 3 key assumptions documented in README.md
- [ ] MVP scope explicitly defined and agreed upon by both collaborators

ANALYSIS QUALITY
- [ ] feasibility.md exists
- [ ] Feasibility verdict is 🟢 or 🟡 (not 🔴)
- [ ] All 🔴 risks in feasibility.md have a documented mitigation
- [ ] profitability.md exists with stated assumptions
- [ ] LTV:CAC ratio > 3:1 OR a documented path to it exists

ROADMAP READINESS
- [ ] roadmap.md exists
- [ ] Feature inventory is complete (not just MVP features)
- [ ] MVP feature set is locked — no "TBD" features in MVP column
- [ ] Dependency map exists (ASCII tree)
- [ ] Critical path is identified with time estimates
- [ ] Phase 0 tasks are specific enough to assign tomorrow

HUMAN SIGN-OFF
- [ ] Both collaborators have explicitly agreed to build this
- [ ] A named owner is assigned to the new repo
```

If checklist passes: proceed to Step 2.
If checklist fails: list every ❌ item, explain what's missing, and stop.
Do not proceed until the user confirms the gaps are resolved.

---

## Step 2 — Vision Document

Delegate to the `graduation-vision` skill in a subagent:

```
In a subagent: Generate the vision document for idea [name].
Use the graduation-vision skill.
Context needed: Read all files in ideas/[name]/
```

After the subagent completes:
- Present a summary of what vision.md contains
- Ask the user: "Does this capture what you're building? Anything missing
  or wrong before we proceed?"
- Wait for explicit confirmation before moving to Step 3.
  Do not auto-proceed. Vision docs must be human-validated.

---

## Step 3 — Blueprint + Bootstrap

After vision.md is confirmed, delegate to `graduation-blueprint` in a subagent:

```
In a subagent: Generate the agents blueprint and bootstrap script for idea [name].
Use the graduation-blueprint skill.
Context needed: Read ideas/[name]/vision.md, ideas/[name]/roadmap.md,
ideas/[name]/feasibility.md, ideas/[name]/graduation-handoff.md
```

After the subagent completes:
- Confirm `agents-blueprint.md` was written
- Confirm `bootstrap.sh` was written and is executable (`chmod +x`)
- Show the user the run command:
  ```
  bash ideas/[name]/bootstrap.sh
  ```
  Or with a custom path:
  ```
  bash ideas/[name]/bootstrap.sh ~/projects/[repo-name]
  ```

---

## Step 4 — Graduation Handoff Document

Before archiving, write `ideas/[name]/graduation-handoff.md`:

```markdown
# Graduation Handoff — [Idea Name]

**Graduated on:** YYYY-MM-DD
**From:** ideas/[name]/
**To:** New repo — [suggested-repo-name]
**Owner:** [name]
**Co-owner:** [name]

---

## Files Generated

| File | Purpose |
|---|---|
| `vision.md` | Full product vision — migrates to `docs/vision.md` |
| `agents-blueprint.md` | Agent + skill spec for the build repo |
| `bootstrap.sh` | Run this to create the new repo |
| `roadmap.md` | Feature plan — migrates to `docs/roadmap.md` |
| `feasibility.md` | Analysis — migrates to `docs/feasibility.md` |
| `profitability.md` | Economics — migrates to `docs/profitability.md` |

## How to Bootstrap

```bash
# From the root of this idea repo:
bash ideas/[name]/bootstrap.sh

# Or to a custom path:
bash ideas/[name]/bootstrap.sh ~/projects/[repo-name]
```

## Key Decisions Made Here
[Top 3–5 decisions that shaped the idea — so the build repo's contributors
understand what was already settled and why]
1. [decision + rationale]
2.
3.

## What Was Explicitly Ruled Out
[Features or approaches that were considered and rejected — with reasons.
These should not be relitigated in the build repo without revisiting the
rationale here first.]
- [thing]: [reason]

## Remaining Open Questions
[Unresolved items that become the new repo's first issues]
- [ ] [question — and which feature/decision it blocks]
```

---

## Step 5 — Archive

After handoff document is written:

1. Move `ideas/[name]/` → `archive/graduated/[name]/`
2. Update `status.md` (inside the archived folder) to:
   ```
   Stage: Graduated
   Date: YYYY-MM-DD
   New repo: [repo-name]
   Bootstrap: Run `bash archive/graduated/[name]/bootstrap.sh`
   ```
3. Confirm to the user:
   ```
   ✅ [Idea name] graduated.

   Idea folder archived at: archive/graduated/[name]/
   Run the bootstrap:       bash archive/graduated/[name]/bootstrap.sh

   The script will create [repo-name]/ in the parent directory,
   copy all docs, scaffold agents and skills, and make the first commit.
   ```

---

## Should This Stay in One Repo?

Sometimes ideas should NOT graduate to a new repo:

```
Is this a standalone product with its own codebase?
  Yes → Graduate to new repo (this skill)
  No  → Is it a feature of an existing product?
          Yes → Add to that repo's roadmap directly. No graduation.
          No  → Is it a reusable module or library?
                  Yes → Graduate as a package repo (note: adjust bootstrap.sh
                        to scaffold a library structure instead of an app)
                  No  → Keep here until more defined
```

---

## Agent Rules

- Never skip the checklist. It exists because rushed graduations create bad
  build repos that confuse contributors and waste the first two weeks.
- Never auto-proceed past Step 2 without human validation of vision.md.
- The bootstrap script must be complete and runnable — not a template.
  If the graduation-blueprint subagent returns a script with unfilled
  placeholders, send it back.
- One idea graduates per session. Do not batch.