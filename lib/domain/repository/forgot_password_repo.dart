import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';

abstract class BaseForgotPasswordRepository{
  Future<Either<Failure,String>> sendCode(ForgotPasswordParameter  parameters);

}