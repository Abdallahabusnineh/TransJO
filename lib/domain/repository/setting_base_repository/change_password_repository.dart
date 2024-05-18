import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';

abstract class ChangePasswordBaseRepository{
  Future<Either<Failure,String>> changePasswordSendCode(NoParameters  parameters);
  Future<Either<Failure,String>> changePasswordVerificationCode(ChangePasswordVerificationParameter  parameters);
  Future<Either<Failure,String>> changePasswordUpdated(ChangePasswordUpdatedParameter  parameters);

}