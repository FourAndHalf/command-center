import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'projects_dao.g.dart';

/// Built-in starter configuration. It is copied into the new project's setup
/// history; existing projects never read from this mutable app configuration.
const cardboardProjectMilestones = <ProjectMilestone>[
  ProjectMilestone(
    key: 'feasibility',
    label: 'Feasibility',
    description: 'Confirm the supported editing environment and test media.',
    ordinal: 1,
  ),
  ProjectMilestone(
    key: 'versions',
    label: 'Trustworthy versions',
    description: 'Establish how versions are identified and recovered.',
    ordinal: 2,
  ),
  ProjectMilestone(
    key: 'merge',
    label: 'Merge correctness',
    description: 'Test that changes combine without losing evidence.',
    ordinal: 3,
  ),
  ProjectMilestone(
    key: 'comparison',
    label: 'Comparison workflow',
    description: 'Make before/after inspection understandable.',
    ordinal: 4,
  ),
  ProjectMilestone(
    key: 'native',
    label: 'Native application',
    description: 'Validate the workflow in the intended application.',
    ordinal: 5,
  ),
  ProjectMilestone(
    key: 'handoff',
    label: 'Proof and handoff',
    description: 'Capture evidence and document a reproducible handoff.',
    ordinal: 6,
  ),
];

/// Persistence boundary for the reusable project tracker.
///
/// Entries are append-only. Corrections are full replacement records and
/// never mutate the original row, which keeps old expectations and evidence
/// usable in later reviews and exports.
@DriftAccessor(
  tables: [
    Entities,
    Relations,
    Decisions,
    DecisionReviews,
    ProjectEntries,
    ProjectEntryEvidence,
    ProjectReviewEntries,
  ],
)
class ProjectsDao extends DatabaseAccessor<AppDatabase>
    with _$ProjectsDaoMixin {
  ProjectsDao(super.db);

  static const _uuid = Uuid();

  Stream<List<Entity>> watchProjects() =>
      (select(entities)..where((e) => e.type.equals('project'))).watch();

  Future<Entity?> findProject(String projectId) =>
      (select(entities)
            ..where((e) => e.id.equals(projectId) & e.type.equals('project')))
          .getSingleOrNull();

  /// Permanently removes a project and all records owned by it.
  ///
  /// Linked decisions and reviews remain intact; only the project citations
  /// and polymorphic project relations are removed.
  Future<void> deleteProject(String projectId) async {
    await transaction(() async {
      await _requireProject(projectId);
      final entries = await (select(
        projectEntries,
      )..where((entry) => entry.projectEntityId.equals(projectId))).get();
      final entryIds = entries.map((entry) => entry.id).toList();

      if (entryIds.isNotEmpty) {
        await (delete(
          projectReviewEntries,
        )..where((link) => link.entryId.isIn(entryIds))).go();
        await (delete(
          projectEntryEvidence,
        )..where((evidence) => evidence.entryId.isIn(entryIds))).go();
        await (delete(
          projectEntries,
        )..where((entry) => entry.id.isIn(entryIds))).go();
      }

      await (delete(relations)..where(
            (relation) =>
                (relation.sourceType.equals('entity') &
                    relation.sourceId.equals(projectId)) |
                (relation.targetType.equals('entity') &
                    relation.targetId.equals(projectId)),
          ))
          .go();
      await (delete(
        entities,
      )..where((entity) => entity.id.equals(projectId))).go();
    });
  }

  Stream<List<ProjectEntry>> watchHistory(String projectId) =>
      (select(projectEntries)
            ..where((e) => e.projectEntityId.equals(projectId))
            ..orderBy([
              (e) => OrderingTerm.desc(e.recordedAt),
              (e) => OrderingTerm.desc(e.id),
            ]))
          .watch();

  Future<List<ProjectEntry>> getHistory(String projectId) =>
      (select(projectEntries)
            ..where((e) => e.projectEntityId.equals(projectId))
            ..orderBy([
              (e) => OrderingTerm.desc(e.recordedAt),
              (e) => OrderingTerm.desc(e.id),
            ]))
          .get();

  Future<List<ProjectEntry>> getEntriesForDay(
    String projectId,
    String localDay,
  ) =>
      (select(projectEntries)
            ..where(
              (e) =>
                  e.projectEntityId.equals(projectId) &
                  e.localDay.equals(localDay),
            )
            ..orderBy([(e) => OrderingTerm.asc(e.recordedAt)]))
          .get();

  Future<List<ProjectEntrySearchResult>> searchEntries(
    String query, {
    int limit = 50,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return const [];
    final pattern = '%$trimmed%';
    final entries =
        await (select(projectEntries)
              ..where(
                (e) =>
                    e.focus.like(pattern) |
                    e.expectedEvidence.like(pattern) |
                    e.observedResult.like(pattern) |
                    e.blocker.like(pattern) |
                    e.lesson.like(pattern) |
                    e.nextStep.like(pattern) |
                    e.taskReference.like(pattern),
              )
              ..orderBy([(e) => OrderingTerm.desc(e.recordedAt)])
              ..limit(limit))
            .get();
    return _withProjectNames(entries);
  }

  Future<void> saveDecisionReviewWithCitations({
    required DecisionReviewsCompanion review,
    required String projectId,
    required List<String> entryIds,
  }) async {
    if (entryIds.isEmpty) {
      throw ArgumentError.value(
        entryIds,
        'entryIds',
        'Select at least one project record.',
      );
    }
    final decisionId = review.decisionId.value;
    final reviewId = review.id.value;
    await transaction(() async {
      await _requireProject(projectId);
      final decision = await (select(
        decisions,
      )..where((d) => d.id.equals(decisionId))).getSingleOrNull();
      if (decision == null) throw StateError('Decision unavailable.');
      final entries = await (select(
        projectEntries,
      )..where((e) => e.id.isIn(entryIds))).get();
      if (entries.length != entryIds.length ||
          entries.any(
            (entry) =>
                entry.projectEntityId != projectId ||
                entry.logicalKind == 'setup',
          )) {
        throw ArgumentError.value(
          entryIds,
          'entryIds',
          'Citations must belong to this project.',
        );
      }
      await into(decisionReviews).insert(review);
      final existingRelation =
          await (select(relations)..where(
                (relation) =>
                    relation.sourceType.equals('entity') &
                    relation.sourceId.equals(projectId) &
                    relation.targetType.equals('decision') &
                    relation.targetId.equals(decisionId),
              ))
              .getSingleOrNull();
      if (existingRelation == null) {
        await into(relations).insert(
          RelationsCompanion.insert(
            id: _uuid.v4(),
            sourceType: 'entity',
            sourceId: projectId,
            targetType: 'decision',
            targetId: decisionId,
            relationType: 'supports',
          ),
        );
      }
      for (final entryId in entryIds) {
        await into(projectReviewEntries).insert(
          ProjectReviewEntriesCompanion.insert(
            reviewId: reviewId,
            entryId: entryId,
          ),
        );
      }
    });
  }

  Stream<List<ProjectEntrySearchResult>> watchRecentEntries({int limit = 100}) {
    return (select(projectEntries)
          ..where((e) => e.logicalKind.isNotIn(const ['setup']))
          ..orderBy([
            (e) => OrderingTerm.desc(e.recordedAt),
            (e) => OrderingTerm.desc(e.id),
          ])
          ..limit(limit))
        .watch()
        .asyncMap(_withProjectNames);
  }

  Future<List<ProjectEntrySearchResult>> _withProjectNames(
    List<ProjectEntry> entries,
  ) async {
    if (entries.isEmpty) return const [];
    final ids = entries.map((entry) => entry.projectEntityId).toSet();
    final projects = await (select(
      entities,
    )..where((entity) => entity.id.isIn(ids))).get();
    final names = {for (final project in projects) project.id: project.name};
    return [
      for (final entry in entries)
        ProjectEntrySearchResult(
          entry: entry,
          projectName: names[entry.projectEntityId] ?? 'Project',
        ),
    ];
  }

  Future<String> createProject({
    required String name,
    String? desiredOutcome,
    String? sourceTitle,
    String? sourceRevision,
    List<ProjectMilestone> milestones = const [],
    String? starterId,
    String? starterVersion,
  }) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ArgumentError.value(name, 'name', 'A project name is required.');
    }

    final projectId = _uuid.v4();
    final entryId = _uuid.v4();
    final now = DateTime.now();
    final payload = <String, dynamic>{
      'schemaVersion': 1,
      'name': trimmedName,
      'desiredOutcome': _nullIfBlank(desiredOutcome),
      'sourceTitle': _nullIfBlank(sourceTitle),
      'sourceRevision': _nullIfBlank(sourceRevision),
      'starterId': starterId,
      'starterVersion': starterVersion,
      'milestones': milestones.map((m) => m.toJson()).toList(),
    };

    await transaction(() async {
      await into(entities).insert(
        EntitiesCompanion.insert(
          id: projectId,
          type: 'project',
          name: trimmedName,
          metadata: Value({
            'desiredOutcome': _nullIfBlank(desiredOutcome),
            'sourceTitle': _nullIfBlank(sourceTitle),
            'sourceRevision': _nullIfBlank(sourceRevision),
          }),
        ),
      );
      await into(projectEntries).insert(
        ProjectEntriesCompanion.insert(
          id: entryId,
          projectEntityId: projectId,
          kind: 'setup',
          logicalKind: 'setup',
          recordedAt: now,
          localDay: _day(now),
          setupPayload: Value(payload),
        ),
      );
    });
    return projectId;
  }

  Future<String> recordIntent({
    required String projectId,
    required String focus,
    String? expectedEvidence,
    String? milestoneKey,
    String? taskReference,
    DateTime? recordedAt,
    String? localDay,
  }) async {
    final trimmedFocus = focus.trim();
    if (trimmedFocus.isEmpty) {
      throw ArgumentError.value(focus, 'focus', 'A session focus is required.');
    }
    await _requireProject(projectId);
    final now = recordedAt ?? DateTime.now();
    final id = _uuid.v4();
    await into(projectEntries).insert(
      ProjectEntriesCompanion.insert(
        id: id,
        projectEntityId: projectId,
        kind: 'intent',
        logicalKind: 'intent',
        recordedAt: now,
        localDay: localDay ?? _day(now),
        capturedOffsetMinutes: Value(now.timeZoneOffset.inMinutes),
        focus: Value(trimmedFocus),
        expectedEvidence: Value(_nullIfBlank(expectedEvidence)),
        milestoneKey: Value(_nullIfBlank(milestoneKey)),
        taskReference: Value(_nullIfBlank(taskReference)),
      ),
    );
    return id;
  }

  Future<String> recordObservation({
    required String projectId,
    required String observedResult,
    String? relatedEntryId,
    String? blocker,
    String? lesson,
    String? nextStep,
    String? evidence,
    int? actualMinutes,
    DateTime? occurredAt,
    DateTime? recordedAt,
    String? localDay,
    String? orderingClaim,
  }) async {
    final result = observedResult.trim();
    if (result.isEmpty) {
      throw ArgumentError.value(
        observedResult,
        'observedResult',
        'A result is required.',
      );
    }
    if (actualMinutes != null && actualMinutes < 0) {
      throw ArgumentError.value(actualMinutes, 'actualMinutes');
    }
    await _requireProject(projectId);
    final now = recordedAt ?? DateTime.now();
    if (occurredAt != null && occurredAt.isAfter(DateTime.now())) {
      throw ArgumentError.value(
        occurredAt,
        'occurredAt',
        'Future dates are not supported.',
      );
    }
    if (relatedEntryId != null) {
      final intent = await (select(
        projectEntries,
      )..where((e) => e.id.equals(relatedEntryId))).getSingleOrNull();
      if (intent == null ||
          intent.projectEntityId != projectId ||
          intent.logicalKind != 'intent') {
        throw ArgumentError.value(
          relatedEntryId,
          'relatedEntryId',
          'Choose an intent from this project.',
        );
      }
      if (occurredAt != null && occurredAt.isBefore(intent.recordedAt)) {
        throw ArgumentError.value(
          relatedEntryId,
          'relatedEntryId',
          'This result happened before the selected plan was saved.',
        );
      }
    }
    final id = _uuid.v4();
    await transaction(() async {
      await into(projectEntries).insert(
        ProjectEntriesCompanion.insert(
          id: id,
          projectEntityId: projectId,
          kind: 'observation',
          logicalKind: 'observation',
          recordedAt: now,
          occurredAt: Value(occurredAt),
          localDay: localDay ?? _day(now),
          capturedOffsetMinutes: Value(now.timeZoneOffset.inMinutes),
          relatedEntryId: Value(relatedEntryId),
          orderingClaim: Value(orderingClaim),
          observedResult: Value(result),
          actualMinutes: Value(actualMinutes),
          blocker: Value(_nullIfBlank(blocker)),
          lesson: Value(_nullIfBlank(lesson)),
          nextStep: Value(_nullIfBlank(nextStep)),
        ),
      );
      if (evidence != null && evidence.trim().isNotEmpty) {
        await into(projectEntryEvidence).insert(
          ProjectEntryEvidenceCompanion.insert(
            id: _uuid.v4(),
            entryId: id,
            label: 'Evidence',
            referenceText: Value(evidence.trim()),
          ),
        );
      }
    });
    return id;
  }

  /// Appends a full replacement for an intent or observation. The target is
  /// never updated, so old expectations and citations remain immutable.
  Future<String> correctEntry({
    required String projectId,
    required String targetEntryId,
    String? focus,
    String? expectedEvidence,
    String? observedResult,
    String? blocker,
    String? lesson,
    String? nextStep,
    int? actualMinutes,
  }) async {
    await _requireProject(projectId);
    final target = await (select(
      projectEntries,
    )..where((e) => e.id.equals(targetEntryId))).getSingleOrNull();
    if (target == null || target.projectEntityId != projectId) {
      throw ArgumentError.value(targetEntryId, 'targetEntryId');
    }
    if (target.logicalKind == 'setup') {
      throw ArgumentError.value(
        targetEntryId,
        'targetEntryId',
        'Setup history is corrected through project setup changes.',
      );
    }
    final replacementResult = observedResult?.trim();
    final replacementFocus = focus?.trim();
    if (target.logicalKind == 'intent' &&
        (replacementFocus == null || replacementFocus.isEmpty)) {
      throw ArgumentError.value(
        focus,
        'focus',
        'A corrected plan needs a focus.',
      );
    }
    if (target.logicalKind == 'observation' &&
        (replacementResult == null || replacementResult.isEmpty)) {
      throw ArgumentError.value(
        observedResult,
        'observedResult',
        'A corrected result is required.',
      );
    }
    if (actualMinutes != null && actualMinutes < 0) {
      throw ArgumentError.value(actualMinutes, 'actualMinutes');
    }
    final now = DateTime.now();
    final id = _uuid.v4();
    await into(projectEntries).insert(
      ProjectEntriesCompanion.insert(
        id: id,
        projectEntityId: projectId,
        kind: 'correction',
        logicalKind: target.logicalKind,
        rootEntryId: Value(target.rootEntryId ?? target.id),
        correctionTargetId: Value(target.id),
        relatedEntryId: Value(target.relatedEntryId),
        orderingClaim: Value(target.orderingClaim),
        recordedAt: now,
        occurredAt: Value(target.occurredAt),
        localDay: _day(now),
        capturedOffsetMinutes: Value(now.timeZoneOffset.inMinutes),
        focus: Value(replacementFocus),
        expectedEvidence: Value(_nullIfBlank(expectedEvidence)),
        observedResult: Value(replacementResult),
        actualMinutes: Value(actualMinutes),
        blocker: Value(_nullIfBlank(blocker)),
        lesson: Value(_nullIfBlank(lesson)),
        nextStep: Value(_nullIfBlank(nextStep)),
        milestoneKey: Value(target.milestoneKey),
        taskReference: Value(target.taskReference),
      ),
    );
    return id;
  }

  Future<void> _requireProject(String projectId) async {
    if (await findProject(projectId) == null) {
      throw StateError('Project unavailable.');
    }
  }

  static String _day(DateTime value) =>
      '${value.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}';

  static String? _nullIfBlank(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }
}

class ProjectMilestone {
  const ProjectMilestone({
    required this.key,
    required this.label,
    this.description,
    required this.ordinal,
  });

  final String key;
  final String label;
  final String? description;
  final int ordinal;

  factory ProjectMilestone.fromJson(Map<String, dynamic> json) {
    return ProjectMilestone(
      key: json['key'] as String? ?? '',
      label: json['label'] as String? ?? 'Untitled step',
      description: json['description'] as String?,
      ordinal: (json['ordinal'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'key': key,
    'label': label,
    'description': description,
    'ordinal': ordinal,
  };
}

class ProjectEntrySearchResult {
  const ProjectEntrySearchResult({
    required this.entry,
    required this.projectName,
  });

  final ProjectEntry entry;
  final String projectName;
}
