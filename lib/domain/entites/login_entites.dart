import 'package:equatable/equatable.dart';

class LoginUserData extends Equatable {
  final String ?password;
  final String ?username;
  final String ?email;


  const LoginUserData({
    required this.username,
    required this.password,
    required this.email,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [password, email,username];
}
