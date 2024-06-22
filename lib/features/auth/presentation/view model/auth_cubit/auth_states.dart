class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  // List<UserModel> users;

  AuthSuccessState(
      // {required this.users}
      );
}

class AuthFailureState extends AuthStates {
  //  String errorMessage;

  AuthFailureState(
      // {required this.errorMessage}
      );
}
