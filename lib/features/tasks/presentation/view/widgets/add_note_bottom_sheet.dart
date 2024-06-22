import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/tasks/presentation/view/widgets/add_task_form.dart';
import 'package:tasks_app/features/tasks/presentation/view_model/add_task_cubit/add_task_cubit.dart';
import 'package:tasks_app/features/tasks/presentation/view_model/tasks_cubit/tasks_cubit.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          if (state is AddTaskFailure) {}

          if (state is AddTaskSuccess) {
            BlocProvider.of<TasksCubit>(context).fetchAllTasks();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddTaskLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddTaskForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
