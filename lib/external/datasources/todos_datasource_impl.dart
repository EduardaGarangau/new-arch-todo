import 'dart:convert';

import 'package:todo_arch/infra/datasources/todos_datasource.dart';
import 'package:http/http.dart' as http;

class TodosDatasourceImpl extends TodosDatasource {
  final _jsonPlaceholderURL = 'https://jsonplaceholder.typicode.com/todos';

  @override
  Future<List<dynamic>> fetchTodos() async {
    final response = await http.get(Uri.parse(_jsonPlaceholderURL));
    return jsonDecode(response.body);
  }
}
