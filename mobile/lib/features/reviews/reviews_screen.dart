import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../app/design_tokens.dart';
import '../../app/providers.dart';
import '../../data/database.dart';
import '../../widgets/command_header.dart';
import '../../widgets/section_header.dart';
import '../../widgets/stat_tile.dart';
import '../../widgets/status_badge.dart';

/// The audit pipeline (design/reviews-screen.png): overdue and upcoming
/// review schedules with full decision context, plus the most recent
/// completed retrospective.
class ReviewsScreen extends ConsumerWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: const CommandHeader(title: 'Reviews'),
      body: StreamBuilder<List<ReviewSchedule>>(
        stream: db.schedulesDao.watchOverdue(),
        builder: (context, overdueSnap) {
          return StreamBuilder<List<ReviewSchedule>>(
            stream: db.schedulesDao.watchDueToday(),
            builder: (context, dueSnap) {
              return StreamBuilder<List<ReviewSchedule>>(
                stream: db.schedulesDao.watchUpcoming(withinDays: 30),
                builder: (context, upcomingSnap) {
                  return FutureBuilder<int>(
                    future: _completedCount(db),
                    builder: (context, completedSnap) {
                      final overdue = overdueSnap.data ?? [];
                      final dueThisWeek = (dueSnap.data ?? [])
                          .followedBy((upcomingSnap.data ?? [])
                              .where((s) => (s.nextDueAt?.difference(DateTime.now()).inDays ?? 99) <= 7))
                          .toList();
                      final next30 = upcomingSnap.data ?? [];
                      final laterThisWeek = next30
                          .where((s) => (s.nextDueAt?.difference(DateTime.now()).inDays ?? 0) > 7)
                          .toList();

                      return ListView(
                        padding: const EdgeInsets.all(AppSpacing.marginMobile),
                        children: [
                          Text('Audit pipeline', style: AppTypography.labelCaps.copyWith(
                            color: AppColors.outline,
                          )),
                          const SizedBox(height: AppSpacing.sm),
                          Row(
                            children: [
                              Expanded(
                                child: StatTile(
                                  label: 'Overdue',
                                  value: '${overdue.length}',
                                  sublabel: 'Decisions',
                                  accent: overdue.isNotEmpty ? AppColors.tripwireAmber : null,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: StatTile(
                                  label: 'Due this week',
                                  value: '${dueThisWeek.length}',
                                  sublabel: 'Pending',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Row(
                            children: [
                              Expanded(
                                child: StatTile(
                                  label: 'Next 30 days',
                                  value: '${next30.length}',
                                  sublabel: 'Scheduled',
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: StatTile(
                                  label: 'Completed',
                                  value: '${completedSnap.data ?? 0}',
                                  sublabel: 'Audited',
                                ),
                              ),
                            ],
                          ),
                          if (overdue.isNotEmpty) ...[
                            SectionHeader(
                              title: 'Overdue Retrospectives',
                              accent: AppColors.tripwireAmber,
                              trailing: const StatusBadge('Action required', tone: BadgeTone.tripwire),
                            ),
                            for (final s in overdue) _RetrospectiveCard(schedule: s),
                          ],
                          if (dueThisWeek.isNotEmpty) ...[
                            const SectionHeader(title: 'Due This Week', icon: Icons.alarm),
                            for (final s in dueThisWeek) _DueThisWeekCard(schedule: s),
                          ],
                          if (laterThisWeek.isNotEmpty) ...[
                            const SectionHeader(title: 'Upcoming Schedule', icon: Icons.event_note),
                            for (final s in laterThisWeek) _UpcomingRow(schedule: s),
                          ],
                          const SectionHeader(title: 'Recent Retrospective', icon: Icons.history),
                          _RecentRetrospective(db: db),
                          const SizedBox(height: AppSpacing.xl),
                        ],
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<int> _completedCount(AppDatabase db) async =>
      (await db.select(db.decisionReviews).get()).length;
}

class _RetrospectiveCard extends ConsumerWidget {
  const _RetrospectiveCard({required this.schedule});

  final ReviewSchedule schedule;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return FutureBuilder<Decision?>(
      future: schedule.decisionId != null ? db.decisionsDao.getById(schedule.decisionId!) : null,
      builder: (context, snap) {
        final decision = snap.data;
        final daysOverdue = schedule.nextDueAt != null
            ? DateTime.now().difference(schedule.nextDueAt!).inDays
            : 0;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusBadge('$daysOverdue days overdue', tone: BadgeTone.tripwire),
                const SizedBox(height: 8),
                Text(decision?.title ?? 'Decision',
                    style: AppTypography.headlineMd.copyWith(fontSize: 18)),
                if (decision?.expectedOutcome?.isNotEmpty ?? false) ...[
                  const SizedBox(height: AppSpacing.sm),
                  _labeledBlock('Expected outcome', decision!.expectedOutcome!),
                ],
                if (decision?.context?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 8),
                  _labeledBlock('Initial conviction thesis', decision!.context!),
                ],
                const SizedBox(height: AppSpacing.sm),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => context.push('/reviews/${schedule.id}'),
                    icon: const Icon(Icons.arrow_forward, size: 16),
                    label: const Text('Start review workflow'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _labeledBlock(String label, String body) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppRadius.sm * 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: AppTypography.labelCaps.copyWith(color: AppColors.outline)),
          const SizedBox(height: 4),
          Text(body, style: AppTypography.bodySm),
        ],
      ),
    );
  }
}

class _DueThisWeekCard extends ConsumerWidget {
  const _DueThisWeekCard({required this.schedule});

  final ReviewSchedule schedule;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return FutureBuilder<Decision?>(
      future: schedule.decisionId != null ? db.decisionsDao.getById(schedule.decisionId!) : null,
      builder: (context, snap) {
        final decision = snap.data;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    StatusBadge(decision?.type ?? schedule.kind),
                    const Spacer(),
                    if (schedule.nextDueAt != null)
                      Text(DateFormat('MMM d, HH:mm').format(schedule.nextDueAt!),
                          style: AppTypography.monoMetric.copyWith(color: AppColors.outline)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(decision?.title ?? 'Review', style: AppTypography.headlineMd.copyWith(fontSize: 16)),
                const SizedBox(height: AppSpacing.sm),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => context.push('/reviews/${schedule.id}'),
                    child: const Text('Prepare evaluation'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _UpcomingRow extends ConsumerWidget {
  const _UpcomingRow({required this.schedule});

  final ReviewSchedule schedule;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return FutureBuilder<Decision?>(
      future: schedule.decisionId != null ? db.decisionsDao.getById(schedule.decisionId!) : null,
      builder: (context, snap) {
        final decision = snap.data;
        return Card(
          child: ListTile(
            leading: const Icon(Icons.schedule),
            title: Text(decision?.title ?? schedule.kind),
            subtitle: Text(
              '${decision?.type ?? schedule.kind} · ${schedule.nextDueAt != null ? DateFormat('MMM d').format(schedule.nextDueAt!) : '—'}',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/reviews/${schedule.id}'),
          ),
        );
      },
    );
  }
}

class _RecentRetrospective extends StatelessWidget {
  const _RecentRetrospective({required this.db});

  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DecisionReview?>(
      future: _mostRecent(db),
      builder: (context, snap) {
        final review = snap.data;
        if (review == null) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Text('No completed reviews yet.'),
            ),
          );
        }
        return FutureBuilder<Decision?>(
          future: db.decisionsDao.getById(review.decisionId),
          builder: (context, decSnap) {
            final decision = decSnap.data;
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Audited ${DateFormat('MMM d').format(review.reviewedAt)}',
                          style: AppTypography.labelCaps.copyWith(color: AppColors.outline),
                        ),
                        const Spacer(),
                        const StatusBadge('Reviewed', tone: BadgeTone.resolved),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(decision?.title ?? 'Decision',
                        style: AppTypography.headlineMd.copyWith(fontSize: 17)),
                    if (review.satisfaction != null) ...[
                      const SizedBox(height: 6),
                      Text('Satisfaction: ${review.satisfaction}/5',
                          style: AppTypography.monoMetric),
                    ],
                    if (review.lesson?.isNotEmpty ?? false) ...[
                      const SizedBox(height: 6),
                      Text(review.lesson!, style: AppTypography.bodySm),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<DecisionReview?> _mostRecent(AppDatabase db) async {
    final reviews = await db.select(db.decisionReviews).get();
    if (reviews.isEmpty) return null;
    reviews.sort((a, b) => b.reviewedAt.compareTo(a.reviewedAt));
    return reviews.first;
  }
}
