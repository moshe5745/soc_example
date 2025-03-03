import 'package:flutter/material.dart';

class TaskCount extends StatelessWidget {
  const TaskCount(
    this.count, {
    super.key,
  });

  final ValueNotifier<int> count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ValueListenableBuilder(
        valueListenable: count,
        builder: (BuildContext context, int value, Widget? child) {
          return CircleAvatar(
            radius: 16,
            backgroundColor: value < 5 ? Colors.green : Colors.red,
            child: Text(
              '$value',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
