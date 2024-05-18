import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:transjo/core/error/failure.dart';

abstract class BaseUseCase<T,Parametres>{
  Future<Either<Failure,T>>call( Parametres parameters);
}
class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoginParameter extends Equatable{
  final String email;
  final String password;

  LoginParameter(this.email,this.password);
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];

}
class ForgotPasswordParameter extends Equatable{
  final String email;


  ForgotPasswordParameter(this.email);
  @override
  // TODO: implement props
  List<Object?> get props => [email];

}
class FeedBackParameter extends Equatable{
  final String text;


  FeedBackParameter(this.text);
  @override
  // TODO: implement props
  List<Object?> get props => [text];

}
class ChangePasswordVerificationParameter extends Equatable{
  final String code;


  ChangePasswordVerificationParameter(this.code);
  @override
  // TODO: implement props
  List<Object?> get props => [code];

}
class ChangePasswordUpdatedParameter extends Equatable{
  final String oldPassword;
  final String newPassword;
  ChangePasswordUpdatedParameter(this.oldPassword,this.newPassword);
  @override
  // TODO: implement props
  List<Object?> get props => [oldPassword,newPassword];

}
class VerificationParameter extends Equatable{
  final String code;
  final String newPassword;

  VerificationParameter(this.code, this.newPassword);
  @override
  // TODO: implement props
  List<Object?> get props => [code,newPassword];
}
class RegisterParameter extends Equatable{
  final String name;
  final String email;
  final String password;

  RegisterParameter({ required this.name, required this.email, required this.password});


  @override
  // TODO: implement props
  List<Object?> get props => [password,name,email];

}