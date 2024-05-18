import 'package:transjo/domain/entites/login_entites.dart';

class LoginUserDataModel extends LoginUserData {
  const LoginUserDataModel(
      {required super.fullName,
      required super.password,
      required super.email,
      required super.accessToken});

  factory LoginUserDataModel.fromJson(Map<String, dynamic> json) =>
      LoginUserDataModel(
          fullName: json['fullName'],
          accessToken: json['access_token'],
          password: json['password'],
          email: json['email']);
}
