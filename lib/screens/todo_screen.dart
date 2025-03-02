import 'package:flutter/material.dart';
import 'package:soc_example/screens/todo_vm.dart';

import 'widgets/todo_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoVM vm = TodoVM();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a todo',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    vm.addTask(_controller.text);
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: TodoListWidget(
              todos: vm.tasks,
              onDelete: (index) => vm.removeTask(index),
            ),
          ),
        ],
      ),
    );
  }
}
