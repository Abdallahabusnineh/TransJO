import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/repository/setting_base_repository/logout_base_repository.dart';

class LogOutUseCase extends BaseUseCase<String,NoParameters>{
  LogOutBaseRepository logOutBaseRepository;
  LogOutUseCase(this.logOutBaseRepository);
  @override
  Future<Either<Failure, String>> call(NoParameters parameters) async {
    return await logOutBaseRepository.logOut(parameters);
  }
}