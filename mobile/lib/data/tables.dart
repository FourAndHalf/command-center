import 'package:drift/drift.dart';

import 'json_utils.dart';

/// Local (SQLite/Drift) schema for the Personal Command Center mobile app.
///
/// Column names and types are chosen to mirror the eventual Postgres schema
/// (see docs/plan.html M1/M2 and docs/prompt.md) as closely as SQLite allows,
/// so a future export/sync into the Go/Postgres backend needs no field
/// renaming. Differences from the Postgres schema are called out per table:
///
/// - UUID primary/foreign keys are TEXT (generated client-side with the
///   `uuid` package) instead of Postgres `uuid`. Because IDs are generated
///   here, not assigned by a server, they can be pushed to the backend later
///   without ID translation.
/// - JSONB columns become TEXT columns holding JSON (via TypeConverters).
/// - Timestamps use Drift's DateTimeColumn (stored as epoch ms in SQLite,
///   and exported as epoch ms too); a Postgres importer needs a trivial
///   epoch-ms -> timestamptz conversion, not a schema change.
/// - `relations` cannot use a real foreign key to two different tables the
///   way Postgres could with a check constraint; it stores
///   (source_type, source_id, target_type, target_id) instead. This is the
///   one deliberate structural difference — flag it if the backend schema
///   settles on a different polymorphic-relation approach.

// ---------------------------------------------------------------------------
// JSON converters
// ---------------------------------------------------------------------------

class JsonMapConverter extends TypeConverter<Map<String, dynamic>, String> {
  const JsonMapConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) =>
      fromDb.isEmpty ? {} : (jsonDecodeSafe(fromDb) as Map<String, dynamic>);

  @override
  String toSql(Map<String, dynamic> value) => jsonEncodeSafe(value);
}

class JsonListConverter extends TypeConverter<List<dynamic>, String> {
  const JsonListConverter();

  @override
  List<dynamic> fromSql(String fromDb) =>
      fromDb.isEmpty ? [] : (jsonDecodeSafe(fromDb) as List<dynamic>);

  @override
  String toSql(List<dynamic> value) => jsonEncodeSafe(value);
}

// ---------------------------------------------------------------------------
// Decisions
// ---------------------------------------------------------------------------

/// Mirrors backend `decisions` (docs/prompt.md §5).
class Decisions extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get type => text()(); // career/technical/financial/... /other
  TextColumn get status =>
      text().withDefault(const Constant('active'))(); // pending/active/...
  DateTimeColumn get decisionAt => dateTime().nullable()();

  TextColumn get context => text().nullable()();
  TextColumn get objective => text().nullable()();
  TextColumn get rationale => text().nullable()();
  TextColumn get alternatives => text().nullable()();
  TextColumn get constraints => text().nullable()();

  TextColumn get emotionalContext =>
      text().map(const JsonMapConverter()).nullable()();

  TextColumn get expectedOutcome => text().nullable()();
  TextColumn get successCriteria => text().nullable()();
  TextColumn get failureConditions => text().nullable()();

  IntColumn get confidence => integer().nullable()(); // 0-100
  IntColumn get importance => integer().nullable()(); // 1-5
  IntColumn get reversibility => integer().nullable()(); // 1-5

  // Pending-decision fields (docs/prompt.md §5)
  DateTimeColumn get decideBy => dateTime().nullable()();
  TextColumn get openQuestions =>
      text().map(const JsonListConverter()).nullable()();

  TextColumn get tags => text().map(const JsonListConverter()).nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Mirrors backend `decision_versions`. Append-only: v1 is never touched.
class DecisionVersions extends Table {
  TextColumn get id => text()();
  TextColumn get decisionId =>
      text().references(Decisions, #id, onDelete: KeyAction.cascade)();
  IntColumn get versionNo => integer()();
  TextColumn get snapshot => text().map(const JsonMapConverter())();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Mirrors backend `assumptions` (docs/prompt.md §6).
class Assumptions extends Table {
  TextColumn get id => text()();
  TextColumn get decisionId =>
      text().references(Decisions, #id, onDelete: KeyAction.cascade)();
  TextColumn get statement => text()();
  IntColumn get confidence => integer().nullable()(); // 0-100
  TextColumn get evidence => text().nullable()();
  DateTimeColumn get expectedValidationDate => dateTime().nullable()();
  TextColumn get validationStatus =>
      text().withDefault(const Constant('untested'))();
  TextColumn get actualResult => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Pre-mortem risks (docs/prompt.md §5). New table; no direct backend
/// counterpart yet, but the shape maps to a future `decision_risks` table.
class DecisionRisks extends Table {
  TextColumn get id => text()();
  TextColumn get decisionId =>
      text().references(Decisions, #id, onDelete: KeyAction.cascade)();
  TextColumn get assumptionId =>
      text().nullable().references(Assumptions, #id)();
  TextColumn get statement => text()();
  BoolColumn get happened => boolean().nullable()();
  DateTimeColumn get notedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Advice log (docs/prompt.md §5). New table; future `decision_advice`.
class DecisionAdvice extends Table {
  TextColumn get id => text()();
  TextColumn get decisionId =>
      text().references(Decisions, #id, onDelete: KeyAction.cascade)();
  TextColumn get entityId => text().references(Entities, #id)();
  TextColumn get adviceText => text()();
  DateTimeColumn get givenAt => dateTime().withDefault(currentDateAndTime)();
  // held / did_not / unclear — set at review time
  TextColumn get heldUp => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Mirrors backend `decision_reviews` (docs/prompt.md §8). Append-only:
/// the DAO exposes insert only, never update, for this table.
class DecisionReviews extends Table {
  TextColumn get id => text()();
  TextColumn get decisionId =>
      text().references(Decisions, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get reviewedAt => dateTime().withDefault(currentDateAndTime)();

  TextColumn get whatActuallyHappened => text().nullable()();
  TextColumn get expectedVsActual => text().nullable()();
  TextColumn get assumptionsThatHeld =>
      text().map(const JsonListConverter()).nullable()();
  TextColumn get assumptionsThatFailed =>
      text().map(const JsonListConverter()).nullable()();
  TextColumn get unexpectedConsequences => text().nullable()();
  TextColumn get currentView => text().nullable()();
  TextColumn get lesson => text().nullable()();
  TextColumn get action => text().nullable()();

  // Optional questions (docs/prompt.md §8, items 11-14)
  IntColumn get satisfaction => integer().nullable()(); // 1-5
  TextColumn get regret => text().nullable()();
  TextColumn get roadNotTaken => text().nullable()();

  TextColumn get nextReview => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Goals
// ---------------------------------------------------------------------------

/// Mirrors backend `goals` (docs/prompt.md §10).
class Goals extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get why => text().nullable()();
  TextColumn get horizon => text()(); // this_month/this_quarter/1y/.../open_ended
  DateTimeColumn get targetDate => dateTime().nullable()();
  TextColumn get parentGoalId => text().nullable().references(Goals, #id)();
  TextColumn get status => text().withDefault(const Constant('active'))();
  BoolColumn get excludeFromAi =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Mirrors backend `goal_versions`. Append-only.
class GoalVersions extends Table {
  TextColumn get id => text()();
  TextColumn get goalId =>
      text().references(Goals, #id, onDelete: KeyAction.cascade)();
  IntColumn get versionNo => integer()();
  TextColumn get snapshot => text().map(const JsonMapConverter())();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Goal check-ins (docs/prompt.md §10). Append-only, like reviews.
class GoalCheckins extends Table {
  TextColumn get id => text()();
  TextColumn get goalId =>
      text().references(Goals, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get checkedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Review scheduling — covers reviews, tripwires, cool-off, decide_by
// reminders, goal check-ins, and reflections (docs/prompt.md §12).
// ---------------------------------------------------------------------------

class ReviewSchedules extends Table {
  TextColumn get id => text()();
  TextColumn get decisionId =>
      text().nullable().references(Decisions, #id, onDelete: KeyAction.cascade)();
  TextColumn get goalId =>
      text().nullable().references(Goals, #id, onDelete: KeyAction.cascade)();

  TextColumn get triggerType => text()(); // time / event / condition
  TextColumn get triggerConfig =>
      text().map(const JsonMapConverter()).nullable()();

  // What this schedule is *for* — all reuse the same scheduler
  // (docs/prompt.md §12): review / tripwire / cooloff / decide_by / reflection
  TextColumn get kind => text().withDefault(const Constant('review'))();

  DateTimeColumn get nextDueAt => dateTime().nullable()();
  DateTimeColumn get lastCompletedAt => dateTime().nullable()();
  DateTimeColumn get snoozedUntil => dateTime().nullable()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Entities, relations, events (docs/prompt.md §11, §4)
// ---------------------------------------------------------------------------

class Entities extends Table {
  TextColumn get id => text()();
  TextColumn get type =>
      text()(); // person/company/project/technology/location/life_area/...
  TextColumn get name => text()();
  TextColumn get metadata =>
      text().map(const JsonMapConverter()).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// (source_type, source_id, target_type, target_id) instead of a real FK
/// pair — see the module-level doc comment above for why.
class Relations extends Table {
  TextColumn get id => text()();
  TextColumn get sourceType => text()(); // decision/goal/entity/event/review
  TextColumn get sourceId => text()();
  TextColumn get targetType => text()();
  TextColumn get targetId => text()();
  TextColumn get relationType =>
      text()(); // supersedes/modifies/reverses/depends_on/.../supports
  TextColumn get metadata =>
      text().map(const JsonMapConverter()).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Events extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get occurredAt => dateTime()();
  TextColumn get entityIds =>
      text().map(const JsonListConverter()).nullable()();
  TextColumn get metadata =>
      text().map(const JsonMapConverter()).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Reflections (docs/prompt.md §10). Append-only.
// ---------------------------------------------------------------------------

class Reflections extends Table {
  TextColumn get id => text()();
  TextColumn get periodType => text()(); // quarter / year
  TextColumn get periodLabel => text()(); // e.g. "2026-Q3", "2026"
  TextColumn get summary => text().map(const JsonMapConverter())();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
