import 'package:todo_arch/domain/entities/todo_entity.dart';

abstract class TodosRepository {
  Future<List<TodoEntity>> fetchTodos();
}
