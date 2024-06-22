import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/auth/data/models/user_model/user_model.dart';
import 'package:tasks_app/features/auth/data/repos/auth_repo.dart';
import 'package:tasks_app/features/auth/presentation/view%20model/auth_cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(AuthInitialState());
  AuthRepo authRepo;
  late UserModel userModel;
  String? errorMessage;
  Future<void> fetchUserDetails(
      {required String userName, required String password}) async {
    emit(AuthLoadingState());
    var userModel =
        await authRepo.fetchUserDetails(userName: userName, password: password);

    userModel.fold((failure) {
      emit(AuthFailureState());
      errorMessage = failure.errormessage;
    }, (userDetails) {
      emit(AuthSuccessState());
    });
  }
}
