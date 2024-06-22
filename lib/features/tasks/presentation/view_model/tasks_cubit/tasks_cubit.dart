import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

import 'package:tasks_app/core/constants.dart';
import 'package:tasks_app/features/tasks/data/model/task_model.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  List<TaskModel>? tasks;
  fetchAllTasks() {
    var tasksBox = Hive.box<TaskModel>(kTasksBox);

    tasks = tasksBox.values.toList();
    emit(TasksSuccess());
  }
}
