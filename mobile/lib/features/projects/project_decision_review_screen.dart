import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../app/design_tokens.dart';
import '../../app/providers.dart';
import '../../data/database.dart';
import '../../services/ai_review_client.dart';
import '../../widgets/command_header.dart';
import '../../widgets/section_header.dart';

class ProjectDecisionReviewScreen extends ConsumerStatefulWidget {
  const ProjectDecisionReviewScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<ProjectDecisionReviewScreen> createState() =>
      _ProjectDecisionReviewScreenState();
}

class _ProjectDecisionReviewScreenState
    extends ConsumerState<ProjectDecisionReviewScreen> {
  final _actualController = TextEditingController();
  final _lessonController = TextEditingController();
  final _perspectiveController = TextEditingController();
  String? _decisionId;
  final _selectedEntryIds = <String>{};
  bool _loadingPerspective = false;
  bool _saving = false;

  @override
  void dispose() {
    _actualController.dispose();
    _lessonController.dispose();
    _perspectiveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: const CommandHeader(title: 'Decision review'),
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          db.decisionsDao.watchAll().first,
          db.projectsDao.getHistory(widget.projectId),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Review unavailable: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final decisions = snapshot.data![0] as List<Decision>;
          final entries = (snapshot.data![1] as List<ProjectEntry>)
              .where((entry) => entry.kind != 'setup')
              .toList();
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.marginMobile),
            children: [
              const Text(
                'Select a real decision and the project records you want to review together. The external perspective is optional and editable.',
              ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                initialValue: _decisionId,
                decoration: const InputDecoration(labelText: 'Decision *'),
                items: [
                  for (final decision in decisions)
                    DropdownMenuItem(
                      value: decision.id,
                      child: Text(decision.title),
                    ),
                ],
                onChanged: (value) => setState(() => _decisionId = value),
              ),
              const SectionHeader(
                title: 'Evidence to cite',
                icon: Icons.fact_check_outlined,
              ),
              for (final entry in entries)
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _selectedEntryIds.contains(entry.id),
                  title: Text(_entryTitle(entry)),
                  subtitle: Text('${entry.localDay} · ${entry.logicalKind}'),
                  onChanged: (selected) => setState(() {
                    if (selected == true) {
                      _selectedEntryIds.add(entry.id);
                    } else {
                      _selectedEntryIds.remove(entry.id);
                    }
                  }),
                ),
              const SectionHeader(
                title: 'Your review',
                icon: Icons.edit_note_outlined,
              ),
              _field('What actually happened?', _actualController),
              _field('Lesson learned', _lessonController),
              const SizedBox(height: AppSpacing.sm),
              _aiDisclosure(),
              TextField(
                controller: _perspectiveController,
                maxLines: 8,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  labelText: 'Third-person perspective draft (editable)',
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              OutlinedButton.icon(
                onPressed: _canGenerate && !_loadingPerspective
                    ? () => _generatePerspective(decisions, entries)
                    : null,
                icon: _loadingPerspective
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.auto_awesome_outlined),
                label: Text(
                  _loadingPerspective
                      ? 'Requesting perspective…'
                      : 'Get third-person perspective',
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              FilledButton(
                onPressed: _canSave && !_saving ? () => _saveReview(db) : null,
                child: Text(_saving ? 'Saving…' : 'Save decision review'),
              ),
            ],
          );
        },
      ),
    );
  }

  bool get _canGenerate => _decisionId != null && _selectedEntryIds.isNotEmpty;

  bool get _canSave =>
      _decisionId != null &&
      _selectedEntryIds.isNotEmpty &&
      (_actualController.text.trim().isNotEmpty ||
          _lessonController.text.trim().isNotEmpty ||
          _perspectiveController.text.trim().isNotEmpty);

  Widget _field(String label, TextEditingController controller) => Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.md),
    child: TextField(
      controller: controller,
      maxLines: 3,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(labelText: label),
    ),
  );

  Widget _aiDisclosure() => Card(
    child: Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Text(
        'Optional AI perspective: selected decision details and project records will be sent to the configured provider. The response is a draft until you edit and save it. No API key or personal content is logged by the app.',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ),
  );

  Future<void> _generatePerspective(
    List<Decision> decisions,
    List<ProjectEntry> entries,
  ) async {
    final decision = decisions.firstWhere((item) => item.id == _decisionId);
    final selected = entries.where(
      (entry) => _selectedEntryIds.contains(entry.id),
    );
    final settings = ref.read(aiReviewSettingsProvider);
    setState(() => _loadingPerspective = true);
    try {
      final text =
          await AiReviewClient(
            apiKey: settings.apiKey,
            model: settings.model,
          ).generatePerspective(
            ReviewPerspectiveInput(
              decisionTitle: decision.title,
              decisionObjective: decision.objective,
              expectedOutcome: decision.expectedOutcome,
              entries: [
                for (final entry in selected)
                  ReviewPerspectiveEntry(
                    kind: entry.logicalKind,
                    recordedAt: entry.recordedAt,
                    occurredAt: entry.occurredAt,
                    focus: entry.focus,
                    expectedEvidence: entry.expectedEvidence,
                    observedResult: entry.observedResult,
                    blocker: entry.blocker,
                    lesson: entry.lesson,
                    nextStep: entry.nextStep,
                  ),
              ],
            ),
          );
      if (mounted) {
        _perspectiveController.text = text;
        setState(() {});
      }
    } on AiReviewException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.message)));
      }
    } finally {
      if (mounted) setState(() => _loadingPerspective = false);
    }
  }

  Future<void> _saveReview(AppDatabase db) async {
    setState(() => _saving = true);
    try {
      await db.projectsDao.saveDecisionReviewWithCitations(
        review: DecisionReviewsCompanion.insert(
          id: const Uuid().v4(),
          decisionId: _decisionId!,
          whatActuallyHappened: Value(_nullIfBlank(_actualController.text)),
          lesson: Value(_nullIfBlank(_lessonController.text)),
          currentView: Value(_nullIfBlank(_perspectiveController.text)),
        ),
        projectId: widget.projectId,
        entryIds: _selectedEntryIds.toList(),
      );
      if (mounted) context.go('/projects/${widget.projectId}');
    } catch (error) {
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not save review: $error')),
        );
      }
    }
  }

  String _entryTitle(ProjectEntry entry) =>
      entry.observedResult ?? entry.focus ?? entry.lesson ?? 'Project record';

  String? _nullIfBlank(String value) =>
      value.trim().isEmpty ? null : value.trim();
}
