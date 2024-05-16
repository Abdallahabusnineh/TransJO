import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/repository/setting_base_repository/change_password_repository.dart';

class ChangePasswordSendCodeUseCase extends BaseUseCase<String,NoParameters>{
  ChangePasswordBaseRepository changePasswordBaseRepository;
  ChangePasswordSendCodeUseCase(this.changePasswordBaseRepository);
  @override
  Future<Either<Failure, String>> call(NoParameters parameters) async {
    return await changePasswordBaseRepository.changePasswordSendCode(parameters);
  }
}