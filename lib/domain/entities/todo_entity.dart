class TodoEntity {
  final int id;
  final String title;
  final bool completed;

  TodoEntity({
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  String toString() {
    return 'id: $id, title: $title, completed: $completed';
  }
}
