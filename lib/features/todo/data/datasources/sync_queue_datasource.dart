import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:todo/features/todo/data/models/sync_queue_item.dart';
import 'package:todo/features/todo/data/models/todo_model.dart';

class SyncQueueDatasource {
  final Database db;
  SyncQueueDatasource(this.db);

  Future<void> enqueuOperation(String operation, TodoModel todo) async {
    await db.insert('sync_queue', {
      'operation': operation,
      'payload': jsonEncode(todo.toJson()),
    });
  }

  Future<List<SyncQueueItem>> getQueuedItems() async {
    final rows = await db.query('sync_queue');
    return rows.map((row) {
      return SyncQueueItem(
        id: row['id'] as int,
        operation: row['operation'] as String,
        todo: TodoModel.fromJson(jsonDecode(row['payload'] as String)),
      );
    }).toList();
  }

  Future<void> removeSyncedItem(int id) async {
    await db.delete('sync_queue', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearQueue() async {
    await db.delete('sync_queue');
  }
}
