import 'package:flutter/material.dart';

import 'todo_item.dart';

class TodoListWidget extends StatelessWidget {
  final List<String> todos;
  final Function(int) onDelete;

  const TodoListWidget({
    super.key,
    required this.todos,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoItemWidget(
          text: todos[index],
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}