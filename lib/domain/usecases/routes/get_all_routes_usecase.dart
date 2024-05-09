import 'package:dartz/dartz.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/domain/repository/rout_repo.dart';

class GetAllRoutesUsecase {
  final BaseRoutsRepositories baseRoutsRepositories;

  GetAllRoutesUsecase(this.baseRoutsRepositories);

  Future<Either<Failure, List<Routs>>> call() async {
    return await baseRoutsRepositories.getAllRouts();
  }
}
