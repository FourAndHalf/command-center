import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'entities_dao.g.dart';

@DriftAccessor(tables: [Entities, Relations, Events])
class EntitiesDao extends DatabaseAccessor<AppDatabase>
    with _$EntitiesDaoMixin {
  EntitiesDao(super.db);

  Stream<List<Entity>> watchByType(String type) =>
      (select(entities)..where((e) => e.type.equals(type))).watch();

  Stream<List<Entity>> watchAll() => select(entities).watch();

  Future<void> insertEntity(Insertable<Entity> entity) => into(entities).insert(entity);

  Future<void> insertRelation(Insertable<Relation> relation) =>
      into(relations).insert(relation);

  /// "Related" section of Decision Replay / Goal detail (docs/prompt.md §16):
  /// every relation where this record is either side.
  Stream<List<Relation>> watchRelationsFor(String type, String id) =>
      (select(relations)
            ..where((r) =>
                (r.sourceType.equals(type) & r.sourceId.equals(id)) |
                (r.targetType.equals(type) & r.targetId.equals(id))))
          .watch();

  Stream<List<Event>> watchAllEvents() =>
      (select(events)..orderBy([(e) => OrderingTerm.desc(e.occurredAt)]))
          .watch();

  Future<void> insertEvent(Insertable<Event> event) => into(events).insert(event);
}
