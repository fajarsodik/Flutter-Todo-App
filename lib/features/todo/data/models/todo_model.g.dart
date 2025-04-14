// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => _TodoModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  dueDate: (json['due_date'] as num).toInt(),
  status: json['status'] as String,
  isDone: json['isDone'] as bool? ?? false,
);

Map<String, dynamic> _$TodoModelToJson(_TodoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'due_date': instance.dueDate,
      'status': instance.status,
      'isDone': instance.isDone,
    };
