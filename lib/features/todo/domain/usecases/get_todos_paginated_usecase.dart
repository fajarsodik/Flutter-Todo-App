import 'package:todo/features/todo/domain/entities/todo_entity.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

class PaginatedTodosResult {
  final List<TodoEntity> todos;
  final bool hasMore;

  PaginatedTodosResult({required this.todos, required this.hasMore});
}

class GetTodosPaginatedUsecase {
  final TodoRepository repository;
  GetTodosPaginatedUsecase(this.repository);
  Future<PaginatedTodosResult> call({required int offset, required int limit}) {
    return repository.getTodosPaginated(limit: limit, offset: offset);
  }
}
