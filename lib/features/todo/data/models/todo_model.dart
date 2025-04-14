import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/features/todo/domain/entities/todo_entity.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: 'due_date') required int dueDate,
    required String status,
    @Default(false) bool isDone,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as String,
      title: map['title'],
      description: map['description'],
      dueDate: map['dueDate'],
      status: map['status'],
      isDone: map['isDone'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'status': status,
      'isDone': isDone ? 1 : 0,
    };
  }
}

extension TodoModelX on TodoModel {
  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      title: title,
      description: description,
      dueDate: dueDate,
      status: status,
      isDone: isDone,
    );
  }

  // const TodoModel({
  //   int? id,
  //   required String title,
  //   required String description,
  //   bool isDone = false,
  // }) : super(id: id, title: title, description: description, isDone: isDone);
}
