import 'package:flutter/material.dart';
import 'package:soc_example/todo/todo_item.dart';

class TodoListWidget extends StatelessWidget {
  final List<String> todos;
  final Function(int) onDelete;

  const TodoListWidget({
    Key? key,
    required this.todos,
    required this.onDelete,
  }) : super(key: key);

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