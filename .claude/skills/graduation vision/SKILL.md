---
name: graduation-vision
description: >
  Generates a comprehensive vision document for an idea that is graduating to
  its own repository. Synthesizes everything across the idea's README, feasibility,
  profitability, synthesis, and roadmap files into a single canonical document
  that defines the product's soul — its vision, features, user experience
  expectations, non-negotiables, and what success looks like. This is the
  document a new contributor reads to understand not just what to build, but
  why. Triggers as part of the repo-graduation workflow or when the user says
  "write the vision doc", "define the product", "document what we're building".
  Do NOT use for ideas still in Analysis or Roadmap stage.
allowed-tools: Read, Write
model: opus
context: fork
user-invocable: false
---
# Claude Code: Opus for synthesis depth, forked context, spawned by repo-graduation only


## Vision Document Template

```markdown
# Vision — [Product Name]

> [A single sentence that captures what this is and why it matters.
> Not a tagline. Not a pitch. The actual north star.]

**Version:** 1.0 (set at graduation)
**Last updated:** YYYY-MM-DD
**Owners:** [names]

---

## The Problem

[2–4 paragraphs. Not bullet points.
Who has this problem? How does it manifest in their day? What do they do today
that doesn't work? What does the failure feel like?
Write this as if explaining to someone who has never heard of the idea.
Cite any real evidence from the feasibility or market research.]

---

## The Solution

[2–3 paragraphs.
What does this product do? What is the core mechanism — not the features, the
underlying idea that makes it work. Why does this approach solve the problem
better than what exists?]

---

## Who This Is For

### Primary User
**Profile:** [job title, context, technical level]
**Their goal:** [what they're trying to accomplish]
**Their constraint:** [time / money / skill / tooling]
**What success looks like for them:** [specific outcome they care about]

### Secondary User
[Repeat structure above if applicable]

### Who This Is NOT For
[Explicitly exclude user types the team might be tempted to serve but shouldn't.
This is as important as defining who it is for.]

---

## Features

### Core Features (MVP — must ship before anything else)

#### [Feature 1 Name]
**What it does:** [1–2 sentences]
**Why it's core:** [what breaks without it]
**Expected behaviour:** [what the user does, what the system does, what the outcome is]
**Success metric:** [how we know it's working]

#### [Feature 2 Name]
[repeat]

---

### Full Feature Set (v1.0 — post-MVP)

| Feature | Description | Why it matters | Phase |
|---|---|---|---|
| [name] | [what it does] | [user value] | 2 / 3 |

---

### Deliberately Not Building (ever, or not yet)

| Feature | Reason excluded |
|---|---|
| [feature] | [why — be specific. "not now" is not a reason] |

---

## Product Vision

### The Experience We're Building Toward
[Describe the ideal end state in 2–3 paragraphs. Not features — the feeling.
What does a user's day look like with this product vs without it?
What would they say to a friend about it?]

### Design Principles
These are the non-negotiable rules that govern every product decision.
When two choices conflict, these principles break the tie.

1. **[Principle name]:** [One sentence explaining what this means in practice
   and what it rules out]
2. **[Principle name]:** [same]
3. **[Principle name]:** [same]

(3–5 principles max. More than 5 means none of them are real.)

### What We Will Never Compromise On
[The 2–3 things that, if we gave them up, this product would become something
else. These are the identity constraints — the lines that don't move regardless
of user requests, investor pressure, or competitive moves.]

---

## Success Metrics

### At MVP Launch
| Metric | Target | Why this number |
|---|---|---|
| [metric] | [number] | [basis] |

### At v1.0
| Metric | Target | Why this number |
|---|---|---|
| [metric] | [number] | [basis] |

### North Star Metric
**[Single metric]** — [why this one captures whether the product is actually
working, not just being used]

---

## Competitive Positioning

| Competitor | What they do well | What we do instead |
|---|---|---|
| [name] | [strength] | [our differentiation] |

**Our moat:** [What makes this defensible over time? Network effects, data,
switching costs, brand? Be honest — "better UX" is not a moat.]

---

## Revenue Model

**Model:** [SaaS / Marketplace / Transactional / Freemium / etc.]
**Pricing:** [tiers and amounts]
**Unit economics summary:** CAC ₹X / LTV ₹X / Payback X months
*(Full model in `docs/profitability.md`)*

---

## Risks and Non-Negotiable Mitigations

The highest-severity risks identified during analysis, and the specific actions
that must be in place before launch — not aspirational mitigations, required ones.

| Risk | Why it's serious | Required mitigation before launch |
|---|---|---|
| [risk] | [impact] | [specific action] |

---

## What This Is Not

[A paragraph explicitly stating what this product is not — adjacent products,
categories, or user types the team might drift toward under pressure.
This section exists to be re-read when scope creep starts.]

---

## Open Questions at Graduation

These were unresolved when the idea graduated. They become the first issues in
the new repo and must be answered before the relevant features are built.

- [ ] [question — link to the feature or decision it blocks]
- [ ] [question]
```

---

## Agent Instructions

1. Read ALL files in the idea folder before writing a single word: README.md,
   feasibility.md, profitability.md, synthesis.md, roadmap.md.
2. Do not copy-paste from those files. Synthesize. The vision doc should read
   as a coherent document written by someone who deeply understands the idea —
   not a compilation of extracts.
3. Fill in every section from the documents. Mark genuinely unresolved things
   as open questions at the bottom — do not invent answers.
4. The design principles must be derived from actual decisions made during
   analysis — not generic startup principles. "Move fast" is not a principle.
5. The "What This Is Not" section is mandatory. Pull from the "out of scope"
   and "ruled out" sections across all files.
6. After writing, confirm with the user: "Does this capture what you're building?
   Anything that's wrong or missing?" Vision docs must be human-validated before
   graduation completes.