import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../app/providers.dart';
import '../../data/database.dart';

const _decisionTypes = [
  'career',
  'technical',
  'financial',
  'relationship',
  'education',
  'business',
  'personal',
  'lifestyle',
  'other',
];

/// Quick capture by default; the "more detail" section (assumptions, risks,
/// tripwires, review policy) is what an irreversible, high-importance
/// decision should invite (docs/prompt.md §5).
class DecisionCaptureScreen extends ConsumerStatefulWidget {
  const DecisionCaptureScreen({super.key});

  @override
  ConsumerState<DecisionCaptureScreen> createState() =>
      _DecisionCaptureScreenState();
}

class _DecisionCaptureScreenState extends ConsumerState<DecisionCaptureScreen> {
  final _uuid = const Uuid();
  final _titleCtrl = TextEditingController();
  final _objectiveCtrl = TextEditingController();
  final _contextCtrl = TextEditingController();
  final _expectedOutcomeCtrl = TextEditingController();
  String _type = 'personal';
  bool _pending = false;
  DateTime? _decideBy;
  int _importance = 3;
  int _reversibility = 3;
  int _confidence = 70;

  final List<TextEditingController> _assumptionCtrls = [];
  final List<TextEditingController> _riskCtrls = [];
  final List<TextEditingController> _tripwireCtrls = [];

  bool _showMoreDetail = false;
  int? _reviewInDays = 90;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _objectiveCtrl.dispose();
    _contextCtrl.dispose();
    _expectedOutcomeCtrl.dispose();
    for (final c in [..._assumptionCtrls, ..._riskCtrls, ..._tripwireCtrls]) {
      c.dispose();
    }
    super.dispose();
  }

  bool get _suggestsFullDetail => _importance >= 4 && _reversibility <= 2;

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Capture a decision')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _titleCtrl,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _type,
            decoration: const InputDecoration(labelText: 'Type'),
            items: _decisionTypes
                .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                .toList(),
            onChanged: (v) => setState(() => _type = v!),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _objectiveCtrl,
            decoration: const InputDecoration(labelText: 'Objective (one line)'),
          ),
          const SizedBox(height: 16),
          _slider('Importance', _importance, (v) => setState(() => _importance = v)),
          _slider(
            'Reversibility (5 = easy to reverse)',
            _reversibility,
            (v) => setState(() => _reversibility = v),
          ),
          _slider(
            'Confidence (%)',
            _confidence,
            (v) => setState(() => _confidence = v),
            max: 100,
            divisions: 20,
          ),
          SwitchListTile(
            title: const Text('Not decided yet (pending)'),
            value: _pending,
            onChanged: (v) => setState(() => _pending = v),
          ),
          if (_pending)
            ListTile(
              title: Text(_decideBy == null
                  ? 'Set decide-by date'
                  : 'Decide by ${_decideBy!.toLocal()}'.split(' ').first),
              trailing: const Icon(Icons.calendar_month),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 3650)),
                  initialDate: DateTime.now().add(const Duration(days: 14)),
                );
                if (picked != null) setState(() => _decideBy = picked);
              },
            ),
          if (_suggestsFullDetail && !_showMoreDetail)
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: ListTile(
                leading: const Icon(Icons.lightbulb_outline),
                title: const Text(
                  'This looks important and hard to reverse — consider adding more detail.',
                ),
                trailing: TextButton(
                  onPressed: () => setState(() => _showMoreDetail = true),
                  child: const Text('Add detail'),
                ),
              ),
            ),
          TextButton.icon(
            onPressed: () => setState(() => _showMoreDetail = !_showMoreDetail),
            icon: Icon(_showMoreDetail ? Icons.expand_less : Icons.expand_more),
            label: Text(_showMoreDetail ? 'Hide detail' : 'Add more detail'),
          ),
          if (_showMoreDetail) ...[
            const Divider(),
            TextField(
              controller: _contextCtrl,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Context — what was happening?',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _expectedOutcomeCtrl,
              maxLines: 2,
              decoration: const InputDecoration(labelText: 'Expected outcome'),
            ),
            const SizedBox(height: 16),
            _dynamicList(
              'Assumptions',
              'e.g. "I can become employable within 18 months"',
              _assumptionCtrls,
            ),
            _dynamicList(
              'Pre-mortem risks',
              'A year from now this failed. Why?',
              _riskCtrls,
            ),
            _dynamicList(
              'Tripwires',
              'I will reconsider if...',
              _tripwireCtrls,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int?>(
              initialValue: _reviewInDays,
              decoration: const InputDecoration(labelText: 'Review in'),
              items: const [
                DropdownMenuItem(value: null, child: Text('No scheduled review')),
                DropdownMenuItem(value: 7, child: Text('7 days')),
                DropdownMenuItem(value: 30, child: Text('30 days')),
                DropdownMenuItem(value: 90, child: Text('90 days')),
                DropdownMenuItem(value: 180, child: Text('180 days')),
                DropdownMenuItem(value: 365, child: Text('365 days')),
              ],
              onChanged: (v) => setState(() => _reviewInDays = v),
            ),
          ],
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => _save(db),
            child: const Text('Save decision'),
          ),
        ],
      ),
    );
  }

  Widget _slider(String label, int value, ValueChanged<int> onChanged,
      {int max = 5, int? divisions}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $value'),
        Slider(
          value: value.toDouble(),
          min: max == 100 ? 0 : 1,
          max: max.toDouble(),
          divisions: divisions ?? (max - 1),
          onChanged: (v) => onChanged(v.round()),
        ),
      ],
    );
  }

  Widget _dynamicList(
    String title,
    String hint,
    List<TextEditingController> controllers,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () => setState(
                () => controllers.add(TextEditingController()),
              ),
            ),
          ],
        ),
        for (final c in controllers)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextField(
              controller: c,
              decoration: InputDecoration(hintText: hint),
            ),
          ),
      ],
    );
  }

  Future<void> _save(dynamic db) async {
    if (_titleCtrl.text.trim().isEmpty) return;
    final decisionId = _uuid.v4();

    await db.decisionsDao.insertDecision(DecisionsCompanion.insert(
      id: decisionId,
      title: _titleCtrl.text.trim(),
      type: _type,
      status: Value(_pending ? 'pending' : 'active'),
      objective: Value(_objectiveCtrl.text.trim()),
      context: Value(_contextCtrl.text.trim()),
      expectedOutcome: Value(_expectedOutcomeCtrl.text.trim()),
      importance: Value(_importance),
      reversibility: Value(_reversibility),
      confidence: Value(_confidence),
      decideBy: Value(_pending ? _decideBy : null),
    ));

    for (final c in _assumptionCtrls) {
      if (c.text.trim().isEmpty) continue;
      await db.decisionsDao.insertAssumption(AssumptionsCompanion.insert(
        id: _uuid.v4(),
        decisionId: decisionId,
        statement: c.text.trim(),
      ));
    }

    for (final c in _riskCtrls) {
      if (c.text.trim().isEmpty) continue;
      await db.decisionsDao.insertRisk(DecisionRisksCompanion.insert(
        id: _uuid.v4(),
        decisionId: decisionId,
        statement: c.text.trim(),
      ));
    }

    for (final c in _tripwireCtrls) {
      if (c.text.trim().isEmpty) continue;
      await db.schedulesDao.insertSchedule(ReviewSchedulesCompanion.insert(
        id: _uuid.v4(),
        decisionId: Value(decisionId),
        triggerType: 'condition',
        kind: const Value('tripwire'),
        triggerConfig: Value({'condition': c.text.trim()}),
      ));
    }

    if (_pending && _decideBy != null) {
      await db.schedulesDao.insertSchedule(ReviewSchedulesCompanion.insert(
        id: _uuid.v4(),
        decisionId: Value(decisionId),
        triggerType: 'time',
        kind: const Value('decide_by'),
        nextDueAt: Value(_decideBy),
      ));
    }

    if (_reviewInDays != null) {
      await db.schedulesDao.insertSchedule(ReviewSchedulesCompanion.insert(
        id: _uuid.v4(),
        decisionId: Value(decisionId),
        triggerType: 'time',
        kind: const Value('review'),
        nextDueAt: Value(DateTime.now().add(Duration(days: _reviewInDays!))),
      ));
    }

    if (mounted) context.go('/decisions/$decisionId');
  }
}
