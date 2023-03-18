import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:todo_arch/domain/repositories/todos_repository.dart';
import 'package:todo_arch/domain/usecases/bloc_fetch_todos_usecase.dart';
import 'package:todo_arch/external/datasources/todos_datasource_impl.dart';
import 'package:todo_arch/infra/repositories/todos_repository_impl.dart';
import 'package:todo_arch/ui/presenter/pages/home_page_bloc.dart';

late final TodosRepository repository;
late final BlocFetchTodosUsecase usecase;

void main() {
  repository = TodosRepositoryImpl(datasource: TodosDatasourceImpl());
  usecase = BlocFetchTodosUsecase(repository);

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
      home: HomePageBloc(blocFetchTodosUsecase: usecase),
    );
  }
}
