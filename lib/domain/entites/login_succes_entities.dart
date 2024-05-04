import 'package:equatable/equatable.dart';
import 'package:transjo/domain/entites/login_entites.dart';

class LoginSuccess extends Equatable {
  bool status;

  String message;

  LoginUserData ?data;

  LoginSuccess({
    required this.status,
    required this.message,
    required this.data,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [message, data, status];
}