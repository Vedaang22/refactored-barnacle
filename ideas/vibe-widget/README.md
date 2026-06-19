# Scribble

**Stage:** Seed  
**Created:** 2026-06-20  
**Owner(s):** User  
**One-liner:** A virtual room-based social network for Gen Z to customize digital rooms, hang out in community halls, and connect through interactive widgets.

---

## Problem
Gen Z is disconnected by flat scrolling feeds and lonely chat groups. They crave spatial "hangout" environments that replicate physical spaces (like customized bedrooms or neighborhood lounges), but existing virtual world platforms (like Roblox or Rec Room) are too heavy, gaming-focused, and lack native integration with mobile operating systems (widgets).

## Solution
**Scribble** is a lightweight, spatial social network. Every user gets a customizable **Virtual Room** (an interactive 2D room profile with pixel-art furniture, posters, and interactive widgets). Users explore the network by entering public **Community Halls** (fandom lounges, gaming spaces, art rooms) where they can "hang" their custom canvases. Communication is ambient and visual, utilizing "Vibe-Casting" (synced weather/battery states), "Voice Scribbles," and "Widget Games" played directly on the home screen.

## Target User
- **Primary:** Gen Z teens and young adults (aged 13–24) who love aesthetic customization, avatar styling, and low-pressure online hangout spots.
- **Secondary:** Independent digital artists, custom theme designers, and online fandom communities.

## Key Assumptions
1. Gen Z is willing to invest time customizing a digital space (Room) as a primary form of self-expression.
2. Home-screen widgets are viable channels for playing asynchronous micro-games and sharing ambient status updates.
3. Interest-based "Community Halls" will drive natural user discovery and reduce app install friction.
4. Scale limits on real-time canvas synchronizations can be managed via server-side spatial tiling.

## Initial Scope (MVP)
A mobile application with widgets supporting:
1. **The Room (Profile):** A pixel-art canvas room where users can arrange interactive furniture (e.g., a guest whiteboard, a music jukebox linking Spotify).
2. **Community Halls:** Themed lobbies (e.g., Anime, Gaming, Chill Lounge) where users can post their canvases and doodle collectively.
3. **Voice Scribbles:** Drawings that record and play back synced audio messages when tapped.
4. **Widget Games:** Asynchronous micro-games (like Tic-Tac-Toe or Pet Feed) played directly on the home-screen widget.

## Out of Scope (v1)
- 3D environments or VR support (strictly 2D pixel-art/vector spaces).
- High-fidelity voice chats (strictly asynchronous audio voice-scribbles and chat streams).
- Complex asset creators (all room furniture assets are pre-designed templates).

## Open Questions
- [ ] How do we prevent inappropriate imagery on public Hall canvases and guest whiteboards in real time?
- [ ] What data structures are most efficient for syncing room furniture layout states (JSON coordinates vs server-side canvas renders)?
- [ ] Can widgets support interactive tap handling for games on iOS (iOS 17+ WidgetKit interactive buttons)?

## Related Ideas
*None yet*

## Notes
- Drawing inspiration from Club Penguin, Habbo Hotel, Noplace, and iOS 17 interactive widgets.
- Expanding beyond basic drawing to focus on digital co-presence and spatial hanging out.
