import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasks_app/core/erros/failures.dart';
import 'package:tasks_app/core/utils/api_service.dart';
import 'package:tasks_app/features/auth/data/models/user_model/user_model.dart';
import 'package:tasks_app/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<UserModel>>> fetchUserDetails(
      {required String? userName, required String? password}) async {
    try {
      Map<String, dynamic> jsonData = await apiService.post(
          endPoint:
              //  ' https://dummyjson.com/auth/login',
              'https://dummyjson.com/users',
          headers: {
            'Content-Type': 'application/json'
          },
          body: {
            'username': userName,
            'password': password,
            'expiresInMins': 30
          });

      List<UserModel> users = [];
      for (var user in jsonData["users"]) {
        users.add(UserModel.fromJson(jsonData));
      }

      return right(users);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures('there is no internet connection '));
    }
  }
}
