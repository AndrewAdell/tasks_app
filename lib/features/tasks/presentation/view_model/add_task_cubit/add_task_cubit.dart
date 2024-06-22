import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:tasks_app/core/constants.dart';
import 'package:tasks_app/features/tasks/data/model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  Color color = const Color(0xffAC3931);
  addTask(TaskModel note) async {
    note.color = color.value;
    emit(AddTaskLoading());
    try {
      var notesBox = Hive.box<TaskModel>(kTasksBox);
      await notesBox.add(note);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}
