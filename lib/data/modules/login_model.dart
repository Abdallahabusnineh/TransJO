import 'package:transjo/domain/entites/login_entites.dart';

class LoginUserDataModel extends LoginUserData {
  LoginUserDataModel(
      {required super.username, required super.name, required super.email});

  factory LoginUserDataModel.fromJson(Map<String, dynamic>? json) =>
      LoginUserDataModel(username: json?['username'], name: json?['name'], email:json?['email']);
}
