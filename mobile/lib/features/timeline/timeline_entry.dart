import '../../data/database.dart';
import '../../widgets/status_badge.dart';

enum TimelineKind { decision, review, goal, event, risk, advice, checkin }

/// Left of the spine: the things the user decided/reviewed/aimed for.
/// Right: the signals around them (events, risks, advice, check-ins).
enum TimelineSide { left, right }

class TimelineEntry {
  const TimelineEntry({
    required this.kind,
    required this.date,
    required this.title,
    required this.badge,
    this.tone = BadgeTone.neutral,
    this.subtitle,
    this.parent,
    this.route,
  });

  final TimelineKind kind;
  final DateTime date;
  final String title;
  final String badge;
  final BadgeTone tone;
  final String? subtitle;

  /// Title of the decision/goal this signal belongs to, when it has one.
  final String? parent;

  /// Detail route to push on tap; null when no detail screen exists yet.
  final String? route;

  TimelineSide get side => switch (kind) {
        TimelineKind.decision ||
        TimelineKind.review ||
        TimelineKind.goal =>
          TimelineSide.left,
        _ => TimelineSide.right,
      };
}

String? _firstNonEmpty(List<String?> values) {
  for (final v in values) {
    if (v != null && v.trim().isNotEmpty) return v.trim();
  }
  return null;
}

/// Merges every timeline source into one newest-first list.
List<TimelineEntry> buildTimelineEntries({
  required List<Decision> decisions,
  required List<DecisionReview> reviews,
  required List<Goal> goals,
  required List<Event> events,
  required List<DecisionRisk> risks,
  required List<DecisionAdviceData> advice,
  required List<GoalCheckin> checkins,
}) {
  final decisionTitles = {for (final d in decisions) d.id: d.title};
  final decisionRoutes = {for (final d in decisions) d.id: '/decisions/${d.id}'};
  final goalTitles = {for (final g in goals) g.id: g.title};

  final entries = <TimelineEntry>[
    for (final d in decisions)
      TimelineEntry(
        kind: TimelineKind.decision,
        date: d.decisionAt ?? d.createdAt,
        title: d.title,
        badge: d.type,
        subtitle: d.status,
        route: '/decisions/${d.id}',
      ),
    for (final r in reviews)
      TimelineEntry(
        kind: TimelineKind.review,
        date: r.reviewedAt,
        title: decisionTitles[r.decisionId] ?? 'Decision',
        badge: 'Review',
        tone: BadgeTone.resolved,
        subtitle: _firstNonEmpty([r.lesson, r.whatActuallyHappened]),
        route: decisionRoutes[r.decisionId],
      ),
    for (final g in goals)
      TimelineEntry(
        kind: TimelineKind.goal,
        date: g.targetDate ?? g.createdAt,
        title: g.title,
        badge: 'Goal',
        tone: BadgeTone.calibration,
        subtitle: g.targetDate == null ? 'Created' : 'Target date',
        route: '/goals/${g.id}',
      ),
    for (final e in events)
      TimelineEntry(
        kind: TimelineKind.event,
        date: e.occurredAt,
        title: e.title,
        badge: e.type ?? 'Event',
        subtitle: e.description,
      ),
    for (final r in risks)
      TimelineEntry(
        kind: TimelineKind.risk,
        date: r.notedAt,
        title: r.statement,
        badge: 'Risk',
        tone: BadgeTone.tripwire,
        parent: decisionTitles[r.decisionId],
        route: decisionRoutes[r.decisionId],
      ),
    for (final a in advice)
      TimelineEntry(
        kind: TimelineKind.advice,
        date: a.givenAt,
        title: a.adviceText,
        badge: 'Advice',
        parent: decisionTitles[a.decisionId],
        route: decisionRoutes[a.decisionId],
      ),
    for (final c in checkins)
      TimelineEntry(
        kind: TimelineKind.checkin,
        date: c.checkedAt,
        title: _firstNonEmpty([c.notes]) ?? 'Check-in',
        badge: 'Check-in',
        parent: goalTitles[c.goalId],
        route: '/goals/${c.goalId}',
      ),
  ]..sort((a, b) => b.date.compareTo(a.date));
  return entries;
}
