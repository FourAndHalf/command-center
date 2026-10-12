import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/design_tokens.dart';
import '../../app/providers.dart';
import '../../data/database.dart';
import '../../data/daos/projects_dao.dart';
import '../../widgets/command_header.dart';
import '../../widgets/section_header.dart';

class ProjectDetailScreen extends ConsumerStatefulWidget {
  const ProjectDetailScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<ProjectDetailScreen> createState() =>
      _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends ConsumerState<ProjectDetailScreen> {
  Future<void> _deleteProject(AppDatabase db, String projectName) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete project?'),
        content: Text(
          'This permanently deletes "$projectName", including its steps, setup, plans, results, evidence, and project links.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(dialogContext).colorScheme.error,
              foregroundColor: Theme.of(dialogContext).colorScheme.onError,
            ),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Delete permanently'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    try {
      await db.projectsDao.deleteProject(widget.projectId);
      if (mounted) context.go('/projects');
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not delete project: $error')),
        );
      }
    }
  }

  Future<void> _captureIntent(AppDatabase db) async {
    final focus = TextEditingController();
    final evidence = TextEditingController();
    final saved = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Plan a session'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: focus,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'What will you try? *',
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: evidence,
              decoration: const InputDecoration(
                labelText: 'What evidence do you expect? (optional)',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              if (focus.text.trim().isEmpty) return;
              await db.projectsDao.recordIntent(
                projectId: widget.projectId,
                focus: focus.text,
                expectedEvidence: evidence.text,
              );
              if (context.mounted) Navigator.pop(context, true);
            },
            child: const Text('Save plan'),
          ),
        ],
      ),
    );
    focus.dispose();
    evidence.dispose();
    if (saved == true && mounted) setState(() {});
  }

  Future<void> _captureResult(
    AppDatabase db,
    List<ProjectEntry> history,
  ) async {
    final result = TextEditingController();
    final next = TextEditingController();
    final intents = history.where((e) => e.logicalKind == 'intent').toList();
    String? selectedIntent;
    final saved = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Record a result'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: result,
                  autofocus: true,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'What happened? *',
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                DropdownButtonFormField<String?>(
                  initialValue: selectedIntent,
                  decoration: const InputDecoration(
                    labelText: 'Prior plan (optional)',
                  ),
                  items: [
                    const DropdownMenuItem<String?>(
                      value: null,
                      child: Text('No prior plan'),
                    ),
                    ...intents.map(
                      (e) => DropdownMenuItem(
                        value: e.id,
                        child: Text(e.focus ?? 'Untitled plan'),
                      ),
                    ),
                  ],
                  onChanged: (value) =>
                      setDialogState(() => selectedIntent = value),
                ),
                const SizedBox(height: AppSpacing.md),
                TextField(
                  controller: next,
                  decoration: const InputDecoration(
                    labelText: 'Next experiment (optional)',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                if (result.text.trim().isEmpty) return;
                await db.projectsDao.recordObservation(
                  projectId: widget.projectId,
                  observedResult: result.text,
                  relatedEntryId: selectedIntent,
                  nextStep: next.text,
                );
                if (context.mounted) Navigator.pop(context, true);
              },
              child: const Text('Save result'),
            ),
          ],
        ),
      ),
    );
    result.dispose();
    next.dispose();
    if (saved == true && mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    return StreamBuilder<Entity?>(
      stream: db.projectsDao.watchProjects().map(
        (projects) =>
            projects.where((p) => p.id == widget.projectId).firstOrNull,
      ),
      builder: (context, projectSnapshot) {
        final project = projectSnapshot.data;
        if (project == null) {
          return const Scaffold(
            body: Center(child: Text('Project unavailable')),
          );
        }
        return StreamBuilder<List<ProjectEntry>>(
          stream: db.projectsDao.watchHistory(widget.projectId),
          builder: (context, historySnapshot) {
            final history = historySnapshot.data ?? const <ProjectEntry>[];
            final setup = history.where((e) => e.kind == 'setup').firstOrNull;
            final milestones =
                (setup?.setupPayload?['milestones'] as List?)
                    ?.whereType<Map>()
                    .map(
                      (milestone) => ProjectMilestone.fromJson(
                        Map<String, dynamic>.from(milestone),
                      ),
                    )
                    .toList()
                  ?..sort((a, b) => a.ordinal.compareTo(b.ordinal));
            final latest = history.where((e) => e.kind != 'setup').firstOrNull;
            return Scaffold(
              appBar: CommandHeader(
                title: project.name,
                onDelete: () => _deleteProject(db, project.name),
              ),
              body: ListView(
                padding: const EdgeInsets.all(AppSpacing.marginMobile),
                children: [
                  Text(project.name, style: AppTypography.headlineLg),
                  if ((project.metadata?['desiredOutcome'] as String?)
                          ?.isNotEmpty ??
                      false) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(project.metadata!['desiredOutcome'] as String),
                  ],
                  if (milestones?.isNotEmpty ?? false) ...[
                    const SectionHeader(
                      title: 'Steps',
                      icon: Icons.route_outlined,
                    ),
                    Card(
                      child: Column(
                        children: [
                          for (var i = 0; i < milestones!.length; i++)
                            ListTile(
                              leading: CircleAvatar(
                                radius: 14,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                foregroundColor: Theme.of(context)
                                    .colorScheme
                                    .onPrimary,
                                child: Text('${i + 1}'),
                              ),
                              title: Text(milestones[i].label),
                              subtitle: milestones[i].description == null
                                  ? null
                                  : Text(milestones[i].description!),
                            ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.lg),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () => _captureIntent(db),
                          icon: const Icon(Icons.playlist_add),
                          label: const Text('Plan session'),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _captureResult(db, history),
                          icon: const Icon(Icons.check_circle_outline),
                          label: const Text('Record result'),
                        ),
                      ),
                    ],
                  ),
                  const SectionHeader(
                    title: 'Last recorded session',
                    icon: Icons.history,
                  ),
                  if (latest == null)
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(AppSpacing.md),
                        child: Text(
                          'No session recorded yet. Start with a small experiment.',
                        ),
                      ),
                    )
                  else
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Text(
                          latest.observedResult ??
                              latest.focus ??
                              'Untitled entry',
                        ),
                      ),
                    ),
                  const SectionHeader(
                    title: 'History',
                    icon: Icons.notes_outlined,
                  ),
                  for (final entry in history.where((e) => e.kind != 'setup'))
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        entry.logicalKind == 'intent'
                            ? (entry.focus ?? 'Plan')
                            : (entry.observedResult ?? 'Result'),
                      ),
                      subtitle: Text(
                        '${entry.localDay} · ${entry.logicalKind}',
                      ),
                    ),
                  const SizedBox(height: AppSpacing.lg),
                  OutlinedButton.icon(
                    onPressed: history.where((e) => e.kind != 'setup').isEmpty
                        ? null
                        : () => context.push(
                            '/projects/${widget.projectId}/review',
                          ),
                    icon: const Icon(Icons.rate_review_outlined),
                    label: const Text('Start decision review'),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  TextButton.icon(
                    onPressed: history.where((e) => e.kind != 'setup').isEmpty
                        ? null
                        : () => context.push(
                            '/projects/${widget.projectId}/compare',
                          ),
                    icon: const Icon(Icons.compare_arrows_outlined),
                    label: const Text('Compare this week'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
