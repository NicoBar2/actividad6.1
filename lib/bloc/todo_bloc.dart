import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/task_model.dart';

class TodoBloc extends Cubit<List<Task>> {
  TodoBloc() : super([]);

  void addTask(Task task) {
    emit([...state, task]);
  }

  void removeTask(Task task) {
    emit([...state]..remove(task));
  }
}
