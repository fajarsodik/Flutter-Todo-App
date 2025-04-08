import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/features/todo/domain/entities/todo_entity.dart';
import 'package:todo/features/todo/domain/usecases/add_todo.dart';
import 'package:todo/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo/features/todo/domain/usecases/get_todos.dart';
import 'package:todo/features/todo/domain/usecases/update_todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final UpdateTodo updateTodo;
  final DeleteTodo deleteTodo;

  TodoBloc({
    required this.getTodos,
    required this.addTodo,
    required this.updateTodo,
    required this.deleteTodo,
  }) : super(TodoLoading()) {
    on<LoadTodosEvent>((event, emit) async {
      emit(TodoLoading());
      final todos = await getTodos();
      emit(TodoLoaded(todos));
    });

    on<AddTodoEvent>((event, emit) async {
      await addTodo(event.todo);
      add(LoadTodosEvent());
    });

    on<UpdateTodoEvent>((event, emit) async {
      await updateTodo(event.todo);
      add(LoadTodosEvent());
    });

    on<DeleteTodoEvent>((event, emit) async {
      await deleteTodo(event.id);
      add(LoadTodosEvent());
    });
  }
}
