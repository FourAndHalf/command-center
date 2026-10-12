import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/design_tokens.dart';
import '../../widgets/command_header.dart';
import 'timeline_entry.dart';
import 'timeline_provider.dart';
import 'timeline_widgets.dart';

enum _Filter { all, decisions, reviews, goals, projects, signals }

bool _matches(_Filter f, TimelineEntry e) => switch (f) {
  _Filter.all => true,
  _Filter.decisions => e.kind == TimelineKind.decision,
  _Filter.reviews => e.kind == TimelineKind.review,
  _Filter.goals => e.kind == TimelineKind.goal,
  _Filter.projects => e.kind == TimelineKind.project,
  _Filter.signals => e.side == TimelineSide.right,
};

/// Chronological life timeline (docs/prompt.md §17). A spine runs down the
/// middle: decisions, reviews and goals on the left, the signals around
/// them (events, risks, advice, check-ins) on the right. Filtering by
/// date/entity/importance is a follow-up.
class TimelineScreen extends ConsumerStatefulWidget {
  const TimelineScreen({super.key});

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
  _Filter _filter = _Filter.all;

  @override
  Widget build(BuildContext context) {
    final all = ref.watch(timelineEntriesProvider);
    final entries = all.where((e) => _matches(_filter, e)).toList();

    final children = <Widget>[];
    DateTime? month;
    for (final e in entries) {
      if (month == null ||
          month.year != e.date.year ||
          month.month != e.date.month) {
        month = e.date;
        children.add(TimelineMonthHeader(date: e.date));
      }
      children.add(TimelineRow(entry: e));
    }

    return Scaffold(
      appBar: const CommandHeader(title: 'Timeline'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.marginMobile,
              AppSpacing.sm,
              AppSpacing.marginMobile,
              0,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final (f, label) in const [
                    (_Filter.all, 'All'),
                    (_Filter.decisions, 'Decisions'),
                    (_Filter.reviews, 'Reviews'),
                    (_Filter.goals, 'Goals'),
                    (_Filter.projects, 'Projects'),
                    (_Filter.signals, 'Signals'),
                  ])
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(label),
                        selected: _filter == f,
                        onSelected: (_) => setState(() => _filter = f),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: entries.isEmpty
                ? const Center(child: Text('Nothing recorded yet.'))
                : ListView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.marginMobile,
                      0,
                      AppSpacing.marginMobile,
                      AppSpacing.lg,
                    ),
                    children: children,
                  ),
          ),
        ],
      ),
    );
  }
}
