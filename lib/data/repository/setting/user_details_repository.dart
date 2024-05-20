import 'package:dartz/dartz.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/data/datasource/user_details_datasource.dart';
import 'package:transjo/domain/entites/user_details.dart';
import 'package:transjo/domain/repository/setting_base_repository/base_user_details_repository.dart';

class UserDetailsRepository extends BaseUserDetailsRepository
{
  BaseUserDetailsDataSource baseUserDetailsDataSource;
  UserDetailsRepository(this.baseUserDetailsDataSource);

  @override
  Future<Either<Failure, UserDetails>> getUserDetails() async {
    final result=await baseUserDetailsDataSource.getUserDetails();
    try {
          return Right(result);
        }on ServerExceptions catch(e)
    {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

}