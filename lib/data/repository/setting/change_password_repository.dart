import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/data/datasource/change_password_datasource.dart';
import 'package:transjo/domain/repository/setting_base_repository/change_password_repository.dart';

class ChangePasswordRepository extends ChangePasswordBaseRepository{
  final ChangePasswordBaseDataSource changePasswordBaseDataSource;

  ChangePasswordRepository(this.changePasswordBaseDataSource);
  @override
  Future<Either<Failure, String>> changePasswordSendCode(NoParameters parameters) async {
    final result=await changePasswordBaseDataSource.changePasswordSendCode(parameters);
    try{
      return Right("abod${result.toString()}");
    }on ServerExceptions catch(failure){
      return Left(ServerFailure('abdallah'));
    }
  }

}