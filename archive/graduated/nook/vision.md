# Vision — Nook

> Nook is a lightweight, widget-native spatial social network that gives Gen Z a cozy, pressure-free digital space to co-exist, customize virtual rooms, and interact asynchronously directly from their mobile home screens.

**Version:** 1.0 (set at graduation)
**Last updated:** 2026-06-20
**Owners:** User

---

## The Problem

Gen Z is experiencing unprecedented levels of loneliness and digital fatigue. Despite being constantly online, they feel disconnected by flat, scrolling algorithmic feeds and chaotic chat groups. Modern social networks encourage performative sharing, infinite scrolling, and public competition (likes, views, viral reach), which breeds comparison and social anxiety.

While platforms like Discord or WhatsApp provide spaces for direct communication, they lack spatial or physical context. Group chats feel transactional, fleeting, and flat. There is no sense of "place" where friends can simply sit together, co-exist, and hang out without the constant pressure of active conversation.

On the other hand, immersive virtual world platforms (such as Roblox, Rec Room, or Habbo Hotel) provide spatial representation, but they are heavy, gaming-centric, battery-intensive, and require dedicated, high-engagement active sessions. They do not fit into the passive, low-friction gaps of a user's day. Traditional mobile social apps also fail to utilize mobile OS integrations like interactive home screen widgets, which are perfect for quick, ambient connections.

This disconnect has triggered a massive consumer shift. Gen Z is actively gravitating toward cozy, visual digital spaces (as seen in the rise of customization utilities, anti-scroll profiles like Noplace, and shared widget tools like Locket and noteit). They crave a digital equivalent of a customized bedroom or a neighborhood lounge—a personalized, aesthetic visual hub that lets them feel close to their friends without the exhaustion of endless texting or scrolling.

---

## The Solution

Nook is a lightweight, mobile-first spatial social network built on the core mechanism of digital co-presence. Instead of a text bio or a photo feed, every user's profile is a customizable **Virtual Room**—an interactive 2D pixel-art room canvas. Users express their identity by placing, rotating, and layering furniture, posters, jukeboxes, and widgets.

Every user is represented by their **Nookie**—a customizable 2D pixel avatar. Users can customize their Nookie's clothing, hair, accessories, and emotes. The room and avatar act as the user's digital home, enabling visitors to browse their space, interact with their setup, and leave traces behind.

Communication on Nook is designed to be ambient, visual, and asynchronous. Through interactive home screen widgets, close friends can co-doodle asynchronously on shared canvases (**Widget Duets**), play quick micro-games (like Tic-Tac-Toe or Pet Feed), and receive rhythmic haptic vibrations (**Vibe-Knocks**). To meet new people, users wander as Nookies through interest-based public **Community Halls** (Anime Lounges, Gaming Lobbies, Music Hubs) where they can hang their room cards, chat, and co-decorate public canvases.

By combining low-pressure 2D room decoration with mobile-native interactive widgets, Nook establishes a cozy, slow-paced social space. It replaces algorithmic feeds and instant-text pressure with tactile, expressive visual touchpoints, making digital hanging out feel warm, passive, and persistent.

---

## Who This Is For

### Primary User
**Profile:** Gen Z teens and young adults (aged 13–24) who love aesthetic styling, pixel art, cozy games, and maintaining close, low-pressure ties with friends.
**Their goal:** To express their style, design a personal aesthetic space, and keep in touch with close friends creatively without texting fatigue.
**Their constraint:** Short attention spans, exhausted by algorithmic feeds, limited patience for heavy 3D games, and want instant home screen interactions.
**What success looks like for them:** Having a beautifully styled room and avatar that friends interact with daily on their home screen widgets.

### Secondary User
**Profile:** Independent digital artists, custom theme designers, and online fandom curators.
**Their goal:** To showcase pixel art, build custom furniture themes, and host community hangouts.
**Their constraint:** Hard to distribute and monetize interactive digital art; need platforms that value 2D spatial layouts.
**What success looks like for them:** Having their custom furniture/outfit packs featured and their themed Community Halls highly populated by fans.

### Who This Is NOT For
- **Hardcore Gamers:** Users expecting active real-time 3D multiplayer action, deep progression loops, or competitive gameplay.
- **Transactional Communicators:** Users looking for high-speed, text-heavy productivity messengers or real-time VoIP audio/video platforms.
- **Public Broadcasters:** Influencers looking for viral reach metrics, global video feeds, or standard text-based blogging directories.

---

## Features

### Core Features (MVP — must ship before anything else)

#### Spatial Room Builder (F-01)
**What it does:** A 2D pixel-art grid editor to place, rotate, and layer furniture items on a user profile Room.
**Why it's core:** The room is the central hub of self-expression and interaction; without it, there is no spatial context or place to interact.
**Expected behaviour:** The user opens the editor, selects a pixel-art asset from their catalog, places it on a grid, rotates/layers it, and saves. The updated room configuration (stored as JSON coordinates) is saved and displayed to visitors.
**Success metric:** 60%+ of registered users customize their room canvas within the first 24 hours of sign-up.

#### Nookies Customizer (F-11)
**What it does:** Modular 2D pixel-art character builder supporting clothes, hair, accessories, and emotes.
**Why it's core:** The Nookie avatar is the user's primary identity; without it, they cannot represent themselves or walk around public halls.
**Expected behaviour:** The user opens the avatar editor, selects clothes, hair, accessories, or active emotes. These layers are combined and saved. A background process compiles them into a flat PNG cache for the widget.
**Success metric:** 70%+ of users customize their Nookie avatar on day 1.

#### Guest Blackboard Widget (F-02)
**What it does:** An interactive blackboard in a user's Room where visitors can doodle and sign messages.
**Why it's core:** It provides the primary interactive guestbook experience, allowing low-friction ambient connection between users.
**Expected behaviour:** A visitor opens a friend's room, selects a chalk tool, draws or writes a message on the blackboard, and saves. The drawing is synced as vector strokes and displayed on the blackboard in the room.
**Success metric:** Average of 2+ guest blackboard doodles left per active room weekly.

#### Widget Duets (F-15)
**What it does:** Asynchronous drawing canvases shared on close friends' home screen widgets.
**Why it's core:** Drives immediate home screen interaction, allowing friends to co-doodle asynchronously.
**Expected behaviour:** A user draws on their shared widget canvas. Tapping save sends the vector doodle to their friend's widget, updating their friend's home screen.
**Success metric:** 3+ duets sent per user per week.

#### Widget Games (F-06)
**What it does:** Asynchronous micro-games (Tic-Tac-Toe, Pet Feed) played directly on the home-screen widget.
**Why it's core:** It validates the hook of home-screen widget engagement, allowing users to interact without opening the app.
**Expected behaviour:** A user sees it is their turn on their iOS/Android home screen widget, taps a grid cell directly on the widget to play a move, the widget updates instantly using local cache, and the move is synced to the server asynchronously.
**Success metric:** Daily active widget interaction rate of 4+ taps per active player.

#### Community Halls (F-03)
**What it does:** Public thematic lobbies (e.g., Anime Lounge, Music Hall) displaying submitted user room cards where users can walk around.
**Why it's core:** Provides interest-based user discovery and reduces user acquisition/navigation friction.
**Expected behaviour:** A user navigates to a thematic lounge, views a grid of room cards submitted by other users, and taps a card to enter and explore their custom room profile.
**Success metric:** 40%+ of active users discover new rooms/friends via public lobbies.

#### On-Device AI Moderation (F-08)
**What it does:** Local mobile classifier that scans sketches on Guest Blackboards and Widget Duets before saving.
**Why it's core:** Essential for App Store compliance and user safety; prevents offensive or NSFW content from being synced to other users' home screens.
**Expected behaviour:** When a doodle is drawn, the local CoreML/TensorFlow Lite model screens the vector stroke/rasterized canvas. If flagged as inappropriate, the sketch is blocked from saving, and the user receives a warning.
**Success metric:** < 0.1% rate of NSFW content successfully published to public boards, with 0ms server latency overhead for screening.

#### Profile Link Sharing (F-10)
**What it does:** Custom deep-links (e.g., `nook.me/user`) that render high-fidelity previews when shared on external networks.
**Why it's core:** Drives organic viral growth; users need to share their room designs on platforms like TikTok and Instagram.
**Expected behaviour:** The user taps "Share Room," generating a unique short link. When shared on social media, the link generates a rich, high-fidelity card preview of their customized room. Tapping the link opens the room directly in the Nook app.
**Success metric:** Blended organic referral rate (K-factor) of > 1.2 during launch phase.

---

### Full Feature Set (v1.0 — post-MVP)

| Feature | Description | Why it matters | Phase |
|---|---|---|---|
| **Nook Pets (F-12)** | Interactive virtual widget pets requiring feeding/petting and displaying emotional reactions. | Cultivates emotional attachment and daily cooperative interaction on the home screen. | Phase 3 (v1.0) |
| **Vibe-Knocks (F-13)** | Widget button triggering rhythmic haptic phone vibrations and sliding dynamic sticky doodles to a friend. | Adds a direct, tactile form of physical communication to simulate knocking on a door. | Phase 3 (v1.0) |
| **Ambient Vibe-Casting (F-04)** | Sync and render real-time phone states (local weather effects, battery charging state) in the Room. | Enhances co-presence, making digital rooms feel connected to the user's physical surroundings. | Phase 3 (v1.0) |
| **Spotify Jukebox Widget (F-05)** | Interactive object linking Spotify SDK to display current tracks and play 10s song snippets. | Adds an auditory dimension to self-expression, allowing users to share their music tastes. | Phase 3 (v1.0) |
| **Voice Nooks (F-07)** | Draw visual doodles that record and playback synchronized audio when tapped. | Enhances asynchronous sharing, letting users send rich, personalized voice doodles. | Phase 3 (v1.0) |
| **Live Room Duets (F-09)** | Live presence indicators (glowing doors) showing when a friend is active in your Room. | Creates high-excitement real-time moments, signaling opportunities for live interaction. | Phase 3 (v1.0) |
| **Room Soundscapes (F-14)** | Background audio engine playing ambient loops (rain, lofi guitar) when a Room is viewed. | Establishes the cozy mood, increasing the time spent hanging out inside rooms. | Phase 3 (v1.0) |
| **Furniture & Styling Shop (IAP)** | In-app shop for purchasing thematic pixel-art furniture packs, clothing, hairstyles, and emotes. | The core monetization engine that allows customization enthusiasts to buy exclusive cosmetics. | Phase 3 (v1.0) |

---

### Deliberately Not Building (ever, or not yet)

| Feature | Reason excluded |
|---|---|
| **3D VR Lobbies & Avatars** | Ruled out to maintain high performance, low load times, and instant interactivity on budget mobile devices and home screen widgets. |
| **Real-Time Direct Text Chat** | Excluded to reduce algorithmic pressure and communication fatigue. Nook focuses on visual doodles, stamps, and asynchronous Voice Nooks. |
| **In-App Custom Asset Creator** | All furniture and decorative items are pre-designed templates to ensure a clean, cohesive pixel-art aesthetic and prevent bad UI experiences. |

---

## Product Vision

### The Experience We're Building Toward

Imagine waking up and looking at your phone's home screen. Right there on your home screen widget, you see a small doodle left by your best friend on your guest blackboard, alongside a little pet character waiting to be fed. You tap the widget to feed the pet, and then check in on their room. You see it's raining in their digital room because it's raining in their actual city, creating an immediate, warm feeling of ambient co-presence.

Later in the day, you want to show off the new pixel-art vinyl record player you added to your music room. You share a quick snapshot link directly to your Instagram story. Friends tap the link and are instantly taken to your Room, where they can click your Jukebox to listen to the song you're currently streaming on Spotify. There is no endless feed to scroll through, no likes to monitor, and no comments to reply to—just a cozy space where your friends can leave drawing stamps and small audio notes.

This experience makes social interaction feel active, creative, and slow-paced again. Instead of consuming content passively, users actively design their environments and share their moods. It makes the digital world feel like a collection of cozy, customized personal bedrooms and friendly neighborhood cafes, rather than a giant, noisy stadium.

### Design Principles
These are the non-negotiable rules that govern every product decision. When two choices conflict, these principles break the tie.

1. **Cozy and Low-Pressure:** We deliberately avoid algorithmic feeds, notification spam, and social competition (such as public like counts or follower list feeds). If a feature increases user anxiety or scrolling time, we reject it.
2. **Visual & Tactile First:** Interaction must be centered on direct spatial objects—doodling on blackboards, tapping furniture, and moving assets. We prioritize coordinate-based vector syncs over flat text blocks.
3. **Widget-Native Performance:** Home screen widgets are the primary interface, not an afterthought. Any widget feature must update instantly using local caches, ensuring zero visual lag for tap events.
4. **Cohesive Pixel Aesthetics:** We maintain a strictly curated, high-fidelity 2D pixel-art theme. We rule out user-uploaded custom images/textures to keep the visual quality premium and the app lightweight.

### What We Will Never Compromise On
1. **No Algorithmic Scrolling Feeds:** The core discovery mechanism will always remain spatial navigation (Rooms and Halls) rather than an infinite scroll feed that maximizes session time.
2. **Local Safety-First Moderation:** To protect home-screen widgets, no user-drawn doodles can bypass the local on-device AI moderation filter before syncing.
3. **No Intrusive Ads:** We will never use intrusive popups, interstitial video ads, or banners that break the cozy, pixel-art room aesthetic. Ads are restricted to integrated, non-disruptive billboard assets in public halls.

---

## Success Metrics

### At MVP Launch
| Metric | Target | Why this number |
|---|---|---|
| **Room Customization Rate** | 60% of signups | Ensures that users find value in the core room builder layout mechanics. |
| **Nookie Customization Rate** | 70% of signups | Confirms that users engage with the modular pixel character styling systems. |
| **Organic Viral Referral (K-Factor)** | > 1.2 | High sharing rate of room links is the main engine for organic, low-cost user acquisition. |
| **Widget Tap Responsiveness** | < 150ms latency | Confirms that interactive widget clicks feel instantaneous using local caches. |
| **On-Device Moderation Accuracy** | > 99% accuracy | Necessary to prevent NSFW content from showing up on friends' widgets and violating store rules. |

### At v1.0
| Metric | Target | Why this number |
|---|---|---|
| **7-Day User Retention (D7)** | > 45% | Indicates that the cozy, ambient loops (Voice Nooks, Jukebox, Vibe-casting) keep users coming back. |
| **Blended Monthly ARPU** | ₹14.00 | Combines revenue from VIP subscriptions, billboard ads, and cosmetic item packs to cover costs. |
| **Monthly Active Users (MAU)** | 50,000+ | The scale required to reach stable operational self-sustainability (break-even point is 30,769 MAU). |

### North Star Metric
**Active Widget Interactions per User Day (AWID)** — Tracks how many times a user taps home screen widgets to interact (play widget games, update vibe states, read/draw on guestboards). This is the single metric that captures whether Nook is actually providing low-friction, ambient daily co-presence.

---

## Competitive Positioning

| Competitor | What they do well | What we do instead |
|---|---|---|
| **Noplace** | High-customization text profiles, fast-paced Gen Z interest groups. | Spatial 2D visual rooms instead of text-based bios; widget-native ambient status rather than public feeds. |
| **Locket / noteit** | Home screen widget sharing of photos and sketches. | A complete spatial social hub (interactive rooms, jukebox, widget games) rather than a single utility widget. |
| **Roblox / Rec Room** | High-fidelity 3D multiplayer spatial hanging out and game creation. | Lightweight, 2D pixel-art mobile app and widgets that run passively in the background without battery drain. |
| **Discord** | Rich voice rooms and organized fandom text lobbies. | Asynchronous Voice Nooks and visual Community Halls that favor slower, creative, visual-first discovery. |

**Our moat:** **High switching costs + viral widget co-presence.** Once a user has spent hours designing their custom virtual room and established a shared drawing/gaming loop with friends on their home-screens, the emotional investment and physical real estate on their screens makes it extremely difficult to switch to a competitor.

---

## Revenue Model

**Model:** Hybrid Freemium (Cosmetic Microtransactions + Premium Subscription + Non-Intrusive Ads)
**Pricing:**
- **Free Tier:** 1 Room Profile, 1 default Nookie avatar, access to public lobbies, standard catalog.
- **Nook VIP Subscription:** ₹249/month (includes ad-free Halls, 2 additional Room profiles, 200 monthly store tokens, exclusive monthly asset drops).
- **Theme & Furniture Packs:** ₹29 to ₹199 (IAP themed decoration).
- **Nookie Styling Shop:** ₹19 to ₹99 (special hairstyles, retro clothing, designer shoes, emotes).
- **Interactive Pet Upgrade:** ₹49 (unlocks premium pet companion).
- **Interactive Jukebox Upgrade:** ₹99 one-time (unlocks Spotify/Apple Music playback link).

**Unit economics summary:** CAC ₹15 / LTV ₹140 / Payback 1.1 months
*(Full model in `docs/profitability.md`)*

---

## Risks and Non-Negotiable Mitigations

| Risk | Why it's serious | Required mitigation before launch |
|---|---|---|
| **Widget UI Throttling / Lag** | OS background limits can make widget game moves feel sluggish or fail to render. | **Zero-Lag Cache Strategy**: Store all widget states in local JSON cache. Reload timelines instantly from cache on tap, then queue background network sync. |
| **Widget Memory (OOM) Crashes** | Dynamic layered avatar and room rendering inside the widget extension may exceed the strict 30MB limit. | **Dynamic Layered Sprite Caching**: Pre-render and cache composited transparent PNGs in the main app's shared container instead of runtime layering inside the widget. |
| **Public Hall Griefing & Abuse** | Troll sketches on public boards and guest whiteboards will lead to store rejection. | **On-Device Guardrail**: Deploy local mobile AI classification filters to verify drawings before saving. Limit public writing permissions to accounts > 24h old. |
| **Asset Fatigue** | Users will get bored of decorating rooms if catalog updates are too slow. | **Weekly Asset Pipeline**: Partner with independent pixel artists to build a weekly themed asset release process. |
| **Audio-Sync Latency (Voice Nooks)** | Dynamic vector playback plays out of sync with audio on older devices. | **Unified File Packaging**: Save audio tracks and vector drawing points as a single compressed package using delta-time coordinate arrays. |

---

## What This Is Not

Nook is not a real-time gaming environment, a high-fidelity 3D virtual world, or a messaging client for active direct conversations. It is not designed to maximize session length or promote viral broadcast loops for influencer marketing. We do not support custom image file uploads or custom font styles. It is strictly a low-friction, cozy, spatial profile network designed for visual and asynchronous expression.

---

## Open Questions at Graduation

- [ ] **Interactive Widget Budgets:** How strictly do Apple (iOS WidgetKit) and Google (Android AppWidgets) restrict silent push updates and timeline reloads per day? [Blocks: F-06 Widget Games]
- [ ] **Pinecone Vector Query Speed:** Does similarity search on 64-dimensional sketch vector arrays execute in under 200ms at scale? [Blocks: F-08 AI Moderation]
- [ ] **Community Moderation Roles:** Do we require user-selected "Hall Wardens" (moderators) to manually sweep public rooms? [Blocks: F-03 Community Halls]
