---
name: assumption-challenger
description: >
  Use this skill to adversarially stress-test an idea — surface hidden
  assumptions, find the most likely failure modes, and build the strongest
  case against it. Designed to run inside a subagent so its skepticism stays
  isolated from the main analysis thread. Triggers on "poke holes in this",
  "what could go wrong", "steelman the counter-argument", "what am I missing",
  "devil's advocate", or automatically after a green/yellow feasibility verdict.
allowed-tools: Read
model: opus
context: fork
user-invocable: false
---
# Claude Code: Opus for adversarial depth reasoning, Read-only, forked context


**Assumption 1: [State as a positive claim the team believes]**
- Why it might be wrong: [specific mechanism or counter-evidence]
- Cheap validation: [concrete test — ideally < 1 week and < ₹5000]
- Kill probability if wrong: High / Medium / Low

---

[repeat for 2–5]

---

### The One Thing Most Likely to Kill This Idea
[Single paragraph. Direct. No hedging.]

### What the Team is Probably Overconfident About
[1–3 sentences on the bias pattern visible in the documents]
```

## Rules

- Read the docs before generating output. Never work from memory.
- Do not repeat risks already documented in `feasibility.md` — find new ones.
- Do not soften findings. A dead idea found cheaply is a success.
- Surface second-order risks — the obvious ones aren't useful here.