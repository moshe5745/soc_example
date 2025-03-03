import 'package:flutter/cupertino.dart';

class TodoVM extends ChangeNotifier {
  List<String> tasks = [];
  ValueNotifier<int> count = ValueNotifier(0);

  Future<void> fetchData() async {
    tasks = await Future.delayed(const Duration(milliseconds: 1000), () {
      return ["Write code", "Avoid bugs"];
    });

    count.value = tasks.length;
    notifyListeners();
  }

  void addTask(String task) {
    if (task.isEmpty) return;

    tasks.add(task);
    count.value = tasks.length;
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    count.value = tasks.length;
    notifyListeners();
  }
}
