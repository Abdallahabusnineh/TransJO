import 'package:transjo/domain/entites/login_entites.dart';

class LoginUserDataModel extends LoginUserData {
  const LoginUserDataModel(
      {required super.username,
      required super.password,
      required super.email,
      required super.accessToken});

  factory LoginUserDataModel.fromJson(Map<String, dynamic> json) =>
      LoginUserDataModel(
          username: json['username'],
          accessToken: json['access_token'],
          password: json['password'],
          email: json['email']);
}
