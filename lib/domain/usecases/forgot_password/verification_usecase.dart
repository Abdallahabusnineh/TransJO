import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/repository/forgot_password_repo.dart';

class VerificationUseCase extends BaseUseCase<String,VerificationParameter>{
  BaseForgotPasswordRepository baseForgotPasswordRepository;
  VerificationUseCase(this.baseForgotPasswordRepository);
  @override
  Future<Either<Failure, String>> call(VerificationParameter parameters) async {
   return await baseForgotPasswordRepository.verificationCode(parameters);
  }


}