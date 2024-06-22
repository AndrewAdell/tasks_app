import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_app/core/utils/api_service.dart';
import 'package:tasks_app/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(apiService: ApiService(dio: Dio())));
}
