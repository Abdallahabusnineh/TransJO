import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/entites/login_succes_entities.dart';
import 'package:transjo/domain/repository/base_trasnsjo_repository.dart';

class RegisterUseCase extends BaseUseCase<String,RegisterParameter>{
  BaseRepository baseRepository;
  RegisterUseCase(this.baseRepository);

  @override
  Future<Either<Failure, String>> call(RegisterParameter parameters) async {
   return await baseRepository.registerApp(parameters);
  }

}