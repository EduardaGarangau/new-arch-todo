import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:todo_arch/domain/repositories/todos_repository.dart';
import 'package:todo_arch/domain/states/todos_state.dart';
import 'package:todo_arch/domain/usecases/fetch_todos_usecase.dart';
import 'package:todo_arch/external/datasources/todos_datasource_impl.dart';
import 'package:todo_arch/infra/datasources/todos_datasource.dart';
import 'package:todo_arch/infra/repositories/todos_repository_impl.dart';
import 'package:todo_arch/ui/presenter/pages/home_page.dart';

late final TodosState state;
late final TodosRepository repository;
late final FetchTodosUsecase usecase;

void main() {
  state = TodosState();
  repository = TodosRepositoryImpl(datasource: TodosDatasourceImpl());
  usecase = FetchTodosUsecase(
    repository: repository,
    state: state,
  );

  runApp(const RxRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-dos App - New Arch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
