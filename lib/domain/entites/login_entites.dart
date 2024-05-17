import 'package:equatable/equatable.dart';

class LoginUserData extends Equatable {
  final String ?password;
  final String ?username;
  final String ?email;
  final String ?accessToken;


  const LoginUserData({
    required this.username,
    required this.password,
    required this.email,
    required this.accessToken,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [password, email,username];
}
