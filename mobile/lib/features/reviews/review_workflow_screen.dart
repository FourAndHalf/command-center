import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../app/providers.dart';
import '../../data/database.dart';
import '../../widgets/command_header.dart';

/// The review workflow (docs/prompt.md §8): the 10 core questions plus 4
/// optional ones. Nothing here is required — an empty field is fine.
class ReviewWorkflowScreen extends ConsumerStatefulWidget {
  const ReviewWorkflowScreen({super.key, required this.scheduleId});

  final String scheduleId;

  @override
  ConsumerState<ReviewWorkflowScreen> createState() => _ReviewWorkflowScreenState();
}

class _ReviewWorkflowScreenState extends ConsumerState<ReviewWorkflowScreen> {
  final _whatHappenedCtrl = TextEditingController();
  final _expectedVsActualCtrl = TextEditingController();
  final _unexpectedCtrl = TextEditingController();
  final _currentViewCtrl = TextEditingController();
  final _lessonCtrl = TextEditingController();
  final _actionCtrl = TextEditingController();
  final _regretCtrl = TextEditingController();
  final _roadNotTakenCtrl = TextEditingController();
  int? _satisfaction;
  int? _nextReviewInDays;

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: const CommandHeader(title: 'Review'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _field('What actually happened?', _whatHappenedCtrl),
          _field('Expected vs. actual', _expectedVsActualCtrl),
          _field('What surprised me / unexpected consequences', _unexpectedCtrl),
          _field('My current view of this decision', _currentViewCtrl),
          _field('Lesson learned', _lessonCtrl),
          _field('What should I continue, change, reverse, or stop?', _actionCtrl),
          const Divider(),
          Text('Optional', style: Theme.of(context).textTheme.titleSmall),
          _satisfactionSlider(),
          _field('Do I regret anything?', _regretCtrl),
          _field(
            'What do I now think the alternative would have done?',
            _roadNotTakenCtrl,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<int?>(
            initialValue: _nextReviewInDays,
            decoration: const InputDecoration(labelText: 'Schedule next review'),
            items: const [
              DropdownMenuItem(value: null, child: Text('No next review')),
              DropdownMenuItem(value: 90, child: Text('90 days')),
              DropdownMenuItem(value: 180, child: Text('180 days')),
              DropdownMenuItem(value: 365, child: Text('365 days')),
            ],
            onChanged: (v) => setState(() => _nextReviewInDays = v),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => _complete(db),
            child: const Text('Complete review'),
          ),
        ],
      ),
    );
  }

  Widget _satisfactionSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Satisfaction: ${_satisfaction ?? '—'}'),
        Slider(
          value: (_satisfaction ?? 3).toDouble(),
          min: 1,
          max: 5,
          divisions: 4,
          onChanged: (v) => setState(() => _satisfaction = v.round()),
        ),
      ],
    );
  }

  Widget _field(String label, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: ctrl,
        maxLines: 2,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Future<void> _complete(dynamic db) async {
    final schedule = await (db.select(db.reviewSchedules)
          ..where((s) => s.id.equals(widget.scheduleId)))
        .getSingleOrNull();
    if (schedule == null) return;

    if (schedule.decisionId != null) {
      await db.reviewsDao.insertReview(DecisionReviewsCompanion.insert(
        id: const Uuid().v4(),
        decisionId: schedule.decisionId!,
        whatActuallyHappened: Value(_whatHappenedCtrl.text.trim()),
        expectedVsActual: Value(_expectedVsActualCtrl.text.trim()),
        unexpectedConsequences: Value(_unexpectedCtrl.text.trim()),
        currentView: Value(_currentViewCtrl.text.trim()),
        lesson: Value(_lessonCtrl.text.trim()),
        action: Value(_actionCtrl.text.trim()),
        satisfaction: Value(_satisfaction),
        regret: Value(_regretCtrl.text.trim()),
        roadNotTaken: Value(_roadNotTakenCtrl.text.trim()),
        nextReview: Value(_nextReviewInDays != null
            ? '$_nextReviewInDays days'
            : null),
      ));
    }

    await db.schedulesDao.complete(
      widget.scheduleId,
      nextDueAt: _nextReviewInDays != null
          ? DateTime.now().add(Duration(days: _nextReviewInDays!))
          : null,
    );

    if (mounted) context.go('/today');
  }
}
