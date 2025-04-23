import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class SyncQueueItem with _$SyncQueueItem {
  const factory SyncQueueItem({
    required int? id,
    required String operation,
    required TodoModel todo,
  }) = _SyncQueueItem;

  factory SyncQueueItem.fromJson(Map<String, dynamic> json) =>
      _$SyncQueueItemFromJson(json);
}
