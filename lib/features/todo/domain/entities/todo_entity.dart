import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final int dueDate;
  final String status;
  final bool isDone;

  const TodoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.status,
    this.isDone = false,
  });

  TodoEntity copyWith({
    String? id,
    String? title,
    String? description,
    int? dueDate,
    String? status,
    bool? isDone,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [id, title, description, dueDate, status, isDone];
}
