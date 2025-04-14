part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodosEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final TodoEntity todo;
  AddTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class UpdateTodoEvent extends TodoEvent {
  final TodoEntity todo;
  UpdateTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class DeleteTodoEvent extends TodoEvent {
  final int id;
  DeleteTodoEvent(this.id);

  @override
  List<Object> get props => [id];
}

class FetchTodosEvent extends TodoEvent {
  final int page;
  final int limit;

  FetchTodosEvent({this.page = 1, this.limit = 10});
}
