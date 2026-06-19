# Graduation Handoff — Nook

**Graduated on:** 2026-06-20
**Pipeline rerun + re-graduation:** 2026-06-20
**From:** `ideas/nook/`
**To:** New repo `nook`
**Owner:** User
**Co-owner:** Claude (Agent)

---

## New Repo Setup

### Suggested repo name
`nook`

### Suggested description (for GitHub)
A virtual room-based spatial social network for Gen Z featuring customizable pixel-art rooms, personalized pixel avatars ("Nookies"), interactive widget pets, and haptic widget communication.

### Suggested repo structure
```
/
├── README.md
├── docs/
│   ├── architecture.md
│   ├── data-model.md
│   ├── api.md
│   ├── roadmap.md
│   ├── feasibility.md
│   ├── profitability.md
│   ├── vision.md
│   └── decisions/
│       ├── 001-spatial-social-pivot.md
│       ├── 002-async-widget-cache.md
│       ├── 003-on-device-moderation.md
│       ├── 004-vector-stroke-sync.md
│       ├── 005-pre-composited-sprites.md
│       ├── 006-retention-loop-design.md
│       ├── 007-hall-campfire-async-audio.md
│       ├── 008-pixel-art-validation-gate.md
│       └── 009-on-device-photo-booth.md
├── src/
│   ├── client-ios/
│   │   ├── Room/
│   │   ├── AvatarComposite/
│   │   ├── NookWidgets/
│   │   ├── Lobby/
│   │   ├── Moderation/
│   │   ├── RetentionEngine/
│   │   ├── PhotoBooth/
│   │   └── HapticEngine/
│   ├── client-android/
│   │   ├── room/
│   │   ├── AvatarComposite/
│   │   ├── widgets/
│   │   ├── lobby/
│   │   ├── moderation/
│   │   ├── retention/
│   │   ├── photobooth/
│   │   └── haptics/
│   └── server/
│       ├── models/
│       ├── controllers/
│       ├── sockets/
│       ├── services/
│       ├── jobs/
│       ├── assets/trading-cards/
│       └── prisma/migrations/
├── tests/
│   ├── unit/
│   └── load-test/
├── .agents/skills/
├── AGENTS.md
└── .github/AGENTS.md
```

### First week checklist (copy to new repo's issues)
- [ ] Initialize repo with the structure above (`bash bootstrap.sh` or `.\bootstrap.ps1` on Windows).
- [ ] Copy `archive/graduated/nook/roadmap.md` → `docs/roadmap.md`.
- [ ] Set up developer environments for iOS WidgetKit and Android AppWidget.
- [ ] Create GitHub Project board with Phase 0 tasks.
- [ ] **Pixel Art Aesthetic Split-Test**: Run ₹1500 Instagram/TikTok ad split-test — pixel vs. Bitmoji 3D vs. Zepeto anime — targeting 16–24 year olds. Do this before commissioning any asset catalog.
- [ ] **Trust-and-Safety Legal Consult**: 1-hour paid consultation (₹4000–₹8000) on minimum COPPA 2025 + IT Act 2021 moderation obligations for a 13+ platform. Do this before writing any moderation code.
- [ ] **Widget Latency Spike**: Build interactive Tic-Tac-Toe widget on iOS 18 (AppIntent) + Android (PendingIntent). Measure tap-to-visual-update latency. Kill signal: > 1.5s on any supported OS.
- [ ] **Widget Memory Spike**: Build prototype iOS Widget Extension overlaying 5–8 transparent PNG layers. Monitor peak memory against ~30MB cap.
- [ ] **Hall Concurrency Experiment**: Create 5 interest-based Discord servers (50 recruited Gen Z users each). Measure % concurrently online during peak hours over 2 weeks. Kill signal: < 5% concurrent presence → rethink Hall as async-first.

---

## Reference Documents
All of these should be migrated to the new repo's `docs/`:
- [feasibility.md](feasibility.md) — refreshed 2026-06-20 with new market data
- [profitability.md](profitability.md) — refreshed 2026-06-20 with real benchmarks
- [roadmap.md](roadmap.md) — updated with F-16 through F-23
- [vision.md](vision.md) — updated with all 8 new features
- [synthesis.md](synthesis.md)

---

## Key Decisions Made in This Repo

1. **Pivoted to Spatial Hangouts**: Shifted from a basic private drawing widget to a complete spatial social network centered around custom pixel-art Rooms and public interest Halls. Core bet: Gen Z wants a *place* to hang out, not more content to consume.

2. **Interactive Widget Games & Duets**: Included asynchronous home-screen widget gaming and drawing (Widget Duets) as core differentiators to drive daily home-screen engagement.

3. **On-Device Safety Checks**: Resolved the risk of offensive widget drawing updates by running a neural network classifier locally on-device (CoreML / TensorFlow Lite), saving server bandwidth and protecting widgets.

4. **Vector Stroke Synchronization**: Sync drawing coordinates (`{x, y, t, p}`) rather than rasterized PNGs to enable visual draw playbacks and keep data transmission lightweight.

5. **Pre-Composited Sprite Sheets**: Pre-composite Nookie avatar layers into a flat PNG in a main app background task (shared container) to avoid the strict ~30MB widget RAM limit. Widget extension reads one flat PNG — never composites layers at runtime.

6. **Added Retention Loop at MVP**: Ambient-only design (rooms, widgets, knocks) has no variable-reward pull-back trigger. Feasibility refresh identified D7 collapse as the highest-probability kill risk. Decision: ship Nook Streaks (F-17) and Mood Capsule (F-20) at MVP alongside the core spatial features. Streaks TTL = 25h Redis key (1h grace window for late-night users). Mood Capsule expiry = server-side cron job, not client-side timer.

7. **Hall Campfire for Concurrency**: Community Halls feel empty (ghost-town failure) when concurrent presence is low, which is guaranteed at sub-100K DAU. Decision: add Hall Campfire (F-18) — async 24h audio embers scattered around Halls — so the Hall always feels populated through accumulated async content even with zero concurrent users present.

8. **Pixel Art Validation Gate Before Asset Production**: Assumption challenger flagged that Gen Z's 18–24 monetizable cohort may skew toward 3D/Y2K aesthetics over 8-bit pixel art. Decision: Phase 0 must include a ₹1500 split-test ad validating art direction before any pixel artist is commissioned. If pixel art loses the split-test, art direction is rethought before a single asset is produced.

9. **Pixel Photo Booth On-Device Render**: Photo Booth render pipeline is fully on-device (Metal fragment shader on iOS / RenderScript on Android) with no server round-trip. Reason: selfie processing server-side adds latency, cost, and privacy surface area. Nookie sprite is composited over pixelated selfie and Room background entirely in-memory, exported as JPEG for the iOS/Android share sheet.

10. **COPPA 2025 Compliance as Fixed Cost**: COPPA 2025 amendments (effective April 22, 2026) raise the bar on parental consent, biometric classification, and mixed-audience standards for 13+ platforms. Decision: budget trust-and-safety legal retainer (~₹50K/month) and moderation infrastructure (~₹50K/month) as fixed costs from month 1, not as a future line item. On-device ML alone does not satisfy legal obligations — mandatory legal consult before any public beta.

---

## What Was Explicitly Ruled Out

- **Direct Text Messaging**: Replaced with visual stamps, doodles, Vibe-Knocks, and asynchronous Voice Nooks to preserve the low-pressure aesthetic and avoid becoming another chat app.
- **3D VR Lobbies**: Kept environments in 2D pixel-art to support instant, low-battery performance on all mobile devices and home screen widgets. Rec Room's June 2026 shutdown validated this choice.
- **In-App Custom Asset Creator**: Room assets and avatar outfits are pre-designed templates to ensure visual consistency, prevent performance lags from arbitrary user uploads, and make content moderation tractable.
- **Algorithmic Feed**: Discovery is spatial (Rooms, Halls) not feed-based. Explicitly ruled out to differentiate from TikTok/Instagram and reduce the anxiety the platform is designed to relieve.
- **Real-Time Video/Audio Rooms**: Nook is ambient and asynchronous. Live voice/video would turn it into a Zoom-like product and break the low-pressure design principle.
- **Visible Like/Follower Counts**: Social competition metrics (likes, views, follower numbers) are ruled out permanently — they contradict the cozy, low-pressure positioning and drive the comparison anxiety Nook is built to escape.

---

## Remaining Open Questions

*(These become the new repo's first GitHub Issues)*

- [ ] **Interactive Widget Budget**: How strictly do Apple (iOS WidgetKit) and Google (Android AppWidgets) rate-limit AppIntent timeline reloads per hour? Does the rate limit affect Nook Streaks real-time counter updates? [Blocks: F-06, F-17]
- [ ] **Pixel Art Aesthetic Validation**: Will the 18–24 cohort choose pixel-art over 3D/anime in the Phase 0 split-test? If not, what art direction shift is needed before asset production? [Blocks: entire asset catalog]
- [ ] **Legal Moderation Floor**: What is the exact minimum moderation infrastructure required under COPPA 2025 + IT Act 2021 for a 13+ platform? Does on-device ML need server-side backup (PhotoDNA hash matching)? [Blocks: F-08, any public beta]
- [ ] **Hall Concurrent Presence Threshold**: Will Community Halls feel populated enough at < 100K DAU to be worth building as spatial environments? Or should discovery be rethought as async-first from the start? [Blocks: F-03, F-16, F-18 architecture decisions]
- [ ] **Streak Grace Window**: Does a 25h Redis TTL (1h grace for late-night users) meaningfully reduce streak-break churn vs. 24h, or does it feel arbitrary and erode the mechanic's urgency? Needs A/B test post-launch. [Blocks: F-17 final implementation]
- [ ] **Dynamic Sprite Animatable States**: How do we optimize background generation of animatable Nookie states (idle, sleeping, waving) across the 30MB widget memory cap without bloating shared App Group storage? [Blocks: F-11, F-12]
- [ ] **Community Moderation Roles**: Do we need user-selected "Hall Wardens" to manually sweep public Rooms and flag Hall Campfire audio embers, or can automated screening + community reporting suffice at MVP scale? [Blocks: F-03, F-18]
- [ ] **Trading Card Cache Invalidation**: When should a Nookie Trading Card PNG be regenerated — on every avatar save, or only on explicit "regenerate card" user action? Aggressive invalidation = high CDN costs; lazy invalidation = stale cards. [Blocks: F-19]
