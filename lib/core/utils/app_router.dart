import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/features/auth/presentation/view/log_in_view.dart';
import 'package:tasks_app/features/tasks/presentation/view/tasks_view.dart';

abstract class AppRouter {
  static const tasksPage = '/tasksPage';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LogInView();
        },
      ),
      GoRoute(
        path: tasksPage,
        builder: (BuildContext context, GoRouterState state) {
          return const TasksView();
        },
      ),
    ],
  );
}
