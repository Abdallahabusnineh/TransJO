import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/data/datasource/logout_datasource.dart';
import 'package:transjo/domain/repository/setting_base_repository/logout_base_repository.dart';
class LogOutRepository extends LogOutBaseRepository{
 final LogOutBaseDataSource logOutBaseDataSource;
  LogOutRepository(this.logOutBaseDataSource);
  @override
  Future<Either<Failure, String>> logOut(NoParameters parameters) async {
    final result =
        await logOutBaseDataSource.logout(parameters);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(
          'logout repo failure${failure.errorMessageModel.message}'));
    }
  }
}