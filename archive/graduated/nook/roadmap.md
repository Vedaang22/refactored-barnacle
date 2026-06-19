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

**MVP features:** F-01, F-02, F-03, F-06, F-08, F-10  
**MVP rationale:**
The MVP must validate the spatial social platform core: (1) users want to build rooms (F-01) and share them (F-10), (2) friends will interact via widgets with games (F-06) and Guest Blackboards (F-02), and (3) users can discover rooms via Community Halls (F-03) safely (F-08). Voice Nooks and Jukeboxes are post-validation retention features.

---

## Dependency Map

```
F-10 (Profile Link Sharing)
  ├── F-01 (Spatial Room Builder)
  │     ├── F-02 (Guest Blackboard) ── F-08 (AI Moderation)
  │     └── F-06 (Widget Games)
  └── F-03 (Community Halls)
        ├── F-04 (Ambient Vibe-Casting)
        ├── F-05 (Spotify Jukebox)
        └── F-07 (Voice Nooks)
```

**Blocking dependencies:**
- **F-10** blocks **F-01**: Room layouts cannot be shared or linked until the profile sharing backend exists.
- **F-01** blocks **F-02** & **F-06**: Whiteboards and widget games cannot be placed in a room until the spatial room layout engine is functional.
- **F-02** blocks **F-08**: The moderation model cannot screen guest drawings until the Guest Blackboard canvas is built.
- **F-03** blocks F-04, F-05, and F-07: Fandom assets require community hub structures to exist.

---

## Critical Path

```
[F-10: Link Sharing] ──> [F-01: Room Builder] ──> [F-02: Guest Board] ──> [F-08: AI Moderation] ──> [F-06: Widget Games] ──> MVP
        6 days                  12 days                  8 days                  8 days                  10 days       = 44 days
```

**Critical path length:** 44 days (~9 weeks of pure dev time).

---

## Rollout Phases

### Phase 0 — Widget & Interaction Spike (Week 1–3)
Goal: Prove interactive widget games work on iOS/Android, and train the local CoreML sketch filter.
- [ ] F-06: Widget Games (Build an interactive Tic-Tac-Toe widget prototype)
- [ ] F-08: On-Device AI Moderation (Train sketch classification weights)

### Phase 1 — Spatial Editor (Week 4–7)
Goal: Complete the 2D room builder grid engine and deep-linking share system.
- [ ] F-01: Spatial Room Builder (Grid coordinate layout and asset layers)
- [ ] F-10: Profile Link Sharing (TikTok/Instagram rich previews)

### Phase 2 — Social Integration (Week 8–10)
Goal: Launch Guest Blackboards, Community Halls, and closed beta.
- [ ] F-02: Guest Blackboard Widget
- [ ] F-03: Community Halls (Lounges for showcasing rooms)
- [ ] Closed TestFlight/Google Play beta (1,000 active users)

### Phase 3 — Fandom & Ambient Additions (Week 11+)
Goal: Launch v1.0 globally, add ambient castings, Spotify integration, and cosmetics.
- [ ] F-05: Spotify Jukebox Widget
- [ ] F-04: Ambient Vibe-Casting (Local weather sync)
- [ ] F-07: Voice Nooks

---

## Algorithm / Technical Sketches

### Interactive Widget Game Action Intent (F-06)

To handle instant widget button taps (e.g. placing an 'X' in Tic-Tac-Toe) without visual lag:

```
[User taps grid button on home screen widget]
                   │
                   ▼
1. Trigger AppIntent / PendingIntent (passing cell_id, match_id)
                   │
                   ▼
2. Read Local Widget State File (JSON cache)
                   │
                   ▼
3. Instantly write updated state locally: Match.board[cell_id] = 'X'
                   │
                   ▼
4. Call WidgetCenter.shared.reloadTimelines() (re-draws widget instantly from local cache)
                   │
                   ▼
5. Spin up background queue task to sync board state to DB server via HTTP POST
```

---

## Open Questions Before Building Starts
- [ ] **Interactive Widget Budget:** Does iOS limit the number of `AppIntent` timeline reloads per hour for interactive widgets?
- [ ] **Asset Scaling:** How do we optimize rendering for custom pixel-art assets to prevent device overheating during editing?
- [ ] **Community Moderation:** Do we require user-selected "Hall Wardens" (moderators) to manually sweep public rooms?

---

## Risk Register

| Risk | Affects | Mitigation | Owner |
|---|---|---|---|
| Widget Latency | F-06 | Fall back to opening the app on tap if OS background intents throttle drawing. | Lead iOS Engineer |
| Storage Overrun | F-01 | Restrict custom item uploads to standard template catalog items in v1. | Backend Engineer |
| Abuse on Whiteboards | F-02 | Allow room owners to wipe their blackboard instantly or set whiteboard permissions to "Friends Only." | Product Owner |
