import 'package:dartz/dartz.dart';
import 'package:tasks_app/core/erros/failures.dart';
import 'package:tasks_app/features/auth/data/models/user_model/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, List<UserModel>>> fetchUserDetails(
      {required String userName, required String password});
}
