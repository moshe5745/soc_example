import 'package:flutter/material.dart';
import 'package:soc_example/screens/todo_vm.dart';

import 'widgets/task_counter.dart';
import 'widgets/todo_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoVM vm = TodoVM();

  @override
  void initState() {
    super.initState();
    vm.fetchData();
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo List'),
            actions: [TaskCount(vm.count)],
          ),
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
      },
    );
  }
}
