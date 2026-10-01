import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../app/design_tokens.dart';
import '../../app/providers.dart';
import '../../data/database.dart';
import '../../widgets/command_header.dart';
import '../../widgets/stat_tile.dart';
import '../../widgets/status_badge.dart';

enum _Filter { all, active, pending, underReview }

/// The decision log (design/decisions-screen.png): filter chips over a
/// "conviction log" of decision cards, each showing its category, recorded
/// confidence, current tripwire/alert/risk state, and outcome once
/// reviewed.
class DecisionsListScreen extends ConsumerStatefulWidget {
  const DecisionsListScreen({super.key});

  @override
  ConsumerState<DecisionsListScreen> createState() => _DecisionsListScreenState();
}

class _DecisionsListScreenState extends ConsumerState<DecisionsListScreen> {
  _Filter _filter = _Filter.all;

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: CommandHeader(
        title: 'Decisions',
        onCapture: () => context.push('/decisions/new'),
      ),
      body: StreamBuilder<List<Decision>>(
        stream: db.decisionsDao.watchAll(),
        builder: (context, snapshot) {
          final all = snapshot.data ?? [];
          return StreamBuilder<List<ReviewSchedule>>(
            stream: db.schedulesDao.watchDueToday(),
            builder: (context, dueSnap) {
              return StreamBuilder<List<ReviewSchedule>>(
                stream: db.schedulesDao.watchOverdue(),
                builder: (context, overdueSnap) {
                  final underReviewIds = <String?>{
                    for (final s in [...(dueSnap.data ?? []), ...(overdueSnap.data ?? [])])
                      if (s.decisionId != null) s.decisionId,
                  };

                  final filtered = switch (_filter) {
                    _Filter.all => all,
                    _Filter.active => all.where((d) => d.status == 'active').toList(),
                    _Filter.pending => all.where((d) => d.status == 'pending').toList(),
                    _Filter.underReview =>
                      all.where((d) => underReviewIds.contains(d.id)).toList(),
                  };

                  return ListView(
                    padding: const EdgeInsets.all(AppSpacing.marginMobile),
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: StatTile(
                              label: 'Active',
                              value: '${all.where((d) => d.status == 'active').length}'
                                  .padLeft(2, '0'),
                              sublabel: 'In flight',
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: StatTile(
                              label: 'Pending',
                              value: '${all.where((d) => d.status == 'pending').length}'
                                  .padLeft(2, '0'),
                              sublabel: 'Undecided',
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: StatTile(
                              label: 'Review due',
                              value: '${underReviewIds.length}'.padLeft(2, '0'),
                              sublabel: 'Under review',
                              accent: underReviewIds.isNotEmpty
                                  ? AppColors.tripwireAmber
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      _filterChips(all, underReviewIds),
                      const SizedBox(height: AppSpacing.md),
                      if (filtered.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 48),
                          child: Center(child: Text('No decisions in this view.')),
                        )
                      else
                        for (final d in filtered)
                          _DecisionCard(
                            decision: d,
                            isUnderReview: underReviewIds.contains(d.id),
                          ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _filterChips(List<Decision> all, Set<String?> underReviewIds) {
    final activeCount = all.where((d) => d.status == 'active').length;
    final pendingCount = all.where((d) => d.status == 'pending').length;
    final underReviewCount = all.where((d) => underReviewIds.contains(d.id)).length;

    Widget chip(_Filter f, String label) {
      final selected = _filter == f;
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ChoiceChip(
          label: Text(label),
          selected: selected,
          onSelected: (_) => setState(() => _filter = f),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          chip(_Filter.all, 'All (${all.length})'),
          chip(_Filter.active, 'Active ($activeCount)'),
          chip(_Filter.pending, 'Pending ($pendingCount)'),
          chip(_Filter.underReview, 'Under review ($underReviewCount)'),
        ],
      ),
    );
  }
}

class _DecisionCard extends ConsumerWidget {
  const _DecisionCard({required this.decision, required this.isUnderReview});

  final Decision decision;
  final bool isUnderReview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        onTap: () => context.push('/decisions/${decision.id}'),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  StatusBadge(decision.type),
                  if (decision.confidence != null) ...[
                    const SizedBox(width: 8),
                    Text(
                      '${decision.confidence}% conv',
                      style: AppTypography.monoMetric.copyWith(color: AppColors.outline),
                    ),
                  ],
                  const Spacer(),
                  if (isUnderReview)
                    const StatusBadge('Review due', tone: BadgeTone.tripwire)
                  else if (decision.status == 'pending')
                    const StatusBadge('Pending', tone: BadgeTone.calibration),
                ],
              ),
              const SizedBox(height: 8),
              Text(decision.title, style: AppTypography.headlineMd.copyWith(fontSize: 18)),
              if (decision.objective?.isNotEmpty ?? false) ...[
                const SizedBox(height: 4),
                Text(
                  decision.objective!,
                  style: AppTypography.bodySm,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              StreamBuilder<List<ReviewSchedule>>(
                stream: db.schedulesDao.watchUpcoming(withinDays: 36500),
                builder: (context, schedSnap) {
                  final tripwire = (schedSnap.data ?? [])
                      .where((s) => s.decisionId == decision.id && s.kind == 'tripwire')
                      .firstOrNull;
                  if (tripwire == null) return const SizedBox.shrink();
                  final condition = tripwire.triggerConfig?['condition'] as String?;
                  return Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.sm),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: AppColors.tripwireAmber.withValues(alpha: 0.08),
                        border: Border.all(
                          color: AppColors.tripwireAmber.withValues(alpha: 0.25),
                        ),
                        borderRadius: BorderRadius.circular(AppRadius.sm * 2),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, size: 6, color: AppColors.tripwireAmber),
                          const SizedBox(width: 6),
                          Text('TRIPWIRE:', style: AppTypography.labelCaps.copyWith(
                            color: AppColors.tripwireAmber,
                          )),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              condition ?? '—',
                              style: AppTypography.bodySm,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          TextButton(
                            onPressed: () => db.schedulesDao.dismiss(tripwire.id),
                            child: const Text('Clear'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Text(
                    'Decided: ${DateFormat('MMM d').format(decision.decisionAt ?? decision.createdAt)}',
                    style: AppTypography.labelCaps.copyWith(color: AppColors.outline),
                  ),
                  const Spacer(),
                  Icon(Icons.chevron_right, size: 18, color: AppColors.outline),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
