import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/constants.dart';
import 'package:tasks_app/core/utils/app_router.dart';
import 'package:tasks_app/core/utils/service_locator.dart';
import 'package:tasks_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:tasks_app/features/auth/presentation/view%20model/auth_cubit/auth_cubit.dart';
import 'package:tasks_app/features/tasks/data/model/task_model.dart';
import 'package:tasks_app/features/tasks/presentation/view_model/tasks_cubit/tasks_cubit.dart';

void main() async {
  setupServiceLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kTasksBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) =>
              AuthCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider<TasksCubit>(
          create: (BuildContext context) => TasksCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      ),
    );
  }
}
