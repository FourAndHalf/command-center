import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/design_tokens.dart';
import '../../app/providers.dart';
import '../../data/daos/projects_dao.dart';
import '../../widgets/command_header.dart';

class ProjectCaptureScreen extends ConsumerStatefulWidget {
  const ProjectCaptureScreen({super.key});

  @override
  ConsumerState<ProjectCaptureScreen> createState() =>
      _ProjectCaptureScreenState();
}

class _ProjectCaptureScreenState extends ConsumerState<ProjectCaptureScreen> {
  final _name = TextEditingController();
  final _outcome = TextEditingController();
  final _source = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _outcome.dispose();
    _source.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_name.text.trim().isEmpty || _saving) return;
    setState(() => _saving = true);
    try {
      final id = await ref
          .read(databaseProvider)
          .projectsDao
          .createProject(
            name: _name.text,
            desiredOutcome: _outcome.text,
            sourceTitle: _source.text,
          );
      if (mounted) context.go('/projects/$id');
    } catch (error) {
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not create project: $error')),
        );
      }
    }
  }

  Future<void> _saveCardboard() async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      final id = await ref
          .read(databaseProvider)
          .projectsDao
          .createProject(
            name: 'Cardboard video version control',
            sourceTitle: 'cardboard-video-version-control',
            starterId: 'cardboard-video-version-control',
            starterVersion: '1',
            milestones: cardboardProjectMilestones,
          );
      if (mounted) context.go('/projects/$id');
    } catch (error) {
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not create starter: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommandHeader(title: 'New project'),
    body: ListView(
      padding: const EdgeInsets.all(AppSpacing.marginMobile),
      children: [
        Text(
          'Set up a reusable project space',
          style: AppTypography.headlineLg,
        ),
        const SizedBox(height: AppSpacing.sm),
        const Text(
          'Start with a name. Milestones, goals and source details can be added when they are useful.',
        ),
        const SizedBox(height: AppSpacing.lg),
        TextField(
          controller: _name,
          autofocus: true,
          textInputAction: TextInputAction.next,
          onChanged: (_) => setState(() {}),
          decoration: const InputDecoration(labelText: 'Project name *'),
        ),
        const SizedBox(height: AppSpacing.md),
        TextField(
          controller: _outcome,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Desired outcome (optional)',
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        TextField(
          controller: _source,
          decoration: const InputDecoration(
            labelText: 'Source or repository title (optional)',
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        FilledButton.icon(
          onPressed: _name.text.trim().isEmpty || _saving ? null : _save,
          icon: _saving
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.add),
          label: const Text('Create project'),
        ),
        const SizedBox(height: AppSpacing.sm),
        OutlinedButton.icon(
          onPressed: _saving ? null : _saveCardboard,
          icon: const Icon(Icons.video_library_outlined),
          label: const Text('Use Cardboard starter'),
        ),
      ],
    ),
  );
}
