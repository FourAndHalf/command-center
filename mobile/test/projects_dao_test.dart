import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/data/database.dart';
import 'package:mobile/data/daos/projects_dao.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  test(
    'blank and starter-shaped projects keep isolated daily history',
    () async {
      final cardboard = await db.projectsDao.createProject(
        name: 'Cardboard video version control',
        starterId: 'cardboard',
        starterVersion: '1',
        milestones: const [
          ProjectMilestone(key: 'w1', label: 'Feasibility', ordinal: 1),
        ],
      );
      final research = await db.projectsDao.createProject(
        name: 'Kitchen research',
      );

      await db.projectsDao.recordIntent(
        projectId: cardboard,
        focus: 'Verify supported Premiere access',
        expectedEvidence: 'A permitted test clip opens and can be inspected',
      );
      await db.projectsDao.recordObservation(
        projectId: cardboard,
        observedResult: 'Access was available; native feasibility remains open',
        actualMinutes: 25,
      );
      await db.projectsDao.recordIntent(
        projectId: research,
        focus: 'Compare two storage approaches',
      );

      final cardboardHistory = await db.projectsDao.getHistory(cardboard);
      final researchHistory = await db.projectsDao.getHistory(research);
      expect(
        cardboardHistory.map((e) => e.projectEntityId),
        everyElement(cardboard),
      );
      expect(
        researchHistory.map((e) => e.projectEntityId),
        everyElement(research),
      );
      expect(cardboardHistory.where((e) => e.kind == 'intent'), hasLength(1));
      expect(
        cardboardHistory.where((e) => e.kind == 'observation'),
        hasLength(1),
      );
      final setup = cardboardHistory.singleWhere((e) => e.kind == 'setup');
      expect((setup.setupPayload!['milestones'] as List).length, 1);
      expect(researchHistory.where((e) => e.kind == 'intent'), hasLength(1));
    },
  );

  test(
    'invalid result preserves project history and rejects missing content',
    () async {
      final project = await db.projectsDao.createProject(
        name: 'Writing project',
      );

      await expectLater(
        db.projectsDao.recordObservation(
          projectId: project,
          observedResult: '   ',
        ),
        throwsArgumentError,
      );
      expect(await db.projectsDao.getHistory(project), hasLength(1));
    },
  );

  test('a result can reference only an intent from the same project', () async {
    final first = await db.projectsDao.createProject(name: 'First');
    final second = await db.projectsDao.createProject(name: 'Second');
    final intent = await db.projectsDao.recordIntent(
      projectId: first,
      focus: 'Try it',
    );

    await expectLater(
      db.projectsDao.recordObservation(
        projectId: second,
        observedResult: 'Observed',
        relatedEntryId: intent,
      ),
      throwsArgumentError,
    );
  });

  test('deleting a project removes its owned data and links', () async {
    final project = await db.projectsDao.createProject(name: 'Delete me');
    final entry = await db.projectsDao.recordObservation(
      projectId: project,
      observedResult: 'Temporary result',
      evidence: 'Temporary evidence',
    );
    await db
        .into(db.relations)
        .insert(
          RelationsCompanion.insert(
            id: 'project-link',
            sourceType: 'entity',
            sourceId: project,
            targetType: 'decision',
            targetId: 'decision-1',
            relationType: 'supports',
          ),
        );

    await db.projectsDao.deleteProject(project);

    expect(await db.projectsDao.findProject(project), isNull);
    expect(await db.projectsDao.getHistory(project), isEmpty);
    expect(
      await (db.select(
        db.projectEntryEvidence,
      )..where((row) => row.entryId.equals(entry))).get(),
      isEmpty,
    );
    expect(
      await (db.select(
        db.relations,
      )..where((row) => row.sourceId.equals(project))).get(),
      isEmpty,
    );
  });

  test('correction appends a replacement and preserves the original', () async {
    final project = await db.projectsDao.createProject(name: 'Correction test');
    final intent = await db.projectsDao.recordIntent(
      projectId: project,
      focus: 'Try the first approach',
    );
    final correction = await db.projectsDao.correctEntry(
      projectId: project,
      targetEntryId: intent,
      focus: 'Try the revised approach',
    );

    final history = await db.projectsDao.getHistory(project);
    expect(
      history.singleWhere((entry) => entry.id == intent).focus,
      'Try the first approach',
    );
    final corrected = history.singleWhere((entry) => entry.id == correction);
    expect(corrected.kind, 'correction');
    expect(corrected.correctionTargetId, intent);
    expect(corrected.rootEntryId, intent);
  });

  test('search results include the project name for provenance', () async {
    final project = await db.projectsDao.createProject(name: 'Audio research');
    await db.projectsDao.recordObservation(
      projectId: project,
      observedResult: 'The useful microphone range is narrower than expected',
    );

    final matches = await db.projectsDao.searchEntries('microphone');
    expect(matches, hasLength(1));
    expect(matches.single.projectName, 'Audio research');
    expect(matches.single.entry.projectEntityId, project);
  });

  test(
    'decision review saves exact project citations and links the decision',
    () async {
      final project = await db.projectsDao.createProject(
        name: 'Reviewable project',
      );
      await db.decisionsDao.insertDecision(
        DecisionsCompanion.insert(
          id: 'decision-1',
          title: 'Continue?',
          type: 'technical',
        ),
      );
      final entry = await db.projectsDao.recordObservation(
        projectId: project,
        observedResult: 'The observed result is recorded.',
      );

      await db.projectsDao.saveDecisionReviewWithCitations(
        review: DecisionReviewsCompanion.insert(
          id: 'review-1',
          decisionId: 'decision-1',
          currentView: const Value('Draft confirmed by the user.'),
        ),
        projectId: project,
        entryIds: [entry],
      );

      final citations = await (db.select(
        db.projectReviewEntries,
      )..where((row) => row.reviewId.equals('review-1'))).get();
      final relation = await (db.select(
        db.relations,
      )..where((row) => row.sourceId.equals(project))).getSingle();
      expect(citations.single.entryId, entry);
      expect(relation.targetId, 'decision-1');
    },
  );
}
