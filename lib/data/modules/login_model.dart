import 'package:transjo/domain/entites/login_entites.dart';

class LoginUserDataModel extends LoginUserData {
  const LoginUserDataModel(
      {required super.username, required super.password, required super.email});

  factory LoginUserDataModel.fromJson(Map<String, dynamic> json) =>
      LoginUserDataModel(
          username: json['username'],
          password: json['password'],
          email: json['email']);
}
