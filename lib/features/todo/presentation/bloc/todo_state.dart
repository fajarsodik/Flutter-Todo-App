part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoEntity> todos;

  TodoLoaded(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);

  @override
  List<Object> get props => [message];
}

class TodosLoadingMore extends TodoState {
  final List<TodoEntity> todos;
  TodosLoadingMore(this.todos);
}

class TodosError extends TodoState {
  final String message;
  const TodosError(this.message);

  @override
  List<Object?> get props => [message];
}

class TodosLoading extends TodoState {}

class TodosLoaded extends TodoState {
  final List<TodoEntity> todos;
  final bool hasMore;

  TodosLoaded({required this.todos, this.hasMore = true});

  TodosLoaded copyWith({List<TodoEntity>? todos, bool? hasMore}) {
    return TodosLoaded(
      todos: todos ?? this.todos,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object> get props => [todos, hasMore];
}
