import 'package:flutter/material.dart';
import '../model/task_model.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].title),
          trailing: Checkbox(
            value: tasks[index].isCompleted,
            onChanged: (value) {
              // Lógica para marcar una tarea como completada.
            },
          ),
        );
      },
    );
  }
}
