param(
    [string]$TargetDir = ""
)

$RepoName = "nook"
$IdeaDir = $PSScriptRoot

if ($TargetDir -eq "") {
    $TargetDir = Join-Path (Get-Item $PSScriptRoot).Parent.Parent.FullName $RepoName
} else {
    # Resolve relative paths relative to current location
    if (-not [System.IO.Path]::IsPathRooted($TargetDir)) {
        $TargetDir = Join-Path (Get-Location).Path $TargetDir
    }
}

# Clean up path formatting
$TargetDir = [System.IO.Path]::GetFullPath($TargetDir)

Write-Output ""
Write-Output "🚀 Bootstrapping $RepoName into $TargetDir"
Write-Output ""

# ── 1. Create folder structure ───────────────────────────────
$Dirs = @(
    "src/client-ios/Room", "src/client-ios/AvatarComposite", "src/client-ios/NookWidgets", "src/client-ios/Lobby", "src/client-ios/Moderation",
    "src/client-android/room", "src/client-android/AvatarComposite", "src/client-android/widgets", "src/client-android/lobby", "src/client-android/moderation",
    "src/server/controllers", "src/server/models", "src/server/sockets", "src/server/prisma", "src/server/assets",
    "tests/unit", "tests/load-test",
    "docs/decisions",
    ".agents/skills",
    ".github"
)

foreach ($Dir in $Dirs) {
    $FullPath = Join-Path $TargetDir $Dir
    if (-not (Test-Path $FullPath)) {
        New-Item -ItemType Directory -Force -Path $FullPath | Out-Null
    }
}

Write-Output "✓ Folder structure created"

# Helper function to write UTF-8 files
function Write-FileContent($RelativePath, $Content) {
    $FullPath = Join-Path $TargetDir $RelativePath
    $ParentDir = Split-Path $FullPath
    if (-not (Test-Path $ParentDir)) {
        New-Item -ItemType Directory -Force -Path $ParentDir | Out-Null
    }
    [System.IO.File]::WriteAllText($FullPath, $Content, [System.Text.Encoding]::UTF8)
}

# ── 2. Write AGENTS.md ───────────────────────────────────────
$AgentsContent = @'
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
- Do not build high-speed direct text chats (use doodles, haptic knocks, or asynchronous audio-draw vectors instead).
- Do not run dynamic sprite compositing inside the widget extensions (composite to shared containers within main app background threads instead).
- Do not perform database updates without writing a Prisma migration script in `src/server/prisma/migrations/`.
'@

Write-FileContent "AGENTS.md" $AgentsContent
Write-FileContent ".github/AGENTS.md" $AgentsContent
Write-Output "✓ AGENTS.md written"

# ── 3. Scaffold skills ───────────────────────────────────────

# dev-setup
Write-FileContent ".agents/skills/dev-setup/dev-setup.md" @'
---
name: dev-setup
description: >
  Gets any contributor from zero to running. Documents env vars,
  dependencies, seed data, and common setup errors.
---
# Dev Setup

This skill guides you through getting the iOS, Android, and Server development environments running locally.

## Prerequisite Software
- Node.js (v18+) & npm
- PostgreSQL (v14+)
- Redis
- Xcode 15+ (for iOS development)
- Android Studio Hedgehog+ (for Android development)

## Backend Launch Steps
1. Navigate to `/src/server/`.
2. Install npm packages: `npm install`.
3. Create `.env` from `.env.example` and populate database credentials.
4. Run migrations: `npm run migrate`.
5. Run dev script: `npm run dev`.

## Local Testing
- Execute tests using `npm run test`.
'@

# code-review
Write-FileContent ".agents/skills/code-review/code-review.md" @'
---
name: code-review
description: >
  Reviews code for correctness, consistency with conventions,
  missing tests, and scope creep. Does not rewrite — annotates and explains.
---
# Code Review

This skill assesses code submissions to maintain the technical standards of the Nook repository.

## Review Checklist
1. **Conventions**: Swift style rules, Kotlin naming guides, and TypeScript ESModule imports.
2. **Widget Safety**: No heavy rendering inside widget classes; confirm layers are composited asynchronously.
3. **Bandwidth Optimization**: Canvas coordinates synced as stroke vectors, never flat images.
4. **Test Coverage**: Validate that changed files have corresponding unit or integration test assertions.
5. **No Scope Creep**: Keep changes tightly aligned with the specific active issue or feature.
'@

# debug
Write-FileContent ".agents/skills/debug/debug.md" @'
---
name: debug
description: >
  Systematic diagnosis of errors — reads logs, traces the call
  stack, identifies root cause, proposes fix with explanation.
---
# Debugging Guide

This skill handles resolving crashes, layout errors, sync issues, and haptic failures.

## Steps for Debugging
1. **Collect Logs**: Obtain server logs, client crash records, or WebSocket console logs.
2. **Reproduce**: Map the issue to a failing unit test or a repeatable integration step.
3. **Trace**: Find the file boundaries (e.g. client app, socket boundary, Redis cache, Postgres).
4. **Resolve**: Propose the change clearly and update tests to verify it will not regress.
'@

# write-tests
Write-FileContent ".agents/skills/write-tests/write-tests.md" @'
---
name: write-tests
description: >
  Writes unit and integration tests for a given module or function.
  Covers happy path, edge cases, and error states.
---
# Write Tests

This skill adds test coverage for the clients and sync backend.

## Coverage Mandates
- **Backend APIs**: Use Jest to test REST endpoints and socket sync timelines.
- **Data Models**: Ensure validations check for invalid JSON coordinate shapes.
- **Edge cases**: Verify out-of-order websocket coordinate frames are sorted or discarded safely.
'@

# room-builder
Write-FileContent ".agents/skills/room-builder/room-builder.md" @'
---
name: room-builder
description: >
  Manages the spatial layout editor. Operates on the 2D grid, placement
  coordinates, asset layering (Z-index), and orientation (rotation) models.
  Handles room ambient status (weather vibe-casting) and lofi background soundscapes.
---
# Spatial Room Builder

This skill handles placing, rotating, and layering pixel-art furniture inside rooms, as well as ambient and soundscape effects.

## Layout Coordinates
Room assets are stored as a JSON layout file mapping:
```json
{
  "item_id": "vinyl_player_01",
  "x": 4,
  "y": 6,
  "z_index": 2,
  "rotation": 90
}
```

## Vibe-Casting & Soundscapes
- Retrieve local weather states asynchronously and map them to visual room overlay states (e.g., rain vectors, snow assets).
- Play soundscapes through an optimized low-level audio engine that mixes loops client-side.
'@

# nookie-customizer
Write-FileContent ".agents/skills/nookie-customizer/nookie-customizer.md" @'
---
name: nookie-customizer
description: >
  Manages the modular character avatar customizer UI and sprite rendering.
  Generates composite avatar PNGs in background threads to stay within memory limits.
---
# Nookie Customizer

This skill builds and composites Nookie avatar assets.

## Layer Composite Constraint
1. Avatar configuration is saved in SQLite as layer IDs (skin, hair, shirt, pants, accessory).
2. To prevent memory issues in WidgetKit (max 30MB limit), do **NOT** layer PNG assets dynamically in the widget extension.
3. Instead, composite them to a flat transparent PNG using Swift's Core Graphics (iOS) or Android's Canvas APIs in the main app lifecycle.
4. Save the compiled PNG inside the shared App Group directory. The widget reads the single image directly.
'@

# widget-interaction
Write-FileContent ".agents/skills/widget-interaction/widget-interaction.md" @'
---
name: widget-interaction
description: >
  Manages interactive widget logic, such as Tic-Tac-Toe games, Widget Duet
  canvases, Nook Pet feed loops, and Vibe-Knock triggers.
---
# Widget Interaction

This skill handles WidgetKit configurations on iOS and AppWidget providers on Android.

## Interactivity Optimization
1. Widgets must update immediately to clicks. Read and render states from the local cache.
2. Queue network sync actions as background requests to update remote server states asynchronously.
3. Rate-limit active push notifications and haptic pings (Vibe-Knocks) to a maximum of 3 notifications/friend/hour to respect battery budgets.
'@

# community-halls
Write-FileContent ".agents/skills/community-halls/community-halls.md" @'
---
name: community-halls
description: >
  Manages thematic public lounge interfaces, room card list updates, and
  real-time multiplayer Walking Nookie coordinates using WebSocket endpoints.
---
# Community Halls

This skill handles multiplayer lobbies, socket rooms, and walking character state syncs.

## Concurrency Performance
- Use Socket.io channels separated by lounge topic.
- Buffer real-time movements via Redis pub/sub.
- Broadcast states to clients at a capped rate of 10 FPS to prevent cellular throttling and mobile heat generation.
'@

# content-moderation
Write-FileContent ".agents/skills/content-moderation/content-moderation.md" @'
---
name: content-moderation
description: >
  Manages local on-device neural network classifiers (CoreML on iOS,
  TensorFlow Lite on Android) for real-time sketching guardrails.
---
# Content Moderation

This skill handles checking user-submitted whiteboard drawings and widget duets.

## On-Device Classifier
- Drawings must be evaluated locally before dispatching to the sync server.
- Utilize quantized mobile models (CoreML or TensorFlow Lite) to run classification in under 100ms.
- Flagged sketches must trigger a local UI block warning without sending contents to public databases.
'@

Write-Output "✓ Skills scaffolded"

# ── 4. Copy graduation documents ─────────────────────────────
Copy-Item (Join-Path $IdeaDir "vision.md")            (Join-Path $TargetDir "docs/vision.md") -Force
Copy-Item (Join-Path $IdeaDir "roadmap.md")           (Join-Path $TargetDir "docs/roadmap.md") -Force
Copy-Item (Join-Path $IdeaDir "feasibility.md")       (Join-Path $TargetDir "docs/feasibility.md") -Force
Copy-Item (Join-Path $IdeaDir "profitability.md")     (Join-Path $TargetDir "docs/profitability.md") -Force
Copy-Item (Join-Path $IdeaDir "agents-blueprint.md")  (Join-Path $TargetDir "docs/agents-blueprint.md") -Force
if (Test-Path (Join-Path $IdeaDir "synthesis.md")) {
    Copy-Item (Join-Path $IdeaDir "synthesis.md")     (Join-Path $TargetDir "docs/synthesis.md") -Force
}
Write-Output "✓ Graduation documents copied to docs/"

# ── 5. Write ADR files ───────────────────────────────────────

# ADR 001
Write-FileContent "docs/decisions/001-spatial-social-pivot.md" @'
# ADR 001 — Spatial Social Pivot

**Date:** 2026-06-20  
**Status:** Accepted  

## Context
The initial concept (VibeWidget) was scoped as a private home-screen drawing utility between friends. However, utility widgets have low long-term user retention, low monetization ceilings, and high user churn. 

## Decision
We pivoted to a complete spatial social network called Nook. Instead of static feeds or list-based bios, every user has an interactive 2D pixel-art room. Users can dress a modular 2D pixel character ("Nookie") and browse public themed Community Halls (Anime Lounges, Music Lobbies) to meet others and share their rooms.

## Rationale
1. **Retention**: Customizing digital spaces and characters drives high emotional investment, making switching costs high.
2. **Discovery**: Navigating virtual spaces creates ambient, low-pressure discovery compared to exhausting algorithmic feeds.
3. **Monetization**: Digital furniture, avatar outfits, and lounge billboard sponsorships offer high-margin revenue potential.

## Consequences
- Requires full WebSocket-based spatial coordinates server.
- Demands continuous production of high-quality, lightweight 2D pixel asset catalogs.
- Expands target platform footprint, requiring robust client implementations on both iOS and Android.
'@

# ADR 002
Write-FileContent "docs/decisions/002-async-widget-cache.md" @'
# ADR 002 — Asynchronous Widget Caching

**Date:** 2026-06-20  
**Status:** Accepted  

## Context
Interactive iOS WidgetKit and Android AppWidget taps trigger asynchronous updates. If actions rely on synchronous network responses, OS timeline reload rates will trigger rendering delays, lagging up to 2 seconds and making widget gameplay or drawing feel slow and broken.

## Decision
Maintain all active widget states (Tic-Tac-Toe cells, Pet feeding levels, blackboard paths) in a local SQL/JSON cache in the shared App Group directory. When clicked, instantly render update changes directly from the cache, then schedule background sync jobs to update the backend database.

## Rationale
Ensures responsiveness stays under 150ms regardless of active cellular connectivity, preventing OS-level widget background task kills and network timeouts.

## Consequences
- Requires conflict resolution logic if game actions are done offline or out-of-order.
- Requires setup of native mobile background tasks and local DB triggers on widgets.
'@

# ADR 003
Write-FileContent "docs/decisions/003-on-device-moderation.md" @'
# ADR 003 — On-Device Safety Checks

**Date:** 2026-06-20  
**Status:** Accepted  

## Context
Nook enables users to draw blackboard sketches and share Widget Duets on friends' home screens. Allowing unfiltered inputs risks leaking NSFW content to home widgets, violating Apple and Google App Store safety guidelines.

## Decision
Implement a local on-device neural network classifier using CoreML (iOS) and TensorFlow Lite (Android). All drawings must run through the model locally before save actions complete.

## Rationale
1. **Compliance**: Guarantees zero latency moderation without server roundtrips, allowing immediate blocking.
2. **Privacy**: Drawings are classified locally; clean vectors are uploaded while flagged entries are deleted instantly.
3. **Cost**: Bypasses costly cloud visual recognition APIs.

## Consequences
- Classifier model weight updates must be bundled inside client application updates.
- Drawing inputs must be flattened client-side for classification.
'@

# ADR 004
Write-FileContent "docs/decisions/004-vector-stroke-sync.md" @'
# ADR 004 — Vector Stroke Synchronization

**Date:** 2026-06-20  
**Status:** Accepted  

## Context
Rendering blackboard sketches or duets as rasterized image uploads (PNG/JPEG) consumes substantial client upload bandwidth and server storage capacity. It also prevents interactive animations like step-by-step vector playbacks.

## Decision
Synchronize drawings as JSON coordinate arrays: `[{x: float, y: float, t: number, p: boolean}]`.

## Rationale
1. **Size**: An average doodle vector size is under 20KB, compared to a 300KB rasterized image file.
2. **Playback**: Replays drawing animations by drawing strokes progressively based on timestamp `t`.
3. **Storage**: Vector points fit inside PostgreSQL/Redis databases easily, reducing layout lookup time.

## Consequences
- Mobile clients must implement high-performance vector canvas engines using Metal (iOS) and Canvas/Compose (Android).
- Stroke arrays must be validated for max array lengths to prevent payload injection attempts.
'@

# ADR 005
Write-FileContent "docs/decisions/005-pre-composited-sprites.md" @'
# ADR 005 — Pre-Composited Sprite Sheets

**Date:** 2026-06-20  
**Status:** Accepted  

## Context
Apple iOS Widget Extensions enforce a strict 30MB RAM cap. Rendering layered pixel-art transparent sprites (body + hair + shirt + pants + accessory + pet) dynamically in real-time inside the widget process frequently triggers Out-Of-Memory (OOM) extension crashes.

## Decision
Composite the modular character outfits into flat transparent PNG files inside the main app's lifecycle or a background task. Write the compiled PNG to the Shared App Group directory.

## Rationale
The widget extension reads and displays a single pre-rendered PNG from local disk storage, keeping peak RAM execution under 2MB.

## Consequences
- Outfit changes are not instantaneous on-screen if the main app has not compiled the spritesheet.
- Demands file sync queues between the main app workspace and widget bundle folders.
'@

Write-Output "✓ Architecture decision records written"

# ── 6. Write README.md ───────────────────────────────────────
Write-FileContent "README.md" @'
# Nook

A virtual room-based spatial social network for Gen Z featuring customizable pixel-art rooms, personalized pixel avatars ("Nookies"), interactive widget pets, and haptic widget communication.

## Codebase Structure
- `src/client-ios/` — Native Swift iOS client (WidgetKit, SwiftUI, Metal)
- `src/client-android/` — Native Kotlin Android client (Glance, Compose)
- `src/server/` — TypeScript Node.js sync server (WebSockets, Redis, Prisma)
- `docs/` — Product designs, specifications, and architecture decisions

## Dev Setup
Please see the onboarding document:
- [Dev Setup](.agents/skills/dev-setup/dev-setup.md)

Or open this folder in the Antigravity CLI and type:
`set up the dev environment`

## Architecture Documents
- [Vision](docs/vision.md) — Product requirements and goals
- [Roadmap](docs/roadmap.md) — Sprints and feature classification
- [Feasibility](docs/feasibility.md) — Technical risks and mitigations
- [Architecture Decisions](docs/decisions/) — ADR catalog

## Contributing
Commit format must follow semver scopes:
`[ios]`, `[android]`, `[server]`, `[docs]`, `[test]`.
'@
Write-Output "✓ README.md written"

# ── 7. Write .env.example ────────────────────────────────────
Write-FileContent ".env.example" @'
# Nook — Environment Variables
# Copy to .env and fill in values. Never commit .env.

# Server Configuration
PORT=8080
NODE_ENV=development

# Core Databases
DATABASE_URL="postgresql://postgres:password@localhost:5400/nook?schema=public"
REDIS_URL="redis://localhost:6379"

# Security
JWT_SECRET="generate-a-secure-secret-token"

# External APIs
SPOTIFY_CLIENT_ID="your-spotify-client-id"
SPOTIFY_CLIENT_SECRET="your-spotify-client-secret"

# Vector Moderation Database (Pinecone)
PINECONE_API_KEY="your-pinecone-api-key"
PINECONE_ENVIRONMENT="your-pinecone-environment-region"

# Notification Services
APNS_KEY_ID="your-apple-push-key-id"
APNS_TEAM_ID="your-apple-developer-team-id"
FCM_SERVER_KEY="your-firebase-cloud-messaging-key"
'@
Write-Output "✓ .env.example written"

# ── 8. Git init ──────────────────────────────────────────────
$CurrentDir = Get-Location
try {
    Set-Location $TargetDir
    git init -q
    git add .
    git commit -q -m "init: bootstrap from idea-lab graduation"
    Write-Output "✓ Git initialized — initial commit made"
}
catch {
    Write-Warning "Failed to initialize Git in target directory: $_"
}
finally {
    Set-Location $CurrentDir
}

# ── Summary ──────────────────────────────────────────────────
Write-Output ""
Write-Output "════════════════════════════════════════"
Write-Output "  $RepoName is ready at $TargetDir"
Write-Output "════════════════════════════════════════"
Write-Output ""
Write-Output "Next steps:"
Write-Output "  1. cd $TargetDir"
Write-Output "  2. Create the GitHub repo and push: gh repo create $RepoName --private && git push -u origin main"
Write-Output "  3. Fill in .env from .env.example"
Write-Output "  4. Spike on the highest-risk dependency (see docs/roadmap.md — Phase 0)"
Write-Output "  5. Open in Antigravity and say: 'set up the dev environment'"
Write-Output ""
