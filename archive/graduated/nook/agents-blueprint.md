# Agents & Skills Blueprint — Nook

**For repo:** `nook`
**Generated:** 2026-06-20
**Based on:** vision.md + roadmap.md

> This document defines the agent infrastructure for the build repo.
> It is the input used to generate `bootstrap.sh`. If you change this
> document, regenerate the bootstrap script.

---

## AGENTS.md for the Build Repo

The build repo's AGENTS.md is tuned for shipping, not exploring.
Key differences from the idea repo:
- Agents write code, not documents
- Skills are scoped to specific parts of the codebase
- Subagents are used for parallelising build tasks, not analysis tasks

```markdown
# AGENTS.md — Nook

## What this repo is
Nook is a lightweight, mobile-first spatial social network that gives Gen Z a cozy, pressure-free digital space to co-exist, customize virtual rooms, and interact asynchronously directly from their mobile home screens. The codebase contains native iOS (Swift, WidgetKit) and Android (Kotlin, Jetpack Compose) client applications, alongside a TypeScript Node.js WebSocket sync backend.

## Codebase layout
- `src/client-ios/` — Native iOS client application code (Swift, WidgetKit, Metal-based canvas)
- `src/client-android/` — Native Android client application code (Kotlin, AppWidgets, Jetpack Compose)
- `src/server/` — Node.js WebSocket server code (TypeScript, ws/Socket.io, Redis, PostgreSQL)
- `tests/unit/` — Unit tests for clients and backend engines
- `tests/load-test/` — Load testing scripts for WebSocket client traffic and server buffers
- `docs/` — Product vision, roadmap, architecture specs, data models, and ADRs
- `.agents/skills/` — Task-oriented development guides and workspace skills

## How to run locally
1. **Prerequisites**: Install Node.js (v18+), PostgreSQL, Redis, Xcode (for iOS), and Android Studio (for Android).
2. **Backend Setup**:
   ```bash
   cd src/server
   npm install
   cp .env.example .env # Fill with local DB and Redis credentials
   npm run migrate      # Run database schema migrations
   npm run dev          # Start the WebSocket development server
   ```
3. **iOS Setup**:
   - Open `src/client-ios/` in Xcode.
   - Configure a shared App Group for Widget Extension shared data containers.
   - Build and run the app on an iOS 17+ Simulator/Device.
4. **Android Setup**:
   - Open `src/client-android/` in Android Studio.
   - Sync Gradle files.
   - Run the application on an Android API 33+ Emulator/Device.

## Agent behaviour
- Write tests alongside code, not after. All updates must have unit/integration tests.
- Never modify files outside the designated task scope.
- Commit format: `[scope] short description` e.g. `[ios-widget] add interactive Tic-Tac-Toe intent`
- Always update the relevant documentation in `docs/` when changing architecture or API payloads.

## Code conventions
- **iOS**: Swift 5.9+, SwiftUI for app UI, WidgetKit/AppIntents for widget actions, Metal API for canvas graphics.
- **Android**: Kotlin, Jetpack Compose for UI, Jetpack Glance for widgets, coroutines for concurrency.
- **Backend**: TypeScript, Node.js (ESModules), async/await, strictly-typed schemas, Postgres (Prisma ORM), Redis for cache.
- **Shared Data**: Canvas vectors must follow the coordinate JSON stroke model: `{x: float, y: float, t: number, p: boolean}`.

## What agents must NOT do
- Do not build high-speed direct text chats (use doodles, haptic knobs, or asynchronous audio-draw vectors instead).
- Do not run dynamic sprite compositing inside the widget extensions (composite to shared containers within main app background threads instead).
- Do not perform database updates without writing a Prisma migration script in `src/server/prisma/migrations/`.
- Do not compute streak state inside widget extensions — widgets must read from local cache written by the main app.
- Do not regenerate Trading Card PNGs on every request — cache invalidation triggers only on avatar or Room save events.
```

---

## Skills for the Build Repo

For each skill below, the agent should create the file at
`.agents/skills/[name]/[name].md` in the new repo.

### Core Skills (always scaffold these)

#### `dev-setup`
**Purpose:** Gets any contributor — human or agent — from zero to running in one pass. Documents env vars, dependencies, seed data, and common errors.
**Triggers:** "set up dev environment", "onboard", "getting started", new contributor joining the repo.
**Scope:** README.md, .env.example, package.json, Xcode project settings, gradle scripts.

#### `code-review`
**Purpose:** Reviews code for correctness, consistency with conventions, missing tests, and scope creep. Does not rewrite — annotates and explains.
**Triggers:** "review this", "check my code", "PR review", "does this look right"
**Scope:** Any changed file in iOS, Android, or server modules.

#### `debug`
**Purpose:** Systematic diagnosis of errors — reads logs, traces the call stack, identifies root cause, proposes fix with explanation.
**Triggers:** "this is broken", "getting an error", paste of error output, "why is X not working"
**Scope:** Error logs, backend traces, mobile crash logs.

#### `write-tests`
**Purpose:** Writes unit and integration tests for a given module or function. Covers happy path, edge cases, and error states. Uses the project's test framework.
**Triggers:** "write tests for", "test coverage", "add tests", "test this function"
**Scope:** Source files + test directory.

---

### Product-Specific Skills

#### `room-builder`
**Purpose:** Manages the spatial layout editor. Operates on the 2D grid, placement coordinates, asset layering (Z-index), and orientation (rotation) models. Handles room ambient status (weather vibe-casting) and lofi background soundscapes.
**Triggers:** "edit room layout", "place furniture", "rotate item", "room soundscape setup", "vibe-casting synchronization"
**Scope:** `src/client-ios/Room/`, `src/client-android/room/`, `src/server/models/room.ts`, `docs/data-model.md`
**Key context:** Room layouts are stored as compact JSON structures representing coordinates and states. Verify overlapping bounds client-side before sending state. Keep network transmission delta-only.

#### `nookie-customizer`
**Purpose:** Manages the modular character avatar customizer UI and sprite rendering. Generates composite avatar PNGs in background threads to stay within memory limits.
**Triggers:** "style avatar", "wear clothing item", "avatar spritesheet compiler", "dynamic layers Swift", "accessory dressing assets"
**Scope:** `src/client-ios/AvatarComposite/`, `src/client-android/AvatarComposite/`, `src/server/assets/avatar/`
**Key context:** The Widget Extension has a hard memory cap of 30MB. Runtime overlays of multiple layers will crash the widget. Avatars must be pre-composited into a single flat PNG inside the app's Shared Group Container, allowing widgets to read and display a single cached file.

#### `widget-interaction`
**Purpose:** Manages interactive widget logic, such as Tic-Tac-Toe games, Widget Duet canvases, Nook Pet feed loops, and Vibe-Knock triggers. Also renders Nook Streaks counter and Mood Capsule emoji stamp on home screen widgets.
**Triggers:** "widget click handler", "interactive widget game move", "AppIntent sync", "widget duet update", "vibe-knock push notify", "streak widget render", "mood capsule widget display"
**Scope:** `src/client-ios/NookWidgets/`, `src/client-android/widgets/`, `src/server/controllers/widget.ts`
**Key context:** Widget interactivity is heavily throttled by mobile operating systems. Use local caches to update the widget UI instantaneously on-screen, then dispatch a background network thread to sync the game or haptic state to the server. Streak count is read from local cache written by the main app — never computed inside the widget extension. Mood Capsule emoji is read from local store written by the silent push handler, not fetched over network at render time.

#### `community-halls`
**Purpose:** Manages thematic public lounge interfaces, room card list updates, and real-time multiplayer Walking Nookie coordinates using WebSocket endpoints. Also owns Hall Campfire async audio ember upload/stream/expire flow and Room of the Week weekly voting and winner reward pipeline.
**Triggers:** "community hall room card", "websocket lobby sync", "walking avatar coordinate sync", "lounge socket controller", "campfire audio ember", "room of the week vote", "hall voting reset"
**Scope:** `src/server/sockets/`, `src/client-ios/Lobby/`, `src/client-android/lobby/`
**Key context:** Public lounges use Socket.io/ws. Real-time character movements must utilize Redis pub/sub buffers to group broadcast commands and limit execution to 10 frame updates per second to protect mobile battery/CPUs. Hall Campfire embers are stored as compressed AAC on CDN and expire after 24h via server TTL; audio content must be screened by an on-device audio classifier before upload — no server audio moderation. Room of the Week voting resets every Monday at 00:00 UTC; winning Room receives a server-generated IAP token for exclusive furniture; upvote is once-per-user-per-week enforced in Postgres.

#### `content-moderation`
**Purpose:** Manages local on-device neural network classifiers (CoreML on iOS, TensorFlow Lite on Android) for real-time sketching guardrails. Also screens Hall Campfire audio clips before upload.
**Triggers:** "doodle check AI", "local sketch classification model", "moderation guardrail", "nsfw stroke filter", "audio ember screen"
**Scope:** `src/client-ios/Moderation/`, `src/client-android/moderation/`
**Key context:** All drawings and blackboard guest entries must run through on-device models to prevent bad content updates from reaching widgets. Screening must run under 100ms completely client-side before queuing save operations. Hall Campfire audio clips must also be screened on-device before upload to CDN.

#### `retention-engine`
**Purpose:** Manages Nook Streaks (F-17) consecutive-day widget interaction counter between friend pairs, and Mood Capsule (F-20) once-daily emoji mood stamp delivered to close friends via silent push.
**Triggers:** "streak counter", "friend streak", "mood capsule", "daily emoji stamp", "streak reset", "pet sad state", "streak TTL", "mood expiry job"
**Scope:** `src/client-ios/RetentionEngine/`, `src/client-android/retention/`, `src/server/services/streaks.ts`, `src/server/jobs/mood-capsule-expiry.ts`
**Key context:** Streak TTL is 25h in Redis (not 24h) — the extra hour gives grace to late-night users whose streak would otherwise break at midnight. Any widget action (duet move, pet feed, game move, vibe-knock) resets the streak timer. Breaking the streak triggers a visual sad state on the Nook Pet. Never compute streak state inside the widget extension — the main app writes streak count to local cache; the widget reads it. Mood Capsule removal is a scheduled cron job on the server, not a client-side timer — the job fires every hour and deletes capsules whose created_at is older than 24h, then sends a silent push to remove the stamp from recipients' widgets. Mood Capsule requires no reply, no text, and no interaction from recipients.

#### `virality-tools`
**Purpose:** Manages the Pixel Photo Booth (F-22) in-app camera and on-device pixel-art render pipeline, and Nookie Trading Cards (F-19) collectible card generation, CDN hosting, and Room wall-art pinning.
**Triggers:** "photo booth", "pixelate selfie", "Metal shader selfie", "share to Instagram Stories", "share to TikTok", "trading card", "collectible card", "pin card in room", "card shelf"
**Scope:** `src/client-ios/PhotoBooth/`, `src/client-android/photobooth/`, `src/server/assets/trading-cards/`
**Key context:** Photo Booth render pipeline is fully on-device (Metal fragment shader on iOS / RenderScript on Android) — there is no server round-trip for image processing. The selfie is pixelated to Nookie sprite scale, the Nookie sprite is composited as an overlay, and the current Room background is composited as the bottom layer — all in-memory, exported as JPEG for the OS share sheet with an embedded `nook.me/[username]` deep-link overlay. Trading Card PNG (512×512) is generated server-side from a snapshot of the user's current Nookie avatar + Room state and cached on CDN. Never regenerate a Trading Card on every request — cache invalidation triggers only on avatar save events or Room save events. Friends pin Trading Cards as special furniture items inside their Room; a dedicated card shelf in the Room displays the collection.

#### `haptic-engine`
**Purpose:** Manages Secret Knock Code (F-23) — the per-friendship unique rhythmic haptic pattern — and extends the existing Vibe-Knocks infrastructure so every Vibe-Knock pulses in the friendship-specific pattern.
**Triggers:** "secret knock", "knock pattern", "haptic handshake", "friendship vibration pattern", "tap to record pattern", "CoreHaptics", "VibrationEffect waveform"
**Scope:** `src/client-ios/HapticEngine/`, `src/client-android/haptics/`, `src/server/models/friendship.ts`
**Key context:** The knock pattern is stored as `knock_pattern: number[]` on the Friendship join table in Postgres. The array contains alternating vibrate/pause durations in milliseconds (e.g. `[100, 50, 200, 50, 100]`). Maximum 10 elements and 2000ms total duration — enforce both limits server-side and client-side to prevent abuse. iOS uses `CoreHaptics` `CHHapticEngine` with a custom `CHHapticPattern` built from the array. Android uses `VibrationEffect.createWaveform(timings, amplitudes, -1)`. Friends co-edit the pattern via a simple tap-to-record UI that records on/off intervals. Vibe-Knocks always pulse in the friendship-specific pattern — default to a generic pattern `[100, 50, 100]` if no custom pattern is set yet.

---

## Subagents for the Build Repo

### `parallel-builder`
**Purpose:** When multiple independent features need to be built simultaneously, this orchestrator fans them out into subagents with isolated contexts.
**When to spawn:** Tasks affecting different parts of the codebase with no shared file dependencies (e.g., iOS UI edits vs. Backend DB schema updates).
**When NOT to spawn:** Any task touching shared files (shared models, socket handlers, database configurations).

### `mobile-client-specialist`
**Purpose:** Handles platform-specific UI rendering, Widget Extension configuration, haptic vibration engines, and local AI model integration.
**Context it carries:** Interactive AppIntents (iOS), Jetpack Compose Glance (Android), iOS App Group directory constraints, and on-device machine learning packages.
**Triggers:** "configure WidgetKit AppGroup", "build Compose widget", "Metal API drawings", "configure Android AppWidget provider"

### `websocket-sync-specialist`
**Purpose:** Manages real-time state broadcast systems, Redis lock managers, and Postgres write-buffers for coordinate arrays.
**Context it carries:** Node.js WebSockets scalability, Redis client configuration, concurrency collision handling, and load test scripts.
**Triggers:** "optimize WebSocket server", "configure socket redis cluster", "load test socket connections", "prevent coordinate out-of-order errors"

---

## Architecture Decisions to Document

Before the first line of code, the agent should create these files in `docs/`:

| File | Contents | Source |
|---|---|---|
| `docs/architecture.md` | System design, component diagram, key trade-offs | roadmap.md algorithms section |
| `docs/data-model.md` | Schema, entity relationships, indexing decisions | roadmap.md + feasibility.md |
| `docs/api.md` | Endpoint spec (even if internal) | roadmap.md feature inventory |
| `docs/vision.md` | Migrated from idea repo | vision.md |
| `docs/roadmap.md` | Migrated from idea repo | roadmap.md |
| `docs/decisions/001-spatial-social-pivot.md` | Architecture Decision Record: Pivoting from basic private drawing widget to a complete spatial social network centered around custom pixel-art Rooms and public interest lobbies. | graduation-handoff.md decisions section |
| `docs/decisions/002-async-widget-cache.md` | Architecture Decision Record: Bypassing iOS/Android WidgetKit background reload limits via client-side caching and asynchronous background sync. | graduation-handoff.md decisions section |
| `docs/decisions/003-on-device-moderation.md` | Architecture Decision Record: Resolving the risk of offensive widget drawing updates by running a local on-device neural network classifier. | graduation-handoff.md decisions section |
| `docs/decisions/004-vector-stroke-sync.md` | Architecture Decision Record: Using compact coordinate stroke JSON payloads (`{x, y, t}`) rather than rasterized PNG files to optimize bandwidth and support playbacks. | graduation-handoff.md decisions section |
| `docs/decisions/005-pre-composited-sprites.md` | Architecture Decision Record: Pre-rendering avatar layers into flat PNG files via main app background tasks to avoid the 30MB widget RAM limitation. | graduation-handoff.md decisions section |
| `docs/decisions/006-retention-loop-design.md` | Architecture Decision Record: Adding Nook Streaks + Mood Capsule as explicit variable-reward retention mechanics at MVP. Streak TTL = 25h Redis key; mood capsule = server-scheduled cron expiry. | feasibility refresh — D7 collapse risk |
| `docs/decisions/007-hall-campfire-async-audio.md` | Architecture Decision Record: Using async audio embers (24h TTL) instead of live audio rooms to solve the Community Hall low-concurrency empty-feeling problem. Embers stream directly from CDN. | community halls concurrency analysis |
| `docs/decisions/008-pixel-art-validation-gate.md` | Architecture Decision Record: Pixel art aesthetic must be validated via paid split-test ad before asset catalog production begins. Split-test: pixel vs. Bitmoji 3D vs. Zepeto anime, budget ₹1500 Instagram/TikTok. | assumption challenger output |
| `docs/decisions/009-on-device-photo-booth.md` | Architecture Decision Record: Pixel Photo Booth render pipeline is fully on-device (Metal/RenderScript), no server processing. Metal fragment shader pixelates selfie; Nookie sprite and Room background composited in-memory. | privacy + latency analysis |
