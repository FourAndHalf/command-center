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
}
