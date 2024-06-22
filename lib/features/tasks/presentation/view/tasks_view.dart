import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks/presentation/view/widgets/add_note_bottom_sheet.dart';
import 'package:tasks_app/features/tasks/presentation/view/widgets/tasks_view_body.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddTaskBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const TasksViewBody(),
    );
  }
}
