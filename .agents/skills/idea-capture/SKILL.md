---
name: idea-capture
description: >
  Captures and structures a new idea into a standardized brief. Use when a user
  describes a new idea, concept, product, feature, or business opportunity and
  wants it documented. Triggers on phrases like "I have an idea", "new idea",
  "what do you think about", "let's explore", or when the user pastes a raw
  braindump and wants it organized. Do NOT use when the idea already has a
  README.md — use feasibility-analysis or idea-synthesis instead.
---

# Idea Capture

## When To Use
Activate when a new idea is being introduced for the first time and needs a structured home in this repo.

## Output
Create `/ideas/[kebab-case-name]/README.md` with the structure below.

---

## Idea Brief Template

```markdown
# [Idea Name]

**Stage:** Seed  
**Created:** YYYY-MM-DD  
**Owner(s):** [names]  
**One-liner:** [≤ 20 words. What it is and who it's for.]

---

## Problem
[What pain point or gap does this address? Be specific. Who has this problem and how often?]

## Solution
[How does this idea solve the problem? What's the core mechanism?]

## Target User
- **Primary:** [who]
- **Secondary:** [who else might benefit]

## Key Assumptions
List the top 3–5 assumptions that, if wrong, would kill this idea:
1. [assumption]
2. [assumption]
3. [assumption]

## Initial Scope (MVP)
[What's the smallest version that validates the core assumption?]

## Out of Scope (v1)
[What are you explicitly NOT doing in the first version?]

## Open Questions
- [ ] [question 1]
- [ ] [question 2]

## Related Ideas
[Links to other idea folders in this repo that might intersect]

## Notes
[Anything else — links, inspiration, raw thoughts]
```

---

## Agent Instructions

1. Ask the user: "What's the idea? Give me as much or as little as you have." Accept any format — voice-note transcription, bullet dump, or a paragraph.
2. Extract the core signal. If anything is ambiguous, ask ONE clarifying question before proceeding — don't ask a list.
3. Infer the one-liner yourself. Show it to the user for confirmation.
4. Fill in every section you can from context. Mark genuinely unknown sections as `[TBD]` — do not invent.
5. Create the folder and file. Update `/ideas/[name]/status.md` to stage: Seed.
6. List the next recommended action (usually: run feasibility-analysis).