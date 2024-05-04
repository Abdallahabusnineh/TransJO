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
  final String userName;
  final String password;

  LoginParameter(this.userName,this.password);
  @override
  // TODO: implement props
  List<Object?> get props => [userName,password];

}