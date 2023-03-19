import 'package:bloc/bloc.dart';
import 'package:todo_arch/domain/entities/todo_aggregate.dart';
import 'package:todo_arch/domain/repositories/todos_repository.dart';
import 'package:todo_arch/domain/events/bloc_fetch_todos_event.dart';

class BlocFetchTodosUsecase extends Bloc<BlocFetchTodosEvent, TodoAggregate> {
  final TodosRepository repository;

  BlocFetchTodosUsecase(this.repository) : super(TodoAggregate.init()) {
    on<FetchTodosEvent>(_fetchTodosEvent);
  }

  Future<void> _fetchTodosEvent(FetchTodosEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 5));

    try {
      //Isso para testar o erro
      //throw Exception('Grande erro');
      final response = await repository.fetchTodos();
      emit(state.copyWith(todoEntity: response, error: null, isLoading: false));
    } on Exception catch (error) {
      emit(state.copyWith(error: error, isLoading: false));
    }
  }
}
