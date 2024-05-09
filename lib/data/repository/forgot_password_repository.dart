import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/data/datasource/forgot_password_datasource.dart';
import 'package:transjo/domain/repository/forgot_password_repo.dart';

class ForgotPasswordRepository extends BaseForgotPasswordRepository{
  final BaseForgotPasswordDataSource baseForgotPasswordDataSource;

  ForgotPasswordRepository(this.baseForgotPasswordDataSource);
  @override
  Future<Either<Failure, String>> sendCode(ForgotPasswordParameter parameters) async {
    final result=await baseForgotPasswordDataSource.sendCode(parameters);
    try{
      return Right(result.toString());
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}