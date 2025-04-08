import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int? id;
  final String title;
  final String description;
  final bool isDone;

  const TodoEntity({
    this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });

  TodoEntity copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
