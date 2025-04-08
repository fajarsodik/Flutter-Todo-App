import 'package:todo/features/todo/data/datasources/todo_local_datasources.dart';
import 'package:todo/features/todo/data/models/todo_model.dart';
import 'package:todo/features/todo/domain/entities/todo_entity.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasources localDatasources;

  TodoRepositoryImpl(this.localDatasources);

  @override
  Future<void> addTodo(TodoEntity todo) async {
    final model = TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isDone: todo.isDone,
    );
    await localDatasources.insertTodo(model);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await localDatasources.deleteTodo(id);
  }

  @override
  Future<List<TodoEntity>> getTodos() async {
    return localDatasources.getTodos();
  }

  @override
  Future<void> updateTodo(TodoEntity todo) async {
    final model = TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isDone: todo.isDone,
    );
    await localDatasources.updateTodo(model);
  }
}
