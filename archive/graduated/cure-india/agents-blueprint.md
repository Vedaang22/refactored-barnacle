# Agents & Skills Blueprint — CureIndia

**For repo:** `cure-india-app`
**Generated:** 2026-06-21
**Based on:** vision.md + roadmap.md

> This document defines the agent infrastructure for the build repo.
> It is the input used to generate `bootstrap.sh`. If you change this
> document, regenerate the bootstrap script.

---

## AGENTS.md for the Build Repo

The build repo's AGENTS.md is tuned for shipping, not exploring.

```markdown
# AGENTS.md — CureIndia

## What this repo is
CureIndia is a trust-centered, compliance-first marketplace connecting international patients with JCI/NABH accredited Indian hospitals and vetted local concierge services. It features standardized packaging, an end-to-end encrypted medical record vault, a multi-quote comparison portal, and structured concierge booking. The project is currently building its Phase 1 MVP.

## Codebase layout
- `src/app/` — Next.js page routes, layouts, and API endpoints (app router).
- `src/components/` — Shared, reusable UI components and specialized modules (e.g., encryption panels).
- `src/lib/` — Shared utility libraries: cryptographic functions, DB client, and third-party integrations.
- `src/hooks/` — Custom React hooks (authentication, encryption/decryption state, upload progress).
- `src/types/` — Shared TypeScript type declarations for users, quotes, and transactions.
- `prisma/` — Database schema definitions (PostgreSQL) and seeding scripts.
- `tests/` — Component, unit, integration, and security/encryption test suites.
- `docs/` — System architecture, data models, API specifications, and Architecture Decision Records (ADRs).
- `.agents/` — Agent instructions, guidelines, and skills.

## How to run locally
1. Install dependencies:
   ```bash
   npm install
   ```
2. Copy environment template and fill values:
   ```bash
   cp .env.example .env
   ```
3. Set up and migrate the database:
   ```bash
   npx prisma migrate dev
   npx prisma db seed
   ```
4. Start the local development server:
   ```bash
   npm run dev
   ```

## Agent behaviour
- **TDD Preferred:** Write corresponding unit or integration tests in `tests/` alongside implementation files, not afterwards.
- **Scope Isolation:** Modify files exclusively related to the current feature branch. Never make arbitrary code changes in unrelated directories.
- **Commit Format:** `[scope] short description` — e.g., `[vault] add client-side AES chunking` or `[auth] secure session routing`.
- **Docs Sync:** Always update architectural diagrams or specifications in `docs/` if modifying database schemas, api routes, or key cryptographic flows.

## Code conventions
- **Language:** TypeScript strictly (avoid `any`, enforce strict types).
- **Styling:** CSS Modules or Tailwind CSS. Enforce clean, responsive component design.
- **Formatting:** Prettier for formatting, ESLint for lint rules.
- **Crypto:** Enforce standard browser `crypto.subtle` APIs for client-side encryption. Keep keys in-memory.

## What agents must NOT do
- **No Plaintext Medical Records:** Never write logic that uploads unencrypted patient medical PDFs/images to S3 or stores decryption keys in database tables.
- **No Referral Commission Logic:** Do NOT write code that calculates hospital bill percentage splits or referral fees. All hospital transactions must use B2B SaaS listing subscriptions or flat-rate booking fees.
- **No Direct Schema Updates:** Never alter the database schema without writing a corresponding Prisma migration file.
```

---

## Skills for the Build Repo

### Core Skills

#### `dev-setup`
**Purpose:** Onboards developers and agents from zero to running. Outlines dependencies, env variables, seeding scripts, and troubleshooting setup errors.
**Triggers:** "set up dev environment", "onboard", "getting started", "setup database"
**Scope:** `README.md`, `.env.example`, `package.json`, `prisma/schema.prisma`

#### `code-review`
**Purpose:** Checks PR code for correctness, UI alignment, lint adherence, testing coverage, and architectural drift.
**Triggers:** "review this", "check my code", "PR review", "does this look right"
**Scope:** Any changed file in `src/` or `prisma/`

#### `debug`
**Purpose:** Diagnoses and traces application runtime errors, database queries, and browser-side cryptographic errors.
**Triggers:** "this is broken", "getting an error", "why is X not working", error trace dump
**Scope:** `src/`, error logs, tests

#### `write-tests`
**Purpose:** Generates Jest/Playwright tests for cryptographic vaults, auth routing, database seeds, and UI pages.
**Triggers:** "write tests for", "test coverage", "add tests", "test this function"
**Scope:** `tests/`, source files

---

### Product-Specific Skills

#### `auth-roles`
**Purpose:** Handles signup, credentials validation, and role redirection for four core roles (Patient, Hospital representative, Concierge agency, Admin).
**Triggers:** "implement auth", "role routing", "user signup wizard", "hospital rep signup", "permission control"
**Scope:** `src/app/(auth)/`, `src/app/api/auth/`, `src/hooks/useAuth.ts`, `src/types/auth.d.ts`
**Key context:** Hospital representatives must provide valid NABH/JCI accreditation registry data during registration.

#### `hospital-directory`
**Purpose:** Implements the hospital search, specialty filtering, profile pages, and medical desk contact registration.
**Triggers:** "search hospitals", "hospital directory", "filter specialties", "hospital profile page", "NABH accreditation checks"
**Scope:** `src/app/hospitals/`, `src/components/HospitalCard.tsx`, `prisma/schema.prisma`
**Key context:** Only NABH and JCI accredited hospitals in major hubs (Delhi, Mumbai, Bangalore) are allowed in the directory.

#### `medical-vault`
**Purpose:** Implements zero-knowledge client-side encryption (AES-256-GCM) for patient files, hospital-level RSA key storage, S3 presigned URL generation, and browser decryption modules.
**Triggers:** "file encryption", "upload record", "browser cryptography", "AES-256 GCM vault", "decrypt MRI files"
**Scope:** `src/lib/crypto.ts`, `src/hooks/useVault.ts`, `src/app/api/vault/`, `src/components/VaultUpload.tsx`
**Key context:** Plaintext files must never touch the network or server. Decryption must occur solely inside the authorized user's browser using local keys.

#### `quote-portal`
**Purpose:** Manages the bidding workflow where patients request estimates from up to three hospitals, and hospital representatives decrypt dossiers, consult doctors, and submit itemized quotes.
**Triggers:** "request quote", "quote portal", "compare estimates", "hospital bid response", "itemized invoice template"
**Scope:** `src/app/quotes/`, `src/app/api/quotes/`, `src/components/QuoteComparison.tsx`
**Key context:** Itemization of surgical costs, lodging, and transport is mandatory. Paid placement options or commissions are banned.

#### `concierge-management`
**Purpose:** Manages vetted agency listings, the step-by-step visa tracker checklist, and the packaging, checkout, and payment flows for airport pickups, hotels, and translators.
**Triggers:** "concierge directory", "visa tracker checklist", "booking engine", "package booking", "logistics payment escrow"
**Scope:** `src/app/concierge/`, `src/app/api/concierge/`, `src/components/VisaTracker.tsx`
**Key context:** Coordinates the B2C logistics markup model (earning ~₹15,000 margin per bundle) and routes funds via escrow.

#### `multilingual-chat`
**Purpose:** Powers real-time chat with translation engines (e.g., DeepL/Google Translate) for patients, hospital desks, and translators.
**Triggers:** "chat translation", "message translation API", "real-time chat", "Swahili translation"
**Scope:** `src/app/api/translate/`, `src/components/ChatWindow.tsx`, `src/lib/translation.ts`
**Key context:** Handles specific medical terminology carefully. Prompts/API requests must optimize translation translation latency.

---

## Subagents for the Build Repo

### `parallel-builder`
**Purpose:** Splits and develops parallel components (such as auth pages and directory templates) simultaneously without code collision.
**When to spawn:** When developing parallel frontend templates or routing endpoints that don't share models.

### `security-specialist`
**Purpose:** Validates the cryptographic soundness of client-side encryption modules, HIPAA audit logs, and GDPR file-purging rules.
**Context it carries:** WebCrypto API syntax, encryption boundaries, and zero-knowledge validation flows.
**Triggers:** "audit security", "review encryption hooks", "HIPAA verification", "setup data residency compliance"

### `integrations-specialist`
**Purpose:** Oversees external API endpoints including email/WhatsApp notification hooks (Twilio), translation networks (DeepL/Google Translate), Jitsi/Zoom scheduling, and payment gateways.
**Context it carries:** API request limits, rate limit handling, and sandbox configurations.
**Triggers:** "integrate translation API", "setup whatsapp alert", "configure payment gateway", "zoom teleconsult setup"

---

## Architecture Decisions to Document

Before writing code, create these files in `docs/`:

| File | Contents | Source |
|---|---|---|
| `docs/architecture.md` | System design, component diagram, Next.js serverless architecture, client-side encryption workflow | `roadmap.md` technical sketches |
| `docs/data-model.md` | Schema, relationships (Patient, Hospital, Agency, Quote, VaultFile, Booking) | `roadmap.md` + `feasibility.md` |
| `docs/api.md` | REST/API endpoints specs for Quotes, Vault, and Directory searches | `roadmap.md` feature inventory |
| `docs/vision.md` | Migrated from idea repo | `vision.md` |
| `docs/roadmap.md` | Migrated from idea repo | `roadmap.md` |
| `docs/decisions/001-compliance-monetization.md` | Ban on hospital commissions; adoption of B2B subscription and concierge logistics markup | `graduation-handoff.md` Key Decision #1 |
| `docs/decisions/002-zero-knowledge-vault.md` | Browser-based AES-256-GCM record vault; asymmetric key routing to target hospitals | `graduation-handoff.md` Key Decision #2 |
| `docs/decisions/003-quality-curated-directory.md` | Restriction of directory to JCI/NABH hospitals in hubs Delhi, Mumbai, Bangalore | `graduation-handoff.md` Key Decision #3 |
