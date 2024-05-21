import 'package:dartz/dartz.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/domain/repository/base_trasnsjo_repository.dart';
import 'package:transjo/domain/repository/rout_repo.dart';

class GetAllFavRoutesUsecase {
  final BaseRoutsRepositories baseRoutsRepositories;

  GetAllFavRoutesUsecase(this.baseRoutsRepositories);

  Future<Either<Failure, List<Routs>>> call() async {
    return await baseRoutsRepositories.getAllFavRoutes();
  }
}
