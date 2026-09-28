import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../app/providers.dart';
import '../../data/database.dart';

const _entityTypes = [
  'person',
  'company',
  'project',
  'technology',
  'location',
  'life_area',
  'organization',
  'other',
];

/// Minimal entity list, mainly to back the advice log and relations
/// (docs/prompt.md §11).
class PeopleScreen extends ConsumerWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('People & entities')),
      body: StreamBuilder<List<Entity>>(
        stream: db.entitiesDao.watchAll(),
        builder: (context, snapshot) {
          final entities = snapshot.data ?? [];
          if (entities.isEmpty) {
            return const Center(child: Text('No entities yet.'));
          }
          return ListView(
            children: entities
                .map((e) => ListTile(title: Text(e.name), subtitle: Text(e.type)))
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addEntity(context, db),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _addEntity(BuildContext context, dynamic db) async {
    final nameCtrl = TextEditingController();
    String type = 'person';
    await showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setState) => AlertDialog(
          title: const Text('Add entity'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              DropdownButtonFormField<String>(
                initialValue: type,
                items: _entityTypes
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) => setState(() => type = v!),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                if (nameCtrl.text.trim().isEmpty) return;
                await db.entitiesDao.insertEntity(EntitiesCompanion.insert(
                  id: const Uuid().v4(),
                  type: type,
                  name: nameCtrl.text.trim(),
                ));
                if (dialogContext.mounted) Navigator.pop(dialogContext);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
