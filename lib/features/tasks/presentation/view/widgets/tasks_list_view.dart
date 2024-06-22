import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/tasks/data/model/task_model.dart';
import 'package:tasks_app/features/tasks/presentation/view/widgets/task_item.dart';
import 'package:tasks_app/features/tasks/presentation/view_model/tasks_cubit/tasks_cubit.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TasksCubit>(context).tasks!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TaskItem(
                    task: tasks[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
