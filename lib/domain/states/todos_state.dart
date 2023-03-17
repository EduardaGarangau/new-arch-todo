import 'package:rx_notifier/rx_notifier.dart';
import 'package:todo_arch/domain/entities/todo_entity.dart';

class TodosState {
  // atom
  final todos = RxNotifier<List<TodoEntity>>([]);

  // action
  final fetchTodos = RxAction();
}
