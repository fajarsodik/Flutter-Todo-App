import 'package:todo/features/todo/domain/entities/todo_entity.dart';
import 'package:todo/features/todo/domain/usecases/get_todos_paginated_usecase.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getTodos();
  Future<void> addTodo(TodoEntity todo);
  Future<void> updateTodo(TodoEntity todo);
  Future<void> deleteTodo(int id);
  Future<List<TodoEntity>> fetchTodos({int page, int limit});
  Future<PaginatedTodosResult> getTodosPaginated({
    required int offset,
    required int limit,
  });
}
