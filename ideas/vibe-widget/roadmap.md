# Feature Roadmap — Scribble

**Date:** 2026-06-19  
**Based on:** [feasibility.md](file:///D:/my-projects/refactored-barnacle/ideas/vibe-widget/feasibility.md) and [profitability.md](file:///D:/my-projects/refactored-barnacle/ideas/vibe-widget/profitability.md)  
**Horizon:** 10 weeks to MVP, 20 weeks to v1.0

---

## Feature Inventory

| ID | Feature | Description | User story (as a ___ I want to ___ so that ___) |
|---|---|---|---|
| F-01 | Shared Canvas Sync | Real-time WebSocket sync backend for private "Vibe Rooms" (up to 5 friends). | As a user, I want my drawing strokes to sync with my close friends immediately in our private room. |
| F-02 | Home-Screen Widget Rendering | Mobile widget rendering the latest canvas coordinate vector output as a rasterized image. | As a user, I want to see my group's canvas directly on my phone's home screen widget without opening the app. |
| F-03 | Avatar Customizer & Presence | Set customized 2D avatars that display live states (Spotify playing, battery low). | As a user, I want my avatar to show my live mood/activity on the shared canvas so friends feel my ambient presence. |
| F-04 | Vector Brush Engine | Doodle drawing canvas with multiple vector brush physics (neon, glow, custom colors). | As a creative user, I want to draw with expressive brushes that look aesthetic and load quickly as coordinates. |
| F-05 | Silent Push Sync Engine | Background APNs/FCM triggers to refresh widget cache instantly when an edit is saved. | As a user, I want my widget to refresh as soon as a friend saves a new doodle. |
| F-06 | Viral Onboarding & Invite Link | Onboard friends via deep links (SMS/Snapchat/TikTok) with automatic contact book sync. | As a user, I want to invite my inner circle instantly so we can start doodling together immediately. |
| F-07 | Doodle Match (Discovery) | Complete a visual prompt (e.g., "draw a star") to match with strangers who drew similarly. | As a user, I want to match with new people based on drawing style compatibility so I can find friends naturally. |
| F-08 | Community Tapestries | Public community whiteboards for interest groups (fandoms, gaming, art) with tile rendering. | As a fan, I want to add small doodles to a massive collaborative K-pop canvas and see it update live. |
| F-09 | Live Doodle-Duets | Glow indicator showing when friends are active, enabling live real-time split-screen canvas drawing. | As a user, I want to see when my friend is active on the canvas so we can doodle together in real time. |
| F-10 | On-Device AI Moderation | Lightweight on-device neural network (CoreML/TensorFlow) that checks drawings for NSFW content. | As a parent/user, I want inappropriate doodles to be auto-blocked before they ever reach my screen. |
| F-11 | Shared Streaks & Pet Evolution | Visual pet on the canvas that grows or gets sad depending on daily sketch consistency. | As a friend group, I want to feed our digital pet by drawing daily so we can maintain our streak. |

---

## Feature Classification

| ID | Feature | Must-have (MVP) | Nice-to-have | Future | Kill |
|---|---|---|---|---|---|
| F-01 | Shared Canvas Sync | ✅ | | | |
| F-02 | Home-Screen Widget Rendering | ✅ | | | |
| F-03 | Avatar Customizer & Presence | | ✅ | | |
| F-04 | Vector Brush Engine | ✅ | | | |
| F-05 | Silent Push Sync Engine | ✅ | | | |
| F-06 | Viral Onboarding & Invite Link | ✅ | | | |
| F-07 | Doodle Match (Discovery) | ✅ | | | |
| F-08 | Community Tapestries | | | ✅ | |
| F-09 | Live Doodle-Duets | | ✅ | | |
| F-10 | On-Device AI Moderation | ✅ | | | |
| F-11 | Shared Streaks & Pet Evolution | | ✅ | | |

**MVP features:** F-01, F-02, F-04, F-05, F-06, F-07, F-10  
**MVP rationale:**
To validate Scribble as a *social platform*, we must prove: (1) private close-friend widget doodling works (F-01, F-02, F-04, F-05, F-06), (2) users will actively engage with visual matchmaking (F-07), and (3) we can scale safety using on-device moderation (F-10). Real-time duets, community canvases, and streaks can be added post-validation.

---

## Dependency Map

```
F-06 (Viral Onboarding)
  ├── F-01 (Shared Canvas Sync)
  │     ├── F-04 (Vector Brush Engine)
  │     │     └── F-10 (On-Device AI Moderation)
  │     │           ├── F-05 (Silent Push Sync Engine) ── F-02 (Widget Rendering)
  │     │           └── F-07 (Doodle Match)
  │     └── F-09 (Live Doodle-Duets)
  └── F-08 (Community Tapestries)
```

**Blocking dependencies:**
- **F-06** blocks **F-01**: Canvases cannot sync until a user group or pairing is created.
- **F-04** blocks **F-10**: The moderation model cannot analyze drawings until the vector coordinates are converted to drawing buffers.
- **F-10** blocks **F-05** and **F-07**: Drawings cannot trigger widget pushes or match users until they pass the AI moderation check.
- **F-08** (Community Tapestries) depends on **F-10** (Moderation) to prevent public spam.

---

## Critical Path

```
[F-06: Onboarding] ──> [F-01: Canvas Sync] ──> [F-04: Brush Engine] ──> [F-10: AI Moderation] ──> [F-07: Doodle Match] ──> MVP
        6 days                8 days                 10 days                 8 days                 10 days      = 42 days
```

**Critical path length:** 42 days (~8.5 weeks of pure dev time).

---

## Rollout Phases

### Phase 0 — Safety & Widget Spike (Week 1–2)
Goal: Ensure widget update limits are handled, and train the local CoreML NSFW brush model.
- [ ] F-10: On-Device AI Moderation (Train/test Mobilenet sketch model)
- [ ] F-05: Silent Push Sync Engine
- [ ] F-02: Home-Screen Widget Rendering

### Phase 1 — Core Interaction (Week 3–6)
Goal: Complete local vector brush tracking, sync private canvas data, and establish the user contact onboarding loop.
- [ ] F-04: Vector Brush Engine (iOS Metal / Android Canvas coordinates)
- [ ] F-01: Shared Canvas Sync (Node.js WebSockets database model)
- [ ] F-06: Viral Onboarding & Invite Link (Deep-linking)

### Phase 2 — Discovery & Matchmaking (Week 7–9)
Goal: Implement Doodle Match algorithm and connect stranger widgets.
- [ ] F-07: Doodle Match (Vector stroke clustering match engine)
- [ ] Closed TestFlight/Google Play Beta launch (1,000 users)

### Phase 3 — Communities & Fandoms (Week 10+)
Goal: Launch public Community Tapestries, Live Duets, and monetization channels.
- [ ] F-08: Community Tapestries (Tile canvas partitioning)
- [ ] F-09: Live Doodle-Duets (Sync cursor pointers)
- [ ] F-03: Avatar Customizer & Presence (Avatar customization shop)

---

## Algorithm / Technical Sketches

### Vector Doodle Matchmaking Engine (F-07)

Instead of using raw pixels (bitmaps) to compare drawings, Scribble matches drawings by parsing the stroke vectors (coordinates, angles, speed) of prompt completions.

```
[User Completed Prompt] 
          │
          ▼
1. Fetch stroke coordinate sequence: S = {(x_1, y_1, t_1), (x_2, y_2, t_2), ...}
          │
          ▼
2. Downsample and normalize stroke sequence: S_norm (scale to 0-1 bounding box)
          │
          ▼
3. Compute DTW (Dynamic Time Warping) or Cosine Similarity against active prompt templates.
          │
          ▼
4. Generate Vector Embedding: V_e = [d_1, d_2, d_3, ... d_64]
          │
          ▼
5. Perform K-Nearest Neighbors (KNN) search in Pinecone/Milvus database:
   Find users who completed prompt P within threshold T.
          │
          ▼
[Match Successful! Send Notification to both users]
```

### On-Device Content Moderation Flow (F-10)

```
[Draw Canvas] ──> [Save Trigger] ──> [Render Stroke Vectors to Bitmap]
                                                    │
                                                    ▼
                                       [Load local CoreML MobileNet]
                                                    │
                                                    ▼
                                        [Score image: 0.0 to 1.0]
                                                    │
                             ┌──────────────────────┴──────────────────────┐
                             ▼ (Score >= 0.70)                             ▼ (Score < 0.70)
                      [Flag: Block Upload]                         [Allow: Sync Canvas]
                  Notify user: "Inappropriate"                     Silent APNs push to widget
```

---

## Open Questions Before Building Starts
- [ ] **On-Device Model Size:** Can we compress the CoreML sketch classifier to <15MB to ensure users don't face large app download sizes?
- [ ] **Strangers on Widget Safety:** How long should a stranger connection be active in app chat *before* they are allowed to send doodles directly to a user's widget screen?
- [ ] **Public Canvas Scaling:** How do we partition a 10,000 x 10,000 community canvas so that users only fetch visible canvas sectors/tiles?

---

## Risk Register

| Risk | Affects | Mitigation | Owner |
|---|---|---|---|
| Public Canvas Spam / Griefing | F-08 | Implement a "doodle cool-down" timer (e.g., 1 drawing stroke every 15 seconds) and allow room moderators to delete strokes. | Trust & Safety Lead |
| Model Performance on Low-End Phones | F-10 | Fall back to lightweight server-side moderation for devices older than iPhone 11 or budget Android models. | ML Engineer |
| Network Match Failures | F-07 | If user pool is small, seed the system with "AI Doodle Bots" that draw back to keep users engaged during onboarding. | Product Owner |
