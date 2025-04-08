import 'package:todo/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel({
    int? id,
    required String title,
    required String description,
    bool isDone = false,
  }) : super(id: id, title: title, description: description, isDone: isDone);

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as int?,
      title: map['title'],
      description: map['description'],
      isDone: map['isDone'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone ? 1 : 0,
    };
  }
}
