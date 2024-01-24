import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../model/task_model.dart';
import '../widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hola Ing'),
        ),
        body: BlocBuilder<TodoBloc, List<Task>>(
          builder: (context, tasks) {
            return TaskList(tasks: tasks);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addTask(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _addTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar tarea '),
          content: TextField(
            onChanged: (value) {

            },
            decoration: InputDecoration(hintText: 'Título de la tarea'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Lógica para agregar la tarea de redes al BLoC.
                BlocProvider.of<TodoBloc>(context).addTask(
                  Task(title: 'Redes', isCompleted: false),
                );
                Navigator.of(context).pop();
              },
              child: Text('Agregar'),
            ),
          ],
        );
      },
    );
  }
}
