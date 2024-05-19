import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/entites/user_details.dart';
import 'package:transjo/domain/repository/setting_base_repository/base_user_details_repository.dart';

class UserDetailsUseCase extends BaseUseCase<UserDetails,NoParameters>
{
  BaseUserDetailsRepository baseUserDetailsRepository;
  UserDetailsUseCase(this.baseUserDetailsRepository);

  @override
  Future<Either<Failure, UserDetails>> call(NoParameters parameters) async{
    return await baseUserDetailsRepository.getUserDetails();
  }

}