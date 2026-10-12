import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/design_tokens.dart';
import '../../app/providers.dart';
import '../../data/database.dart';
import '../../widgets/command_header.dart';
import '../../widgets/section_header.dart';

class ProjectsListScreen extends ConsumerWidget {
  const ProjectsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: CommandHeader(
        title: 'Projects',
        onCapture: () => context.push('/projects/new'),
      ),
      body: StreamBuilder<List<Entity>>(
        stream: db.projectsDao.watchProjects(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _Message(
              icon: Icons.error_outline,
              title: 'Projects unavailable',
              body: 'Your local project history could not be loaded.',
              action: FilledButton(
                onPressed: () => (context as Element).markNeedsBuild(),
                child: const Text('Retry'),
              ),
            );
          }
          final projects = snapshot.data ?? const <Entity>[];
          if (projects.isEmpty) {
            return _Message(
              icon: Icons.workspaces_outlined,
              title: 'Start a project',
              body: 'Capture what you plan to try and what you learn. You can add Cardboard or any future project here.',
              action: FilledButton.icon(
                onPressed: () => context.push('/projects/new'),
                icon: const Icon(Icons.add),
                label: const Text('Create project'),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.marginMobile),
            children: [
              const SectionHeader(
                title: 'Your projects',
                icon: Icons.workspaces_outlined,
              ),
              for (final project in projects)
                Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primaryContainer,
                      child: Icon(
                        Icons.work_outline,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    title: Text(project.name),
                    subtitle: const Text('Open project history'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/projects/${project.id}'),
                  ),
                ),
              const SizedBox(height: AppSpacing.lg),
              OutlinedButton.icon(
                onPressed: () => context.push('/projects/new'),
                icon: const Icon(Icons.add),
                label: const Text('Create another project'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.icon,
    required this.title,
    required this.body,
    required this.action,
  });

  final IconData icon;
  final String title;
  final String body;
  final Widget action;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: AppSpacing.md),
          Text(title, style: AppTypography.headlineMd),
          const SizedBox(height: AppSpacing.sm),
          Text(body, textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.lg),
          action,
        ],
      ),
    ),
  );
}
