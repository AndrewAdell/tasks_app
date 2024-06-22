import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/service_locator.dart';
import 'package:tasks_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:tasks_app/features/auth/presentation/view%20model/auth_cubit/auth_cubit.dart';
import 'package:tasks_app/features/auth/presentation/view/widgets/log_in_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return LogInViewBody();
  }
}
