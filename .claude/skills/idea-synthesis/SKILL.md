---
name: idea-synthesis
description: >
  Analyzes two or more ideas for compatibility, integration potential, or
  combination into a single stronger concept. Use when a user wants to know if
  ideas can work together, share infrastructure, serve the same user, be rolled
  out sequentially, or be merged. Triggers on "can these work together",
  "combine these ideas", "how do these relate", "integration", "shared users",
  "which idea first", or any prompt mentioning multiple idea names. Also use
  when a new idea feels like it could be a feature of an existing one.
  Do NOT use for single-idea analysis.
---

# Idea Synthesis

## When To Use
Activate when two or more ideas need to be compared, combined, or sequenced relative to each other.

## Output
Create `/combined/[idea-a]--[idea-b]-synthesis.md` (alphabetical order, kebab-case).
Also update the `Related Ideas` section in each involved idea's `README.md`.

---

## Synthesis Report Template

```markdown
# Synthesis — [Idea A] × [Idea B]

**Date:** YYYY-MM-DD  
**Ideas involved:** [list with links to their folders]  
**Synthesis type:** Merge / Integration / Sequential rollout / Shared infrastructure / Incompatible

---

## 1. Idea Summaries (Quick Reference)

| | [Idea A] | [Idea B] |
|---|---|---|
| One-liner | | |
| Target user | | |
| Core value prop | | |
| Stage | | |

---

## 2. Compatibility Assessment

### Do they share the same user?
[Yes / No / Overlapping — explain]

### Do they share infrastructure?
[DB, auth, API, ML models, payment rails — list what's shared and what's separate]

### Do they create a flywheel together?
[Does one feed data, users, or value to the other? Describe the loop if yes.]

### Do they conflict?
[Resource conflict, positioning conflict, brand confusion, technical incompatibility — be explicit]

---

## 3. Integration Architecture (if applicable)

```
[Idea A] ──── [shared component] ──── [Idea B]
   │                                      │
[unique A]                           [unique B]
```

Key integration points:
- [point 1 — what talks to what]
- [point 2]

Estimated integration complexity: Low / Med / High  
Why: [1 sentence]

---

## 4. Rollout Sequencing

If both ideas are pursued, what order makes sense?

| Option | Sequence | Rationale | Risk |
|---|---|---|---|
| A first | Build A → integrate B later | [why] | [risk] |
| B first | Build B → integrate A later | [why] | [risk] |
| Simultaneous | Build together from day 1 | [why] | [risk] |
| Merge into one | Redesign as unified product | [why] | [risk] |

**Recommended sequence:** [choice + reasoning]

---

## 5. Combined Value Proposition (if merged or integrated)

[If these ideas become one product or tightly integrated: what's the pitch? Who is the user? What's the one-liner?]

---

## 6. Decision

| Option | Verdict | Notes |
|---|---|---|
| Keep separate | ✅ / ❌ | |
| Integrate | ✅ / ❌ | |
| Merge into one | ✅ / ❌ | |
| Build A, kill B | ✅ / ❌ | |

**Recommendation:** [1–3 sentences. Direct. No hedging.]
```

---

## Agent Instructions

1. Read all involved ideas' `README.md`, `feasibility.md`, and `profitability.md` if they exist.
2. Map the user overlap — same person with different jobs-to-be-done, or genuinely different users?
3. Draw the integration architecture diagram (even ASCII is fine) when ideas share infrastructure.
4. Give a concrete rollout sequence recommendation. Saying "it depends" is not acceptable — pick one and defend it.
5. Update each idea's `README.md` → Related Ideas section with a cross-link.
6. Create the synthesis doc in `/combined/`, not inside either idea folder.