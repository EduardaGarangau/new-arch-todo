import 'package:todo_arch/infra/datasources/todos_datasource.dart';
import 'package:todo_arch/domain/entities/todo_entity.dart';
import 'package:todo_arch/domain/repositories/todos_repository.dart';

import '../mappers/todo_entity_mapper.dart';

class TodosRepositoryImpl extends TodosRepository {
  final TodosDatasource datasource;

  TodosRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<List<TodoEntity>> fetchTodos() async {
    final data = await datasource.fetchTodos();
    return data.map((todo) => TodoEntityMapper.fromJson(todo)).toList();
  }
}
