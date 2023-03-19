import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:todo_arch/domain/events/bloc_fetch_todos_event.dart';
import 'package:todo_arch/domain/usecases/bloc_fetch_todos_usecase.dart';
import 'package:todo_arch/main.dart';
import 'package:bloc/bloc.dart';

class HomePageBloc extends StatefulWidget {
  final BlocFetchTodosUsecase blocFetchTodosUsecase;
  const HomePageBloc({super.key, required this.blocFetchTodosUsecase});

  @override
  State<HomePageBloc> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageBloc> {
  BlocFetchTodosUsecase get blocUsecase => widget.blocFetchTodosUsecase;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      blocUsecase.add(FetchTodosEvent());

      blocUsecase.stream.listen((event) {
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    blocUsecase.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = Container();

    if (blocUsecase.state.isLoading) {
      bodyWidget = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (blocUsecase.state.error != null) {
      bodyWidget = Center(
        child: Text(
          blocUsecase.state.error.toString(),
        ),
      );
    } else {
      bodyWidget = ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: blocUsecase.state.todoEntity.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(blocUsecase.state.todoEntity[index].title),
            trailing: Checkbox(
              value: blocUsecase.state.todoEntity[index].completed,
              onChanged: (value) {},
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todos'),
      ),
      body: bodyWidget,
    );
  }
}
