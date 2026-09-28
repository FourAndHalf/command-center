import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../app/design_tokens.dart';
import '../../app/providers.dart';
import '../../data/database.dart';
import '../../widgets/command_header.dart';
import '../../widgets/section_header.dart';
import '../../widgets/stat_tile.dart';
import '../../widgets/status_badge.dart';

const horizons = [
  'this_month',
  'this_quarter',
  '1_year',
  '3_years',
  '5_years',
  '10_years',
  'open_ended',
];

const horizonLabels = {
  'this_month': 'This Month',
  'this_quarter': 'This Quarter',
  '1_year': '1 Year',
  '3_years': '3 Years',
  '5_years': '5 Years',
  '10_years': '10 Years',
  'open_ended': 'Open-Ended / North Star',
};

/// The goals screen (design/goals-screen.png): a summary of active goals
/// across horizons, filterable by horizon, each goal card showing its
/// status, recorded check-ins, and progress toward its target date where
/// one is set.
class GoalsListScreen extends ConsumerStatefulWidget {
  const GoalsListScreen({super.key});

  @override
  ConsumerState<GoalsListScreen> createState() => _GoalsListScreenState();
}

class _GoalsListScreenState extends ConsumerState<GoalsListScreen> {
  String? _horizonFilter; // null = all

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: CommandHeader(
        title: 'Goals',
        onCapture: () => _createGoal(context, db),
      ),
      body: StreamBuilder<List<Goal>>(
        stream: db.goalsDao.watchAll(),
        builder: (context, snapshot) {
          final goals = snapshot.data ?? [];
          final active = goals.where((g) => g.status == 'active').toList();
          final horizonsUsed = goals.map((g) => g.horizon).toSet();

          final visible = _horizonFilter == null
              ? goals
              : goals.where((g) => g.horizon == _horizonFilter).toList();

          final byHorizon = <String, List<Goal>>{};
          for (final g in visible) {
            byHorizon.putIfAbsent(g.horizon, () => []).add(g);
          }

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.marginMobile),
            children: [
              _summaryCard(context, db, goals, active, horizonsUsed),
              const SizedBox(height: AppSpacing.md),
              _horizonChips(goals),
              for (final h in horizons)
                if (byHorizon[h]?.isNotEmpty ?? false) ...[
                  SectionHeader(
                    title: horizonLabels[h]!,
                    trailing: StatusBadge(
                      '${byHorizon[h]!.where((g) => g.status == 'active').length} active',
                    ),
                  ),
                  for (final g in byHorizon[h]!) _GoalCard(goal: g),
                ],
              const SizedBox(height: AppSpacing.xl),
            ],
          );
        },
      ),
    );
  }

  Widget _summaryCard(
    BuildContext context,
    AppDatabase db,
    List<Goal> goals,
    List<Goal> active,
    Set<String> horizonsUsed,
  ) {
    return StreamBuilder<List<Goal>>(
      stream: db.goalsDao.watchAll(),
      builder: (context, _) {
        return FutureBuilder<int>(
          future: _totalCheckins(db, goals),
          builder: (context, checkinSnap) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${active.length} Active',
                                style: AppTypography.headlineLg.copyWith(fontSize: 24),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Anchored across ${horizonsUsed.length} temporal horizons',
                                style: AppTypography.bodySm,
                              ),
                            ],
                          ),
                        ),
                        FilledButton.icon(
                          onPressed: () => _createGoal(context, db),
                          icon: const Icon(Icons.add, size: 18),
                          label: const Text('New goal'),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        Expanded(
                          child: StatTile(
                            label: 'Total goals',
                            value: '${goals.length}',
                            sublabel: 'Recorded',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: StatTile(
                            label: 'Achieved',
                            value: '${goals.where((g) => g.status == 'achieved').length}',
                            sublabel: 'Completed',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: StatTile(
                            label: 'Check-ins',
                            value: '${checkinSnap.data ?? 0}',
                            sublabel: 'Logged',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<int> _totalCheckins(AppDatabase db, List<Goal> goals) async {
    var total = 0;
    for (final g in goals) {
      total += (await db.goalsDao.watchCheckins(g.id).first).length;
    }
    return total;
  }

  Widget _horizonChips(List<Goal> goals) {
    Widget chip(String? h, String label) {
      final selected = _horizonFilter == h;
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ChoiceChip(
          label: Text(label),
          selected: selected,
          onSelected: (_) => setState(() => _horizonFilter = h),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            chip(null, 'All horizons (${goals.length})'),
            for (final h in horizons)
              if (goals.any((g) => g.horizon == h))
                chip(h, '${horizonLabels[h]} (${goals.where((g) => g.horizon == h).length})'),
          ],
        ),
      ),
    );
  }

  Future<void> _createGoal(BuildContext context, AppDatabase db) async {
    final titleCtrl = TextEditingController();
    final whyCtrl = TextEditingController();
    String horizon = '1_year';

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => StatefulBuilder(
        builder: (sheetContext, setSheetState) => Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: 'Goal'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: whyCtrl,
                decoration: const InputDecoration(labelText: 'Why'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: horizon,
                items: horizons
                    .map((h) => DropdownMenuItem(
                        value: h, child: Text(horizonLabels[h]!)))
                    .toList(),
                onChanged: (v) => setSheetState(() => horizon = v!),
                decoration: const InputDecoration(labelText: 'Horizon'),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    if (titleCtrl.text.trim().isEmpty) return;
                    await db.goalsDao.insertGoal(GoalsCompanion.insert(
                      id: const Uuid().v4(),
                      title: titleCtrl.text.trim(),
                      horizon: horizon,
                      why: Value(whyCtrl.text.trim()),
                    ));
                    if (sheetContext.mounted) Navigator.pop(sheetContext);
                  },
                  child: const Text('Save goal'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GoalCard extends ConsumerWidget {
  const _GoalCard({required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final isNorthStar = goal.horizon == 'open_ended';

    return Card(
      color: isNorthStar ? AppColors.surfaceContainer : null,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        onTap: () => context.push('/goals/${goal.id}'),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (isNorthStar) const StatusBadge('North star', tone: BadgeTone.calibration),
                  if (isNorthStar) const SizedBox(width: 8),
                  StatusBadge(_statusLabel(goal.status), tone: _statusTone(goal.status)),
                  const Spacer(),
                  StreamBuilder<List<GoalCheckin>>(
                    stream: db.goalsDao.watchCheckins(goal.id),
                    builder: (context, snap) {
                      final checkins = snap.data ?? [];
                      if (checkins.isEmpty) return const SizedBox.shrink();
                      final latest = checkins
                          .reduce((a, b) => a.checkedAt.isAfter(b.checkedAt) ? a : b);
                      final days = DateTime.now().difference(latest.checkedAt).inDays;
                      return Text(
                        'Checked in ${days}d ago',
                        style: AppTypography.labelCaps.copyWith(color: AppColors.outline),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(goal.title, style: AppTypography.headlineMd.copyWith(fontSize: 17)),
              if (goal.why?.isNotEmpty ?? false) ...[
                const SizedBox(height: 4),
                Text(goal.why!, style: AppTypography.bodySm, maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
              if (goal.targetDate != null) ...[
                const SizedBox(height: AppSpacing.sm),
                _targetProgress(goal),
              ],
              StreamBuilder<List<GoalCheckin>>(
                stream: db.goalsDao.watchCheckins(goal.id),
                builder: (context, snap) {
                  final count = (snap.data ?? []).length;
                  return Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.sm),
                    child: Text(
                      count == 0 ? 'No check-ins yet' : '$count check-in${count == 1 ? '' : 's'} logged',
                      style: AppTypography.labelCaps.copyWith(color: AppColors.outline),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _targetProgress(Goal goal) {
    final start = goal.createdAt;
    final total = goal.targetDate!.difference(start).inSeconds;
    final elapsed = DateTime.now().difference(start).inSeconds;
    final progress = total > 0 ? (elapsed / total).clamp(0.0, 1.0) : 0.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Time to target', style: AppTypography.labelCaps.copyWith(color: AppColors.outline)),
            Text('${(progress * 100).round()}%', style: AppTypography.monoMetric),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(value: progress, minHeight: 4),
        ),
      ],
    );
  }

  String _statusLabel(String status) => switch (status) {
        'active' => 'On track',
        'paused' => 'Paused',
        'achieved' => 'Achieved',
        'abandoned' => 'Abandoned',
        _ => status,
      };

  BadgeTone _statusTone(String status) => switch (status) {
        'active' => BadgeTone.neutral,
        'achieved' => BadgeTone.resolved,
        'abandoned' => BadgeTone.critical,
        _ => BadgeTone.neutral,
      };
}
