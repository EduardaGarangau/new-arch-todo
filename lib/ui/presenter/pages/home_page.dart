import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:todo_arch/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    state.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    final todos = context.select(() => state.todos.value);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todos'),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            trailing: Checkbox(
              value: todos[index].completed,
              onChanged: (value) {},
            ),
          );
        },
      ),
    );
  }
}
