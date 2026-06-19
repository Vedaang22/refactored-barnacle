# Graduation Handoff — Scribble (formerly VibeWidget)

**Graduated on:** 2026-06-20  
**From:** `ideas/vibe-widget/`  
**To:** New repo `scribble`  
**Owner:** User  
**Co-owner:** Antigravity (Agent)

---

## New Repo Setup

### Suggested repo name
`scribble`

### Suggested description (for GitHub)
A spatial, virtual room-based social platform for Gen Z to customize digital rooms, hang out in community halls, and play widgets.

### Suggested repo structure
```
/
├── README.md           # Product overview + developer environment setup
├── docs/
│   ├── architecture.md # WebSockets cluster and tile engine design
│   ├── data-model.md   # Coordinate JSON vector format models
│   ├── roadmap.md      # Copied from this repo
│   ├── feasibility.md  # Copied from this repo
│   └── profitability.md# Copied from this repo
├── src/
│   ├── client-ios/     # Native iOS application code
│   ├── client-android/ # Native Android application code
│   └── server/         # Node.js / Go WebSocket sync server code
├── tests/
│   ├── load-test/      # Simulating high concurrent drawing inputs
│   └── unit/
├── .agents/            # Copied agent custom tools/skills
│   └── skills/
├── AGENTS.md           # Build-centric agent instruction guide
└── .github/
    └── AGENTS.md       # Copied for GitHub Copilot compatibility
```

### First week checklist (copy to new repo's issues)
- [ ] Initialize repo with the structure above.
- [ ] Copy `ideas/vibe-widget/roadmap.md` → `docs/roadmap.md`.
- [ ] Set up developer environments for iOS WidgetKit and Android AppWidget.
- [ ] Create GitHub Project board with Phase 0 tasks.
- [ ] **Technical Spike**: Code a basic interactive widget prototype (Tic-Tac-Toe) on iOS & Android and test tap latencies.
- [ ] **ML Spike**: Train and test the lightweight sketch image moderation model locally.

---

## Reference Documents
All of these should be migrated to the new repo's `docs/`:
- [feasibility.md](../feasibility.md)
- [profitability.md](../profitability.md)
- [roadmap.md](../roadmap.md)
- [synthesis.md](../synthesis.md)

---

## Key Decisions Made in This Repo
1. **Pivoted to Spatial Hangouts**: Shifted from a basic private drawing widget to a complete spatial social network centered around custom pixel-art Rooms and public interest Lobbies/Halls.
2. **Interactive Widget Games**: Included asynchronous home-screen widget gaming as a core differentiator to drive daily engagement beyond drawing.
3. **On-Device Safety Checks**: Resolved the risk of offensive widget drawing updates by running a neural network classifier locally on-device, saving server-side bandwidth and protecting widgets.
4. **Vector Stroke Synchronization**: Decided to sync drawing coordinates rather than flat images to allow visual draw playbacks and keep data transmission lightweight.

---

## What Was Explicitly Ruled Out
- **Direct Text Messaging**: Replaced text with visual stamps, doodles, and synchronized Voice Scribbles to preserve the authentic, creative, low-pressure aesthetic.
- **3D VR Lobbies**: Kept environments in 2D pixel-art style to support immediate, low-barrier performance on all mobile screens and widgets.

---

## Remaining Open Questions
- [ ] **Interactive Widget Budgets**: How strictly do Apple and Google rate-limit widget intent updates per day?
- [ ] **Pinecone Vector Query Speed**: Does similarity search on 64-dimensional sketch vector arrays execute in under 200ms at scale?
- [ ] **Community Moderation Roles**: How can we introduce self-governing user wardens to flag drawings in public Halls?
