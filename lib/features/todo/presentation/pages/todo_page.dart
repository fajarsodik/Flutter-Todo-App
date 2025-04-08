import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo/domain/entities/todo_entity.dart';
import 'package:todo/features/todo/presentation/bloc/todo_bloc.dart';

enum Filter { all, completed, incomplete }

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  Filter _selectedFilter = Filter.all;
  bool _sortAscending = true;

  void _showAddTodoDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Add Todo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final title = titleController.text.trim();
                  final description = descController.text.trim();
                  if (title.isNotEmpty && description.isNotEmpty) {
                    final newTodo = TodoEntity(
                      title: title,
                      description: description,
                    );
                    context.read<TodoBloc>().add(AddTodoEvent(newTodo));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
    );
  }

  List<TodoEntity> _applyFiltersAndSorting(List<TodoEntity> todos) {
    List<TodoEntity> filtered;
    switch (_selectedFilter) {
      case Filter.completed:
        filtered = todos.where((todo) => todo.isDone).toList();
        break;
      case Filter.incomplete:
        filtered = todos.where((todo) => !todo.isDone).toList();
        break;
      default:
        filtered = List.from(todos);
    }
    filtered.sort(
      (a, b) =>
          _sortAscending
              ? a.title.compareTo(b.title)
              : b.title.compareTo(a.title),
    );
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: <Widget>[
          PopupMenuButton<Filter>(
            onSelected: (value) => setState(() => _selectedFilter = value),
            itemBuilder:
                (_) => [
                  const PopupMenuItem(value: Filter.all, child: Text('All')),
                  const PopupMenuItem(
                    value: Filter.completed,
                    child: Text('Complete'),
                  ),
                  const PopupMenuItem(
                    value: Filter.incomplete,
                    child: Text('Incomplete'),
                  ),
                ],
          ),
          IconButton(
            onPressed: () => setState(() => _sortAscending = !_sortAscending),
            icon: Icon(_sortAscending ? Icons.sort_by_alpha : Icons.sort),
          ),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            final todos = _applyFiltersAndSorting(state.todos);
            if (todos.isEmpty) {
              return const Center(child: Text('No Todos yet'));
            }
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (_, index) {
                final todo = todos[index];
                return Dismissible(
                  key: Key(todo.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed:
                      (_) => context.read<TodoBloc>().add(
                        DeleteTodoEvent(todo.id!),
                      ),
                  child: ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (_) {
                        context.read<TodoBloc>().add(
                          UpdateTodoEvent(todo.copyWith(isDone: !todo.isDone)),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
