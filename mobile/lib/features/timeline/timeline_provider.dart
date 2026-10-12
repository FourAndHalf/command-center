import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../data/database.dart';
import '../../data/daos/projects_dao.dart';
import 'timeline_entry.dart';

final _decisionsProvider = StreamProvider<List<Decision>>(
  (ref) => ref.watch(databaseProvider).decisionsDao.watchAll(),
);
final _reviewsProvider = StreamProvider<List<DecisionReview>>(
  (ref) => ref.watch(databaseProvider).reviewsDao.watchAll(),
);
final _goalsProvider = StreamProvider<List<Goal>>(
  (ref) => ref.watch(databaseProvider).goalsDao.watchAll(),
);
final _eventsProvider = StreamProvider<List<Event>>(
  (ref) => ref.watch(databaseProvider).entitiesDao.watchAllEvents(),
);
final _risksProvider = StreamProvider<List<DecisionRisk>>(
  (ref) => ref.watch(databaseProvider).decisionsDao.watchAllRisks(),
);
final _adviceProvider = StreamProvider<List<DecisionAdviceData>>(
  (ref) => ref.watch(databaseProvider).decisionsDao.watchAllAdvice(),
);
final _checkinsProvider = StreamProvider<List<GoalCheckin>>(
  (ref) => ref.watch(databaseProvider).goalsDao.watchAllCheckins(),
);
final _projectEntriesProvider = StreamProvider<List<ProjectEntrySearchResult>>(
  (ref) => ref.watch(databaseProvider).projectsDao.watchRecentEntries(),
);

/// All timeline entries, newest first. Sources that haven't emitted yet
/// count as empty, so the screen fills in as each stream arrives.
final timelineEntriesProvider = Provider<List<TimelineEntry>>((ref) {
  return buildTimelineEntries(
    decisions: ref.watch(_decisionsProvider).value ?? const [],
    reviews: ref.watch(_reviewsProvider).value ?? const [],
    goals: ref.watch(_goalsProvider).value ?? const [],
    events: ref.watch(_eventsProvider).value ?? const [],
    risks: ref.watch(_risksProvider).value ?? const [],
    advice: ref.watch(_adviceProvider).value ?? const [],
    checkins: ref.watch(_checkinsProvider).value ?? const [],
    projectEntries: ref.watch(_projectEntriesProvider).value ?? const [],
  );
});
