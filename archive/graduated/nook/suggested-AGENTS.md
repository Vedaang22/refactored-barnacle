# AGENTS.md — Nook Build Repo

## Purpose
This repository contains the production code for the Nook spatial social platform. Agents working in this codebase focus on writing optimized mobile clients and highly scalable WebSocket sync servers.

## Codebase Stack
- **iOS Client**: Swift, WidgetKit, Metal API (for canvas drawings)
- **Android Client**: Kotlin, AppWidgets, Jetpack Compose
- **Backend Sync Server**: Node.js, WebSockets (ws/socket.io), Redis (real-time canvas buffers), PostgreSQL (persistent layouts)

## Agent Guidelines

### Technical Constraints
1. **Bandwidth Optimization**: Drawings must be synced and stored as vector stroke arrays (`{x, y, t}`) rather than rasterized images to conserve server memory and widget payload weights.
2. **On-Device Safety**: Ensure the CoreML (iOS) and TensorFlow Lite (Android) sketch classifiers run locally before enabling upload routines.
3. **Widget Performance**: All home screen widget updates must be triggered asynchronously using silent push notifications with client-side caching.

### Quality and Testing
- All backend endpoints must have corresponding integration tests under `/tests/`.
- Document all coordinate formats inside `/docs/data-model.md`.
- Mobile client code must run through build validation before submission.

### Committing
Format commits semantically:
- `feat(ios/widget): implement interactive tic-tac-toe AppIntent`
- `fix(server): resolve canvas update WebSocket timestamp out-of-order bug`
- `perf(ios/canvas): optimize Metal render loop memory allocations`
