import 'package:dio/dio.dart';
import 'package:todo/core/network/dio_client.dart';
import 'package:todo/features/todo/data/models/todo_model.dart';
import 'package:todo/features/todo/domain/entities/todo_entity.dart';

class TodoRemoteDatasources {
  final Dio _dio = DioClient.instance;

  Future<List<TodoEntity>> fetchTodos({int page = 1, int limit = 10}) async {
    final response = await _dio.get(
      'tasks',
      queryParameters: {'page': page, 'limit': limit},
    );
    final List data = response.data;
    return data.map((json) => TodoModel.fromJson(json).toEntity()).toList();
  }
}
