# Feature Roadmap — Nook

**Date:** 2026-06-20  
**Based on:** [feasibility.md](file:///D:/my-projects/refactored-barnacle/ideas/vibe-widget/feasibility.md) and [profitability.md](file:///D:/my-projects/refactored-barnacle/ideas/vibe-widget/profitability.md)  
**Horizon:** 12 weeks to MVP, 24 weeks to v1.0

---

## Feature Inventory

| ID | Feature | Description | User story (as a ___ I want to ___ so that ___) |
|---|---|---|---|
| F-01 | Spatial Room Builder | A 2D pixel-art grid editor to place, rotate, and layer furniture items on a user profile Room. | As a user, I want to customize my room with furniture so it expresses my personal style. |
| F-02 | Guest Blackboard Widget | An interactive blackboard in a user's Room where visitors can doodle and sign messages. | As a visitor, I want to leave a doodle on my friend's room Blackboard so they know I visited. |
| F-03 | Community Halls | Public thematic lobbies (e.g. Anime Lounge, Music Hall) displaying submitted user room cards. | As a user, I want to explore themed Halls to find cool rooms and make new friends. |
| F-04 | Ambient Vibe-Casting | Sync and render real-time phone states (local weather effects, battery charging state) in the Room. | As a user, I want my Room environment to sync with my actual weather so my friends feel co-present. |
| F-05 | Spotify Jukebox Widget | Interactive object linking Spotify SDK to display current tracks and play 10s song snippets. | As a visitor, I want to tap my friend's Jukebox to listen to their current favorite song. |
| F-06 | Widget Games | Asynchronous micro-games (Tic-Tac-Toe, Pet Feed) played directly on the home-screen widget. | As a user, I want to take my turn in Tic-Tac-Toe directly from my home screen widget. |
| F-07 | Voice Nooks | Draw visual doodles that record and playback synchronized audio when tapped. | As a user, I want to draw a Voice Nook so my friends see the drawing build as they hear my voice message. |
| F-08 | On-Device AI Moderation | Local mobile classifier that scans sketches on Guest Blackboards before saving. | As a user, I want drawings to be filtered for NSFW content so my Blackboard widget stays safe. |
| F-09 | Live Room Duets | Live presence indicators (glowing doors) showing when a friend is active in your Room. | As a user, I want to see when a friend is visiting my room so we can hang out together. |
| F-10 | Profile Link Sharing | Custom deep-links (e.g. `nook.me/user`) that render high-fidelity previews when shared. | As a user, I want to share a beautiful link of my Room on TikTok to invite new followers. |
| F-11 | Nookies Customizer | Modular 2D pixel-art character builder supporting clothes, hair, accessories, and emotes. | As a user, I want to style my Nookie avatar so it reflects my personal fashion and identity. |
| F-12 | Nook Pets | Interactive virtual widget pets requiring feeding/petting and displaying emotional reactions. | As a pet owner, I want to care for my Nook Pet on my widget so it stays happy and grows. |
| F-13 | Vibe-Knocks | Widget button triggering rhythmic haptic phone vibrations and sliding dynamic sticky doodles to a friend. | As a user, I want to knock on my friend's screen so they feel my physical vibration ping. |
| F-14 | Room Soundscapes | Background audio engine playing ambient loops (rain, lofi guitar) when a Room is viewed. | As a user, I want to set a lofi rain soundscape in my room so visitors feel relaxed. |
| F-15 | Widget Duets | Asynchronous drawing canvases shared on close friends' home screen widgets. | As a user, I want to draw with my friend on a shared widget so we can co-doodle asynchronously. |

---

## Feature Classification

| ID | Feature | Must-have (MVP) | Nice-to-have | Future | Kill |
|---|---|---|---|---|---|
| F-01 | Spatial Room Builder | ✅ | | | |
| F-02 | Guest Blackboard Widget | ✅ | | | |
| F-03 | Community Halls | ✅ | | | |
| F-04 | Ambient Vibe-Casting | | ✅ | | |
| F-05 | Spotify Jukebox Widget | | ✅ | | |
| F-06 | Widget Games | ✅ | | | |
| F-07 | Voice Nooks | | ✅ | | |
| F-08 | On-Device AI Moderation | ✅ | | | |
| F-09 | Live Room Duets | | ✅ | | |
| F-10 | Profile Link Sharing | ✅ | | | |
| F-11 | Nookies Customizer | ✅ | | | |
| F-12 | Nook Pets | | ✅ | | |
| F-13 | Vibe-Knocks | | ✅ | | |
| F-14 | Room Soundscapes | | ✅ | | |
| F-15 | Widget Duets | ✅ | | | |

**MVP features:** F-01, F-02, F-03, F-06, F-08, F-10, F-11, F-15  
**MVP rationale:**
The MVP must validate the spatial, social, and avatar-driven home screen core: (1) users want to build rooms (F-01), style their Nookie avatars (F-11), and share them (F-10), (2) friends can co-doodle on home-screen Widget Duets (F-15) and play asynchronous games (F-06), and (3) users can wander as Nookies through public Community Halls (F-03) safely (F-08). Voice Nooks, Soundscapes, and Knocks are post-validation retention features.

---

## Dependency Map

```
F-10 (Profile Link Sharing)
  ├── F-01 (Spatial Room Builder) ── F-14 (Soundscapes)
  │     ├── F-02 (Guest Blackboard) ── F-08 (AI Moderation) ── F-15 (Widget Duets)
  │     └── F-06 (Widget Games) ────┐
  └── F-11 (Nookies Customizer) ─────┼── F-12 (Nook Pets)
        ├── F-03 (Community Halls)  └── F-13 (Vibe-Knocks)
        │     ├── F-04 (Ambient Vibe-Casting)
        │     ├── F-05 (Spotify Jukebox)
        │     └── F-07 (Voice Nooks)
```

**Blocking dependencies:**
- **F-10** blocks **F-01** and **F-11**: Profiles and links must exist before rooms and characters can be saved/shared.
- **F-01** blocks **F-02**, **F-06**, and **F-14**: Whiteboards, widget games, and room soundscapes require the spatial builder to lay them out.
- **F-11** blocks **F-03** and **F-12**: Avatars are required to populate public lounges and to unlock the interactive widget companion system.
- **F-02** & **F-08** block **F-15**: Widget Duets require drawing canvas mechanics and AI sketch filters.
- **F-06** blocks **F-12** & **F-13**: Interactive widget intents are required for widget pet care and rhythmic knock buttons.

**External dependencies:**
- Apple APNs / Firebase Cloud Messaging (FCM) → Critical for pushing real-time Vibe-Knocks and Widget Duet turns.
- Apple Music / Spotify API SDK → Critical for F-05 Jukebox synchronization.

---

## Critical Path

The shortest sequence of features that gets us to a shippable MVP:

```
[F-10: Link Sharing] ──> [F-11: Nookies] ──> [F-01: Room Builder] ──> [F-02: Guest Board] ──> [F-15: Widget Duets] ──> MVP
        6 days                 10 days              12 days                 8 days                  8 days         = 44 days
```

**Critical path length:** 44 days (~9 weeks of pure dev time).

---

## Rollout Phases

### Phase 0 — Widget & Customizer Spike (Week 1–3)
Goal: Prove widget interactive limits, test dynamic layered rendering memory footprints, and train CoreML sketch filter.
- [ ] F-06: Widget Games (Build an interactive Tic-Tac-Toe widget prototype)
- [ ] F-08: On-Device AI Moderation (Train sketch classification weights)
- [ ] F-11: Nookies Layering Spike (Headless Swift dynamic compositing memory check against 30MB limit)

### Phase 1 — Spatial Editor & Identity (Week 4–7)
Goal: Complete 2D room builder grid engine, modular pixel avatar customizer, and deep-linking share system.
- [ ] F-01: Spatial Room Builder (Grid coordinate layout and asset layers)
- [ ] F-10: Profile Link Sharing (TikTok/Instagram rich previews)
- [ ] F-11: Nookies Customizer (UI clothes dressing/hair selector)

### Phase 2 — Social & Co-op (Week 8–10)
Goal: Launch Guest boards, Community Halls, Widget Duets, and closed beta.
- [ ] F-02: Guest Blackboard Widget
- [ ] F-15: Widget Duets (Home-screen async doodle canvas)
- [ ] F-03: Community Halls (Lounges showcasing rooms with walking Nookies)
- [ ] Closed Testflight beta (1,000 active users)

### Phase 3 — Pets, Knocks, & Atmosphere (Week 11+)
Goal: Global release, add widget pets, vibe-knocks, weather cast, and soundscapes.
- [ ] F-12: Nook Pets (Widget companion loops)
- [ ] F-13: Vibe-Knocks (Haptic rhythm pings)
- [ ] F-14: Room Soundscapes (Lofi audio mixers)
- [ ] F-04: Ambient Vibe-Casting (Local weather sync)
- [ ] F-05: Spotify Jukebox Widget
- [ ] F-07: Voice Nooks

---

## Algorithm / Technical Sketches

### Dynamic Layered Sprite Caching for Widgets (F-11)
To prevent out-of-memory (OOM) failures inside iOS WidgetKit and Android AppWidget limits, modular avatar sprites are cached as flat PNGs before rendering on home screen widgets:

```
[Nookie Avatar Customization saved in App]
                    │
                    ▼
1. App compiles layer IDs (body_12, hair_04, shirt_99, hat_03)
                    │
                    ▼
2. App runs Headless Render Task in background (e.g. Core Graphics layer merge)
                    │
                    ▼
3. Output compiled flat PNG image and write to App Group shared container: 'shared/avatar_user1.png'
                    │
                    ▼
4. Call WidgetCenter.shared.reloadTimelines()
                    │
                    ▼
5. Widget Extension reads flat PNG directly from local storage and displays in image view (RAM < 2MB, no OOM)
```

---

## Open Questions Before Building Starts
- [ ] **Interactive Widget Budget:** Does iOS limit the number of `AppIntent` timeline reloads per hour for interactive widgets?
- [ ] **Dynamic Sprite States:** How do we optimize the dynamic sprite sheet generation for animatable character states (e.g. idle, sleeping, waving) without blowing up background storage?
- [ ] **Android RemoteViews limit:** Does Android's RemoteViews support caching custom drawings in AppWidgetProvider without triggering binder transaction limit errors?

---

## Risk Register

| Risk | Affects | Mitigation | Owner |
|---|---|---|---|
| Widget Latency | F-06 | Fall back to opening the app on tap if OS background intents throttle drawing. | Lead iOS Engineer |
| Widget OOM Crashes | F-11, F-12 | Pre-render and cache composited transparent PNGs in the main app's shared container instead of runtime layering inside the widget. | Lead Mobile Architect |
| Storage Overrun | F-01 | Restrict custom item uploads to standard template catalog items in v1. | Backend Engineer |
| Abuse on Whiteboards | F-02, F-15 | Allow room owners to wipe their blackboard instantly or set whiteboard permissions to "Friends Only." | Product Owner |
| Haptic/Ping Spam | F-13 | Impose rate-limiting on Knocks (e.g. max 3 Knocks/friend/hour) and allow users to mute knocks globally or per-friend. | Lead Backend |
