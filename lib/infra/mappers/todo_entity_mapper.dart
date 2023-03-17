import 'package:todo_arch/domain/entities/todo_entity.dart';

class TodoEntityMapper {
  // Para trabalhar apenas com métodos static
  TodoEntityMapper._();

  static TodoEntity fromJson(Map<String, dynamic> json) {
    return TodoEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
