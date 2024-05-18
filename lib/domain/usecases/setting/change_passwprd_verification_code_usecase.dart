import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/repository/setting_base_repository/change_password_repository.dart';

class ChangePasswordVerificationCodeUseCase extends BaseUseCase<String,ChangePasswordVerificationParameter>{
  ChangePasswordBaseRepository changePasswordBaseRepository;
  ChangePasswordVerificationCodeUseCase(this.changePasswordBaseRepository);
  @override
  Future<Either<Failure, String>> call(ChangePasswordVerificationParameter parameters) async {
    return await changePasswordBaseRepository.changePasswordVerificationCode(parameters);
  }
}