import 'package:todo_arch/domain/entities/todo_entity.dart';

class TodoEntityAggregate {
  final List<TodoEntity> todos;
  final bool isLoading;

  TodoEntityAggregate({
    required this.todos,
    required this.isLoading,
  });

  factory TodoEntityAggregate.init() {
    return TodoEntityAggregate(
      todos: [],
      isLoading: false,
    );
  }

  factory TodoEntityAggregate.loading() {
    return TodoEntityAggregate(
      todos: [],
      isLoading: true,
    );
  }

  factory TodoEntityAggregate.success(List<TodoEntity> todos) {
    return TodoEntityAggregate(
      todos: todos,
      isLoading: false,
    );
  }
}
