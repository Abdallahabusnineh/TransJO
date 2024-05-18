import 'package:equatable/equatable.dart';

class LoginUserData extends Equatable {
  final String ?password;
  final String ?fullName;
  final String ?email;
  final String ?accessToken;


  const LoginUserData({
    required this.fullName,
    required this.password,
    required this.email,
    required this.accessToken,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [password, email,fullName];
}
