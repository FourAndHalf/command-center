import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/design_tokens.dart';
import '../../app/providers.dart';
import '../../data/database.dart';
import '../../widgets/command_header.dart';
import '../../widgets/section_header.dart';

class ProjectWeeklyComparisonScreen extends ConsumerStatefulWidget {
  const ProjectWeeklyComparisonScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<ProjectWeeklyComparisonScreen> createState() =>
      _ProjectWeeklyComparisonScreenState();
}

class _ProjectWeeklyComparisonScreenState
    extends ConsumerState<ProjectWeeklyComparisonScreen> {
  late DateTime _weekStart;

  @override
  void initState() {
    super.initState();
    _weekStart = _startOfWeek(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    return StreamBuilder<List<ProjectEntry>>(
      stream: db.projectsDao.watchHistory(widget.projectId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: const CommandHeader(title: 'Weekly comparison'),
            body: Center(
              child: Text('Comparison unavailable: ${snapshot.error}'),
            ),
          );
        }
        final entries = snapshot.data ?? const <ProjectEntry>[];
        final range = _rangeFor(entries);
        return Scaffold(
          appBar: const CommandHeader(title: 'Weekly comparison'),
          body: ListView(
            padding: const EdgeInsets.all(AppSpacing.marginMobile),
            children: [
              _weekHeader(),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Read-only comparison. It does not require a Decision and does not infer whether a session was successful.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: AppSpacing.md),
              if (range.intents.isEmpty && range.observations.isEmpty)
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Text(
                      'No records in these dates. Change weeks or record a session.',
                    ),
                  ),
                )
              else ...[
                _expectedSection(range),
                _observedSection(range),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _weekHeader() {
    final end = _weekStart.add(const Duration(days: 6));
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Row(
          children: [
            IconButton(
              tooltip: 'Previous week',
              onPressed: () => setState(
                () => _weekStart = _weekStart.subtract(const Duration(days: 7)),
              ),
              icon: const Icon(Icons.chevron_left),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${_dateLabel(_weekStart)} – ${_dateLabel(end)}',
                    textAlign: TextAlign.center,
                    style: AppTypography.headlineMd,
                  ),
                  TextButton(
                    onPressed: () => setState(
                      () => _weekStart = _startOfWeek(DateTime.now()),
                    ),
                    child: const Text('Current week'),
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Next week',
              onPressed: () => setState(
                () => _weekStart = _weekStart.add(const Duration(days: 7)),
              ),
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }

  Widget _expectedSection(_ComparisonRange range) {
    final matched = range.intents.where(
      (intent) => range.observations.any(
        (observation) => observation.relatedEntryId == intent.id,
      ),
    );
    final unmatched = range.intents.where(
      (intent) => !matched.contains(intent),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Expected', icon: Icons.outlined_flag),
        for (final intent in matched)
          _pairedCard(
            title: intent.focus ?? 'Untitled plan',
            detail: intent.expectedEvidence,
            label: 'Observed result recorded',
            tone: Colors.teal,
          ),
        for (final intent in unmatched)
          _pairedCard(
            title: intent.focus ?? 'Untitled plan',
            detail: intent.expectedEvidence,
            label: 'No result recorded in this week',
            tone: Colors.amber,
          ),
      ],
    );
  }

  Widget _observedSection(_ComparisonRange range) {
    final plannedIds = range.intents.map((intent) => intent.id).toSet();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Observed', icon: Icons.visibility_outlined),
        for (final observation in range.observations)
          _pairedCard(
            title: observation.observedResult ?? 'Observed result',
            detail: observation.nextStep,
            label:
                observation.relatedEntryId != null &&
                    plannedIds.contains(observation.relatedEntryId)
                ? 'Linked to an expected plan'
                : observation.relatedEntryId == null
                ? 'No prior plan selected'
                : 'Linked plan is outside these dates',
            tone: Colors.blue,
          ),
      ],
    );
  }

  Widget _pairedCard({
    required String title,
    required String? detail,
    required String label,
    required Color tone,
  }) => Card(
    child: ListTile(
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: tone.withValues(alpha: 0.18),
        child: Icon(Icons.circle, size: 10, color: tone),
      ),
      title: Text(title),
      subtitle: Text(
        [
          label,
          if (detail != null && detail.trim().isNotEmpty) detail,
        ].join('\n'),
      ),
    ),
  );

  _ComparisonRange _rangeFor(List<ProjectEntry> entries) {
    final end = _weekStart.add(const Duration(days: 7));
    bool inWeek(ProjectEntry entry) {
      final day = DateTime.tryParse(entry.localDay);
      return day != null && !day.isBefore(_weekStart) && day.isBefore(end);
    }

    final intents = entries
        .where(
          (entry) =>
              entry.logicalKind == 'intent' &&
              entry.kind == 'intent' &&
              inWeek(entry),
        )
        .toList();
    final observations = entries
        .where((entry) => entry.logicalKind == 'observation' && inWeek(entry))
        .toList();
    return _ComparisonRange(intents: intents, observations: observations);
  }

  static DateTime _startOfWeek(DateTime date) {
    final day = DateTime(date.year, date.month, date.day);
    return day.subtract(Duration(days: day.weekday - DateTime.monday));
  }

  static String _dateLabel(DateTime date) =>
      '${date.month}/${date.day}/${date.year}';
}

class _ComparisonRange {
  const _ComparisonRange({required this.intents, required this.observations});

  final List<ProjectEntry> intents;
  final List<ProjectEntry> observations;
}
