import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks/data/model/task_model.dart';
import 'package:tasks_app/features/tasks/presentation/view/widgets/edit_task_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({Key? key, required this.task}) : super(key: key);

  final TaskModel task;
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: EditTaskViewBody(
        task: task,
      ),
    );
  }
}
