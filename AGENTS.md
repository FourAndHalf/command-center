# AGENTS.md

Repository guidance for coding agents.

## Product contract

This is a private, self-hostable **Personal Command Center** for preserving decisions and learning from their outcomes:

**Experience → Decision → Prediction → Outcome → Review → Learning → Future Decision**

It is not a journal, second brain, habit tracker, task manager, or autonomous life assistant. A change belongs here only if it strengthens that loop.

Before changing product behavior, architecture, or the data model, read `docs/prompt.md`. It is the product source of truth unless implemented code and newer project documentation clearly supersede it. For mobile UI work, also read `design/DESIGN.md` and the nearby implementation before editing.

## Repository reality

- `mobile/` is the only implemented application. It is an offline Flutter app backed by local Drift/SQLite storage.
- There is currently no `backend/`, `web/`, or `deploy/` implementation. Do not write code against, document, or test imaginary services.
- The mobile schema intentionally anticipates the future PostgreSQL schema. `mobile/lib/data/tables.dart` documents every SQLite/Postgres mapping and deliberate difference.
- The mobile app already includes decision capture and history, reviews and scheduling, goals, timeline, search, people, insights, reflections, settings, and local export. Inspect the code before assuming a flow is complete.
- Generated Drift files (`*.g.dart`) are artifacts. Change tables or DAOs, then regenerate them; never hand-edit generated code.

## Non-negotiable domain rules

1. **Preserve history.** Before a decision or goal changes, snapshot its previous state in the same transaction. Reviews, check-ins, and reflections are append-only. Never rewrite a past observation with present knowledge.
2. **Keep categories of knowledge separate.** What happened, what the user knew, believed, felt, expected, and later observed are different fields and concepts.
3. **Decision quality is not outcome quality.** Do not create good/bad decision scores. Calibration may measure recorded predictions, not personal worth or decision quality.
4. **The human is authoritative.** AI output is a draft or inference until confirmed. Never invent dates, facts, motives, emotions, or outcomes; preserve unknowns as unknown.
5. **Preserve provenance.** Records, search results, and AI answers must be traceable to their sources and label recorded fact, user statement, AI inference, and unknown distinctly.
6. **Protect privacy and portability.** The product must remain useful with AI disabled. External AI is opt-in and must disclose what is sent. Do not log personal content. Keep all important data exportable as JSON, Markdown, CSV where appropriate, and original files.
7. **Avoid psychological claims.** Report evidence such as “In 6 recorded decisions…”; do not diagnose or generalize with “You tend to…”.

## Architecture boundaries

The planned server stack is fixed: a Go modular monolith, REST/OpenAPI, PostgreSQL with full-text search and pgvector, Angular/TypeScript/Tailwind/CDK, S3-compatible files, and a Go worker with PostgreSQL-backed job state. The future OpenAPI document under `backend/` will be the generated-client contract.

Do not introduce microservices, Kubernetes, Neo4j, Kafka, Temporal, Elasticsearch, another database/vector store, or autonomous agents without a demonstrated need and explicit approval. The relationship graph belongs in relational tables.

All future ingestion must follow one path:

`raw source → normalize → deduplicate → extract → candidate → human confirmation → canonical record`

Connectors only normalize sources; domain logic stays in the ingestion layer. Use content hashes and idempotency keys.

Scheduling and notifications must be idempotent, retryable, auditable, and deduplicated. Snoozing changes `snoozed_until`, not the original due date. Overdue items remain visible until completed or dismissed.

Follow the phase order in `docs/prompt.md` §31. Finish the create → review → learn loop before broad integrations or infrastructure.

## Mobile conventions

- State and dependencies: Riverpod providers in `mobile/lib/app/providers.dart`.
- Persistence: Drift tables in `mobile/lib/data/tables.dart`; access data through DAOs in `mobile/lib/data/daos/`. Keep multi-write invariants transactional.
- Navigation: GoRouter routes in `mobile/lib/app/router.dart`; shared phone navigation in `mobile/lib/app/app_shell.dart`.
- Design: `design/DESIGN.md` defines the Boro “Quiet Confidence” system. Reuse `mobile/lib/app/design_tokens.dart`, `mobile/lib/app/theme.dart`, and shared widgets in `mobile/lib/widgets/`. Do not hard-code screen-local colors, type styles, spacing, radii, or duplicate shared components.
- UI: keep the original decision visually distinct from later reviews. Favor focused Today, Decisions, Goals, Reviews, Timeline, and Search flows over vanity dashboards.
- Schema changes: update the Drift source, add a migration and increment `schemaVersion` when persisted data requires it, regenerate code, and add or update database tests.
- Tests live in `mobile/test/`; use an in-memory `NativeDatabase` for persistence tests.

## Workflow

For feature-sized code work, use the repository's gstack sequence:

1. Run `gstack-autoplan` before implementation (`gstack-office-hours` first if the request is vague).
2. Implement the agreed scope.
3. Run `gstack-review`.
4. Run `gstack-qa` when there is a runnable surface.
5. Report changed files, verification performed, and remaining risks.

This full sequence is unnecessary for small documentation-only or mechanical edits. Never deploy or perform destructive actions without explicit confirmation.

Work narrowly: inspect the surrounding implementation, preserve unrelated changes in a dirty worktree, and do not refactor opportunistically. Add tests beside changed behavior. Never commit secrets, `.env` files, database dumps, or personal data.

## Git

- Do not develop on `main`. Use `feature/<name>`, `fix/<name>`, or `chore/<name>` from an up-to-date `main`.
- Before switching branches or editing, inspect the worktree and preserve changes you did not create. Do not move an existing dirty worktree onto a new branch without the user's direction.
- Keep commits small and coherent. Do not commit, push, merge, deploy, or delete branches unless the user asks for that operation.
- When explicitly asked to finish integration, first verify the branch, merge it into `main`, then remove the merged local branch and any pushed remote branch.

## Mobile commands

Run from `mobile/`:

- `flutter pub get` — install or update dependencies.
- `dart run build_runner build --delete-conflicting-outputs` — regenerate Drift/DAO code after table or DAO changes.
- `dart format --output=none --set-exit-if-changed lib test` — check formatting.
- `flutter analyze` — run static analysis.
- `flutter test` — run the test suite.
- `flutter run` — exercise UI behavior on a device or emulator.
