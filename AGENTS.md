# AGENTS.md

Guidance for AI coding agents working in this repository.

## Project

A private, self-hostable **Personal Command Center** for capturing decisions, preserving the context they were made in, and reviewing outcomes later. The core loop is:

**Experience → Decision → Prediction → Outcome → Review → Learning → Future Decision**

It is not a journal, second brain, habit tracker, or task manager. Every change should strengthen this loop.

The full product spec is `docs/prompt.md`. Read it before making design decisions; it is the source of truth until code and docs supersede it.

## Status

No backend or web app yet — the repo contains the spec and milestone plan for those. `mobile/` is real: an offline-only Flutter app implementing the core decision/review/goal loop against a local Drift (SQLite) database, built ahead of the backend so there's something usable before a VPS exists. Its schema mirrors the eventual Postgres tables column-for-column (see `mobile/lib/data/tables.dart` for the mapping and the deliberate differences). Update this file as backend/web become real, and do not assume something exists without checking.

The mobile app's visual design follows `design/DESIGN.md` (the "Executive Command Center" design system: colors, typography, spacing, and component tokens) and the mockups in `design/*.png`. `mobile/lib/app/design_tokens.dart` and `mobile/lib/app/theme.dart` implement it; reuse those tokens and the shared widgets in `mobile/lib/widgets/` rather than hard-coding colors or styles in a screen. When the web app is eventually built, it should follow the same system rather than inventing its own.

## Stack (fixed by the spec)

- Backend: Go modular monolith, REST + OpenAPI. Modules: `decisions`, `reviews`, `events`, `sources`, `entities`, `goals`, `search`, `notifications`, `ingestion`, `ai`.
- Database: PostgreSQL only (system of record), pgvector, Postgres full-text search. UUID PKs, foreign keys, migrations, JSONB only where flexibility helps.
- Frontend: Angular, TypeScript, Tailwind CSS, Angular CDK.
- Mobile: Flutter.
- Files: S3-compatible storage (MinIO in dev).
- Background jobs: Go worker with PostgreSQL-backed job state.

Do not introduce microservices, Kubernetes, Neo4j, Kafka, Temporal, Elasticsearch, extra vector stores or databases, or autonomous agents. Any new technology needs a concrete problem it solves.

## Planned layout

```
backend/    Go service, worker, migrations, OpenAPI spec
web/        Angular app
mobile/     Flutter app
deploy/     docker-compose, Caddyfile, backup scripts
docs/       Spec, design docs, milestone plan
```

Single repo by design; the OpenAPI spec in `backend/` is the contract for the generated web and mobile clients.

## Domain invariants (do not violate)

1. **History is immutable.** Decisions are never rewritten. Changes create a `DecisionVersion` or a linked decision. `DecisionReview` rows are append-only.
2. **Fact vs. interpretation.** Keep what happened / knew / believed / felt / expected / actually happened separate.
3. **Decision quality ≠ outcome quality.** Never reduce decisions to a good/bad score.
4. **Human is the source of truth.** AI output is a draft. AI-extracted fields are marked as such and need user confirmation before becoming canonical. Never invent dates, motivations, feelings, facts, or outcomes; mark unknowns as unknown.
5. **Provenance.** Every record must answer "where did this come from?". Search results and AI answers cite underlying records and label them as recorded fact, user statement, AI inference, or unknown.
6. **Portability.** Nothing may depend on a specific AI provider, vector DB, or cloud. Everything must be exportable (JSON, Markdown, CSV, original files).
7. **Privacy.** Single-user, private by default. Do not log raw personal content. External AI is off unless explicitly enabled, and the data sent must be clearly identified. The app must remain fully useful with AI disabled.
8. **No psychological diagnosis or personality analysis.** Prefer "In 6 recorded decisions…" over "You tend to…".

## Engineering rules

- Ingestion: all sources go through one pipeline (raw source → normalize → dedupe → extract → candidate → human confirmation → canonical). Connectors only produce normalized sources and contain no business logic. Use idempotency keys and content hashes.
- Notifications and scheduling must be idempotent, retryable, auditable, and deduplicated. A failed worker must not create duplicate notifications or reviews. Snoozing must preserve the original due date. Overdue reviews stay visible until completed or dismissed.
- The graph lives in PostgreSQL relations, not a graph DB.
- Keep the UI small: Today, Decisions, Reviews, Timeline, Search (secondary: Goals, Sources, Projects, Settings). No vanity-metric dashboards. On the decision detail screen, the original decision must stay visually distinct from later reviews.
- Build in the phase order in `docs/prompt.md` §31. The first milestone is the full create → review → learn loop, seeded with realistic example data.
- Add tests for domain logic, ingestion, scheduler, AI validation, and API endpoints alongside the code they cover.

## Working style

- Make the smallest change that solves the task; do not refactor or reformat unrelated code.
- Match the conventions of surrounding code.
- State assumptions and ask when requirements are ambiguous rather than guessing.
- Verify changes by running the relevant tests or build before calling work done.
- Never commit secrets, `.env` files, database dumps, or personal data. See `.gitignore`.

## Git workflow

- Never develop directly on `main`. Create every feature, fix, or chore on its own branch (`feature/<short-name>`, `fix/<short-name>`, `chore/<short-name>`) cut from an up-to-date `main`.
- Commit on the feature branch in small, coherent commits.
- When development is done and tests pass, integrate the branch back into `main`, then delete the stale branch locally (and on the remote if it was pushed).
- Only run the integration and delete steps when the work is verified; don't leave merged branches lying around.

## Commands

Backend/web: none established yet.

Mobile (`mobile/`):
- `flutter pub get` — install dependencies
- `dart run build_runner build --delete-conflicting-outputs` — regenerate Drift/DAO code after changing `lib/data/tables.dart` or a DAO
- `flutter analyze` — lint
- `flutter test` — run tests (`test/database_test.dart` covers versioning, append-only reviews, snooze behavior)
- `flutter run` — run on a connected device/emulator
