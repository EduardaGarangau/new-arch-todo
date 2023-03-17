// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rx_notifier/rx_notifier.dart';

import 'package:todo_arch/domain/repositories/todos_repository.dart';
import 'package:todo_arch/domain/states/todos_state.dart';

class FetchTodosUsecase extends RxReducer {
  final TodosRepository repository;
  final TodosState state;

  FetchTodosUsecase({
    required this.repository,
    required this.state,
  }) {
    on(() => [state.fetchTodos], _fetchTodos);
  }

  void _fetchTodos() async {
    state.todos.value = await repository.fetchTodos();
  }
}
