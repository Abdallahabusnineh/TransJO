import 'package:transjo/data/modules/login_model.dart';
import 'package:transjo/domain/entites/login_succes_entities.dart';

class LoginSuccessModel extends LoginSuccess {
  LoginSuccessModel(
      {required super.status, required super.message, required super.data});

  factory LoginSuccessModel.fromJson(Map<String, dynamic>json)=>
      LoginSuccessModel(

        status: json['status'],
        message: json['message'],
        data: LoginUserDataModel.fromJson(json['data']),
      );
}
