import 'package:equatable/equatable.dart';

class LoginUserData extends Equatable {
  final String ?name;
  final int ?username;
  final String ?email;


  const LoginUserData({
    required this.username,
    required this.name,
    required this.email,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [name, email,username];
}
