import 'user.dart';

class UserModel {
  List<User>? users;

  UserModel({
    this.users,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        users: (json['users'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'users': users?.map((e) => e.toJson()).toList(),
      };
}
