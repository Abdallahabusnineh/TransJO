import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/entites/login_succes_entities.dart';
import 'package:transjo/domain/repository/base_trasnsjo_repository.dart';

class LoginUseCase extends BaseUseCase<LoginSuccess,LoginParameter>{
  BaseRepository baseRepository;
  LoginUseCase(this.baseRepository);

  @override
  Future<Either<Failure, LoginSuccess>> call(LoginParameter parameters) async {
    // TODO: implement call
   return await baseRepository.loginApp(parameters);
  }

}