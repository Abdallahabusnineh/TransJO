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

}class RegisterParameter extends Equatable{
  final String name;
  final String email;
  final String password;

  RegisterParameter({ required this.name, required this.email, required this.password});


  @override
  // TODO: implement props
  List<Object?> get props => [password,name,email];

}