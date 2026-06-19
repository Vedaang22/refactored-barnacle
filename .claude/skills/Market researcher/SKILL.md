---
name: market-researcher
description: >
  Use this skill when an idea needs external market validation — competitor
  research, TAM estimates, pricing benchmarks, or industry timing signals.
  Designed to run inside a subagent so raw search results never pollute the
  main session. Triggers on "research the market", "find competitors",
  "what's the TAM", "benchmark pricing", "who else is doing this", or when
  the feasibility-analysis skill needs external data filled in.
allowed-tools: WebSearch, WebFetch
model: sonnet
context: fork
user-invocable: false
---
# Claude Code: fork + restricted to web tools only — no file writes
|---|---|---|

### Market Size
- **TAM estimate:** [figure — source — year]
- **SAM estimate:** [figure — basis for narrowing]
- **Confidence:** High / Medium / Low — [one sentence why]

### Pricing Benchmarks
| Product | Price | Model |
|---|---|---|

### Timing Signals
[Recent funding rounds, shutdowns, regulation, or trend data relevant to this space]

### Sources
- [URL] — [one line on what it contributed]
```

## Rules

- Every number must have a source. No source = don't include the number.
- If a competitor is behind a login wall, list the name and mark as "unverified".
- If TAM data is not findable, say so explicitly — do not estimate.
- Do not explain your search process. Only return the output block.