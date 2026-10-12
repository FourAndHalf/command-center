import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';

import '../../app/providers.dart';
import '../../data/export_service.dart';
import '../../widgets/command_header.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final exportService = ExportService(db);

    return Scaffold(
      appBar: const CommandHeader(title: 'Settings'),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.ios_share),
            title: const Text('Export all data (JSON)'),
            subtitle: const Text(
              'Everything: decisions, versions, assumptions, reviews, goals, '
              'schedules, entities, relations, events, reflections.',
            ),
            onTap: () async {
              final file = await exportService.exportAllToJson();
              await SharePlus.instance.share(
                ShareParams(
                  files: [XFile(file.path)],
                  text: 'Command Center export',
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.file_open_outlined),
            title: const Text('Import data (JSON)'),
            subtitle: const Text(
              'Replace this device’s data with a Command Center export.',
            ),
            onTap: () => _importData(context, exportService),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text('Delete all data', style: TextStyle(color: Colors.red)),
            subtitle: const Text('Cannot be undone. Export first.'),
            onTap: () => _confirmDelete(context, exportService),
          ),
          const Divider(),
          const AboutListTile(
            icon: Icon(Icons.info_outline),
            applicationName: 'Command Center',
            applicationVersion: '0.1.0 (offline mobile)',
          ),
        ],
      ),
    );
  }

  Future<void> _importData(BuildContext context, ExportService service) async {
    final picked = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    final path = picked?.path;
    if (path == null || !context.mounted) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Replace local data?'),
        content: const Text(
          'Importing replaces all decisions, reviews, goals, schedules, and '
          'history currently on this device. This cannot be undone. Continue?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Replace data'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    try {
      final summary = await service.importFromJson(File(path));
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Imported ${summary.rowCount} records.')),
      );
    } on Object catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Import failed: $error')),
      );
    }
  }

  Future<void> _confirmDelete(BuildContext context, ExportService service) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete everything?'),
        content: const Text(
          'This permanently deletes all decisions, goals, reviews, and history '
          'on this device. Export a backup first if you want to keep it.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await service.deleteAllData();
    }
  }
}
