// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_arch/domain/entities/todo_entity.dart';

class TodoAggregate {
  final List<TodoEntity> todoEntity;
  final bool isLoading;
  final Exception? error;

  const TodoAggregate({
    required this.todoEntity,
    this.isLoading = false,
    this.error,
  });

  factory TodoAggregate.init() {
    return const TodoAggregate(todoEntity: []);
  }

  TodoAggregate copyWith({
    List<TodoEntity>? todoEntity,
    bool? isLoading,
    Exception? error,
  }) {
    return TodoAggregate(
      todoEntity: todoEntity ?? this.todoEntity,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
