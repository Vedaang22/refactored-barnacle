# Feature Roadmap — VibeWidget

**Date:** 2026-06-19  
**Based on:** [feasibility.md](file:///D:/my-projects/refactored-barnacle/ideas/vibe-widget/feasibility.md) and [profitability.md](file:///D:/my-projects/refactored-barnacle/ideas/vibe-widget/profitability.md)  
**Horizon:** 8 weeks to MVP, 16 weeks to v1.0

---

## Feature Inventory

| ID | Feature | Description | User story (as a ___ I want to ___ so that ___) |
|---|---|---|---|
| F-01 | Shared Canvas Sync | Real-time backend synchronizing canvas state among a group of users. | As a user, I want my doodle strokes to sync with my friends' canvases so we can sketch together. |
| F-02 | Canvas Widget Rendering | Native iOS/Android home-screen widgets rendering the latest canvas snapshot. | As a user, I want to see my group's shared canvas directly on my home screen widget without opening the app. |
| F-03 | Avatar Customizer (Bitmojis) | Setting and configuring a 2D avatar that can be placed on the canvas. | As a user, I want to customize a personal avatar so that I can represent my presence on our shared widget. |
| F-04 | Doodle Sketching Canvas | Canvas with basic tools: brush, color picker, eraser, and undo. | As a creative user, I want to use standard drawing tools to sketch doodles easily. |
| F-05 | Silent Push Sync Engine | APNs/FCM silent notification trigger to force widget refresh when canvas updates. | As a user, I want the widget on my screen to refresh as soon as a friend saves a new doodle. |
| F-06 | Friend Invite & Group Link | Invite up to 5 friends via a deep link (SMS/WhatsApp) to form a shared canvas group. | As a user, I want to quickly invite my close friends so that we can immediately start doodling together. |
| F-07 | Canvas History Archive | Gallery displaying historical snapshots of the shared canvas. | As a user, I want to browse past drawings we made so we can reminisce about our funny doodles. |
| F-08 | In-App Text Backchannel | A simple text chat pane alongside the canvas for discussing drawings. | As a user, I want to type messages to my friends within the app so we don't have to leave to chat. |
| F-09 | Premium Cosmetics Store | In-app purchases for exclusive brush packs, canvas frames, and avatar accessories. | As an active user, I want to purchase custom stickers and items to express myself uniquely. |
| F-10 | Instant Emoji Reactions | Placing rapid stamp reactions (like fire, heart, skull) onto the widget. | As a busy user, I want to stamp a quick emoji on my friend's drawing to show my reaction instantly. |
| F-11 | Daily Prompts & Streaks | Daily prompts ("Draw a cat!") and streak counters to incentivize daily opens. | As a user, I want to see daily ideas for what to draw so I never run out of inspiration and keep our streak alive. |

---

## Feature Classification

| ID | Feature | Must-have (MVP) | Nice-to-have | Future | Kill |
|---|---|---|---|---|---|
| F-01 | Shared Canvas Sync | ✅ | | | |
| F-02 | Canvas Widget Rendering | ✅ | | | |
| F-03 | Avatar Customizer | | ✅ | | |
| F-04 | Doodle Sketching Canvas | ✅ | | | |
| F-05 | Silent Push Sync Engine | ✅ | | | |
| F-06 | Friend Invite & Group Link | ✅ | | | |
| F-07 | Canvas History Archive | | | ✅ | |
| F-08 | In-App Text Backchannel | | | ✅ | |
| F-09 | Premium Cosmetics Store | | | ✅ | |
| F-10 | Instant Emoji Reactions | | ✅ | | |
| F-11 | Daily Prompts & Streaks | | ✅ | | |

**MVP features:** F-01, F-02, F-04, F-05, F-06  
**MVP rationale:**
The MVP must validate if a close-friend group (F-06) will actively download the app, doodle (F-04), sync the strokes to a shared database (F-01), and enjoy seeing the results update on their home-screen widgets (F-02, F-05). Avatars, chats, and monetization features are secondary and do not validate the core hypothesis of home-screen widget social engagement.

---

## Dependency Map

```
F-06 (Friend Invite & Group Link)
  └── F-01 (Shared Canvas Sync)
        └── F-04 (Doodle Sketching Canvas)
              └── F-05 (Silent Push Sync Engine)
                    └── F-02 (Canvas Widget Rendering)
                          ├── F-03 (Avatar Customizer)
                          ├── F-10 (Instant Emoji Reactions)
                          └── F-11 (Daily Prompts & Streaks)
```

**Blocking dependencies:**
- **F-06** blocks **F-01**: A shared database canvas sync cannot occur until a group of 2-5 users is established and linked.
- **F-01** blocks **F-04**: Drawing tools cannot write to the canvas until the database structure for synced strokes is defined.
- **F-04** blocks **F-05**: We cannot test push notifications for widget updates until drawings can be finalized and saved.
- **F-05** blocks **F-02**: Widget updates on home screen depend entirely on silent pushes successfully triggering native system widget refreshes.

**External dependencies:**
- **Apple Push Notification service (APNs) & Firebase Cloud Messaging (FCM)** → Risk: Apple/Google throttling silent notifications will cause widget updates to lag or fail, rendering the widget static.

---

## Critical Path

The shortest sequence of features that gets us to a shippable MVP:

```
[F-06: Group Link] → [F-01: Sync Backend] → [F-04: Drawing Canvas] → [F-05: Push Sync] → [F-02: Widget Render] → MVP
      5 days               7 days                   8 days                 5 days               7 days         = 32 days
```

**Critical path length:** ~6.5 weeks (excluding app store review and QA testing).  
**Float:** F-03, F-10, and F-11 are non-critical features and can slide without delaying the core MVP launch.

---

## Rollout Phases

### Phase 0 — Technical Spike (Week 1–2)
Goal: Validate that iOS WidgetKit and Android AppWidgets will successfully update their backgrounds upon receiving a silent push notification without performance penalties.
- [ ] F-05: Silent Push Sync Engine (Mock push triggers)
- [ ] F-02: Canvas Widget Rendering (Mock image display from silent pushes)

### Phase 1 — Core App Development (Week 3–5)
Goal: Build a working mobile app where friends can join a group, draw, and save sketches to a synced database.
- [ ] F-06: Friend Invite & Group Link (Deep linking and group setup)
- [ ] F-04: Doodle Sketching Canvas (Canvas engine on mobile)
- [ ] F-01: Shared Canvas Sync (WebSocket sync API)

### Phase 2 — MVP Integration (Week 6–8)
Goal: Tie the app canvas, push server, and widget view together. Deploy to TestFlight/Google Play Closed Beta.
- [ ] Integration of F-01, F-05, and F-02.
- [ ] Basic NSFW content filtering (on-device image analyzer spike).

### Phase 3 — Growth & Monetization (Week 9+)
Goal: Launch v1.0 globally, add retention prompts, and open custom cosmetics monetization.
- [ ] F-03: Avatar Customizer (Bitmojis integration)
- [ ] F-11: Daily Prompts & Streaks (Daily notification prompts)
- [ ] F-09: Premium Cosmetics Store

---

## Algorithm / Technical Sketches

### Asynchronous Widget Push-Refresh Flow

To prevent OS battery limits from throttling the widget, VibeWidget will utilize a high-efficiency background update loop:

```
[Friend Device]                 [VibeWidget Server]               [User Device]
       │                                 │                              │
1. Saves Doodle ────────────────────────>│                              │
       │                                 │ 2. Compress and save image   │
       │                                 │ 3. Send APNs/FCM Silent Push │
       │                                 │─────────────────────────────>│
       │                                 │                              │ 4. Wake up background task
       │                                 │                              │ 5. Download optimized image
       │                                 │                              │ 6. Request Widget Refresh
       │                                 │                              │ 7. Widget renders updated canvas
```

**Silent Push Handler Algorithm (Client-Side):**
```
Receive RemoteNotification (UserInfo)
  1. Extract payload: canvas_id, timestamp, asset_url
  2. Read local cache: if timestamp <= local_cache.timestamp, exit (ignore stale updates)
  3. Fetch image from asset_url (CDN cached)
  4. Compress image and save to Shared App Group container (so Widget can access it)
  5. Call WidgetCenter.shared.reloadAllTimelines() to force redraw
  6. Return BackgroundFetchResult.newData
```

---

## Open Questions Before Building Starts
- [ ] **APNs Delivery Rate:** Does Apple enforce strict daily limits on silent push notifications (APNs priority 5) for social widget apps, and how does noteit bypass this?
- [ ] **Moderation Engine:** How much latency does an on-device TensorFlow/CoreML NSFW check add to the canvas finalization flow?
- [ ] **Vector vs. Raster Canvas:** Should we sync canvas strokes as JSON coordinate vectors (lighter weight, allows animating drawing playback) or flattened PNG images (easier to render on widgets)?

---

## Risk Register

| Risk | Affects | Mitigation | Owner |
|---|---|---|---|
| OS Widget Throttling | F-02, F-05 | Implement a local client queue and queue widget updates so they reload at most once every 5 minutes. | Lead iOS Engineer |
| High Server CDN Costs | F-01 | Convert all canvas drawings to lightweight vector SVG paths rather than streaming PNG files. | Backend Engineer |
| Apple App Store Rejection | F-02 | Ensure the main app provides high utility (full canvas, drawing history, chats) so it is not marked as a "minimal widget companion". | Product Owner |
