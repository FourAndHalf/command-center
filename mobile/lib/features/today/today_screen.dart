import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' show Value;

import '../../app/design_tokens.dart';
import '../../app/providers.dart';
import '../../data/analytics.dart';
import '../../data/database.dart';
import '../../widgets/command_header.dart';
import '../../widgets/section_header.dart';
import '../../widgets/stat_tile.dart';
import '../../widgets/status_badge.dart';

/// "What deserves my attention right now?" (docs/prompt.md §15), laid out
/// per the Today mockup in design/today-screen.png: a status strip, three
/// stat tiles, overdue reviews, the nearest pending decision, an active
/// watchlist of decisions with upcoming reviews, and a quick signal log.
class TodayScreen extends ConsumerStatefulWidget {
  const TodayScreen({super.key});

  @override
  ConsumerState<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends ConsumerState<TodayScreen> {
  final _signalCtrl = TextEditingController();

  @override
  void dispose() {
    _signalCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: CommandHeader(
        title: 'Today',
        onCapture: () => context.push('/decisions/new'),
      ),
      body: StreamBuilder<List<ReviewSchedule>>(
        stream: db.schedulesDao.watchOverdue(),
        builder: (context, overdueSnap) {
          return StreamBuilder<List<ReviewSchedule>>(
            stream: db.schedulesDao.watchDueToday(),
            builder: (context, dueSnap) {
              return StreamBuilder<List<Decision>>(
                stream: db.decisionsDao.watchByStatus('active'),
                builder: (context, activeSnap) {
                  return StreamBuilder<List<Decision>>(
                    stream: db.decisionsDao.watchByStatus('pending'),
                    builder: (context, pendingSnap) {
                      final overdue = overdueSnap.data ?? [];
                      final due = dueSnap.data ?? [];
                      final active = activeSnap.data ?? [];
                      final pending = pendingSnap.data ?? [];
                      final unresolvedCount = due.length + pending.length;

                      return ListView(
                        padding: const EdgeInsets.all(AppSpacing.marginMobile),
                        children: [
                          _statusStrip(context, db),
                          const SizedBox(height: AppSpacing.md),
                          Row(
                            children: [
                              Expanded(
                                child: StatTile(
                                  label: 'Critical',
                                  value: '${overdue.length}'.padLeft(2, '0'),
                                  sublabel: 'Overdue ret.',
                                  accent: overdue.isNotEmpty
                                      ? AppColors.tripwireAmber
                                      : null,
                                  trailingIcon: Icons.priority_high,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: StatTile(
                                  label: 'In flight',
                                  value: '${active.length}'.padLeft(2, '0'),
                                  sublabel: 'Active track',
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: StatTile(
                                  label: 'Due today',
                                  value: '$unresolvedCount'.padLeft(2, '0'),
                                  sublabel: 'Unresolved',
                                ),
                              ),
                            ],
                          ),
                          if (overdue.isNotEmpty) ...[
                            SectionHeader(
                              title: 'Overdue Reviews',
                              accent: AppColors.tripwireAmber,
                              trailing: const StatusBadge(
                                'Action required',
                                tone: BadgeTone.tripwire,
                              ),
                            ),
                            for (final s in overdue) _overdueCard(context, db, s),
                          ],
                          if (pending.isNotEmpty) ...[
                            SectionHeader(
                              title: 'Pending Decision',
                              icon: Icons.hourglass_bottom,
                            ),
                            for (final d in pending) _pendingCard(context, d),
                          ],
                          if (active.isNotEmpty) ...[
                            const SectionHeader(
                              title: 'Active Watchlist',
                              icon: Icons.visibility_outlined,
                            ),
                            for (final d in active.take(5)) _watchlistCard(db, d),
                          ],
                          const SizedBox(height: AppSpacing.md),
                          _signalLog(db),
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

  Widget _statusStrip(BuildContext context, AppDatabase db) {
    final now = DateTime.now();
    return FutureBuilder<double?>(
      future: Analytics(db).overallCalibration(),
      builder: (context, snap) {
        final calibration = snap.data;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('EEE, MMM d · HH:mm').format(now).toUpperCase(),
              style: AppTypography.labelCaps.copyWith(color: AppColors.outline),
            ),
            StatusBadge(
              calibration == null
                  ? 'Calibrating'
                  : 'Calibrated: ${(calibration * 100).round()}%',
              tone: BadgeTone.calibration,
            ),
          ],
        );
      },
    );
  }

  Widget _overdueCard(BuildContext context, AppDatabase db, ReviewSchedule s) {
    return FutureBuilder<Decision?>(
      future: s.decisionId != null ? db.decisionsDao.getById(s.decisionId!) : null,
      builder: (context, snap) {
        final decision = snap.data;
        final daysOverdue = s.nextDueAt != null
            ? DateTime.now().difference(s.nextDueAt!).inDays
            : 0;
        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(AppRadius.xl),
            onTap: decision == null
                ? null
                : () => context.push('/decisions/${decision.id}'),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    StatusBadge('Due +${daysOverdue}d ago', tone: BadgeTone.tripwire),
                    const Spacer(),
                    Text(_kindLabel(s.kind), style: AppTypography.labelCaps),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  decision?.title ?? 'Review',
                  style: AppTypography.headlineMd.copyWith(fontSize: 17),
                ),
                if (decision?.expectedOutcome?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(AppRadius.sm * 2),
                    ),
                    child: Text(
                      decision!.expectedOutcome!,
                      style: AppTypography.bodySm,
                    ),
                  ),
                ],
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () => context.push('/reviews/${s.id}'),
                        child: const Text('Review now'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: () => db.schedulesDao
                          .snooze(s.id, DateTime.now().add(const Duration(days: 3))),
                      icon: const Icon(Icons.snooze, size: 16),
                      label: const Text('+3d'),
                    ),
                  ],
                ),
              ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _pendingCard(BuildContext context, Decision d) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                StatusBadge(d.type),
                const Spacer(),
                if (d.decideBy != null)
                  Text(
                    'Lock in by ${DateFormat('MMM d').format(d.decideBy!)}',
                    style: AppTypography.labelCaps.copyWith(color: AppColors.outline),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(d.title, style: AppTypography.headlineMd.copyWith(fontSize: 17)),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => context.push('/decisions/${d.id}'),
                icon: const Icon(Icons.arrow_forward, size: 16),
                label: const Text('Finalize decision'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _watchlistCard(AppDatabase db, Decision d) {
    return StreamBuilder<List<ReviewSchedule>>(
      stream: db.schedulesDao.watchUpcoming(withinDays: 3650),
      builder: (context, snap) {
        final schedule = (snap.data ?? [])
            .where((s) => s.decisionId == d.id && s.kind == 'review')
            .firstOrNull;

        double? progress;
        String progressLabel = 'No review scheduled';
        if (schedule?.nextDueAt != null) {
          final start = d.decisionAt ?? d.createdAt;
          final total = schedule!.nextDueAt!.difference(start).inSeconds;
          final elapsed = DateTime.now().difference(start).inSeconds;
          progress = total > 0 ? (elapsed / total).clamp(0.0, 1.0) : null;
          final daysLeft = schedule.nextDueAt!.difference(DateTime.now()).inDays;
          progressLabel = daysLeft >= 0
              ? 'Next review in ${daysLeft}d'
              : 'Review overdue';
        }

        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(AppRadius.xl),
            onTap: () => context.push('/decisions/${d.id}'),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    StatusBadge(d.type),
                    const Spacer(),
                    Icon(Icons.chevron_right, size: 18, color: AppColors.outline),
                  ],
                ),
                const SizedBox(height: 8),
                Text(d.title, style: AppTypography.headlineMd.copyWith(fontSize: 16)),
                const SizedBox(height: 10),
                if (progress != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(value: progress, minHeight: 4),
                  ),
                const SizedBox(height: 6),
                Text(
                  progressLabel,
                  style: AppTypography.labelCaps.copyWith(color: AppColors.outline),
                ),
              ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _signalLog(AppDatabase db) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily calibration', style: AppTypography.labelCaps),
            const SizedBox(height: 4),
            Text(
              'Log a signal, unexpected variable, or state update:',
              style: AppTypography.bodySm,
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _signalCtrl,
                    decoration: const InputDecoration(
                      hintText: 'e.g. AWS cluster cost surge',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: () => _logSignal(db),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _logSignal(AppDatabase db) async {
    final text = _signalCtrl.text.trim();
    if (text.isEmpty) return;
    await db.entitiesDao.insertEvent(EventsCompanion.insert(
      id: const Uuid().v4(),
      title: text,
      occurredAt: DateTime.now(),
      type: const Value('signal'),
    ));
    _signalCtrl.clear();
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Logged to timeline')));
    }
  }

  String _kindLabel(String kind) {
    switch (kind) {
      case 'tripwire':
        return 'TRIPWIRE';
      case 'cooloff':
        return 'COOL-OFF';
      case 'decide_by':
        return 'DECIDE BY';
      case 'reflection':
        return 'REFLECTION';
      default:
        return 'REVIEW';
    }
  }
}
