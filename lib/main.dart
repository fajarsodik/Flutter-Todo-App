import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/di/service_locator.dart';
import 'package:todo/features/intro/data/datasources/intro_local_datasource.dart';
import 'package:todo/features/intro/data/intro_repository_impl.dart';
import 'package:todo/features/intro/presentation/bloc/intro_bloc.dart';
import 'package:todo/features/intro/presentation/pages/intro_page.dart';
import 'package:todo/features/todo/data/datasources/todo_local_datasources.dart';
import 'package:todo/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo/features/todo/domain/usecases/add_todo.dart';
import 'package:todo/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo/features/todo/domain/usecases/get_todos.dart';
import 'package:todo/features/todo/domain/usecases/sync_pending_operations_usecase.dart';
import 'package:todo/features/todo/domain/usecases/update_todo.dart';
import 'package:todo/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo/features/todo/presentation/pages/todo_page.dart';
import 'package:workmanager/workmanager.dart';

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     final container = await initDependency();
//     final syncUseCase = container.get(SyncPendingOperationsUsecase());
//   });
// }

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().registerPeriodicTask(
    "sync_todo",
    "sync_todo_task",
    frequency: const Duration(minutes: 15),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final introRepository = IntroRepositoryImpl(IntroLocalDatasource());
    final todoRepository = TodoRepositoryImpl(TodoLocalDatasources());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => IntroBloc(introRepository)..add(CheckFirstLaunchEvent()),
        ),
        BlocProvider(
          create:
              (_) => TodoBloc(
                getTodos: GetTodos(todoRepository),
                addTodo: AddTodo(todoRepository),
                updateTodo: UpdateTodo(todoRepository),
                deleteTodo: DeleteTodo(todoRepository),
              )..add(LoadTodosEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<IntroBloc, IntroState>(
          builder: (context, state) {
            if (state is IntroShow) {
              return IntroPage(
                onIntroEnd: () {
                  context.read<IntroBloc>().add(CompleteIntroEvent());
                },
              );
            } else if (state is IntroSkip) {
              return const TodoPage();
            } else {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ),
    );
  }
}
