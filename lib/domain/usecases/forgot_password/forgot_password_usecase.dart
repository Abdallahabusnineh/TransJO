import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/repository/forgot_password_repo.dart';

class SendCodeUseCase extends BaseUseCase<String,ForgotPasswordParameter>{
  BaseForgotPasswordRepository baseForgotPasswordRepository;
  SendCodeUseCase(this.baseForgotPasswordRepository);
  @override
  Future<Either<Failure, String>> call(ForgotPasswordParameter parameters) async {
   return await baseForgotPasswordRepository.sendCode(parameters);
  }


}