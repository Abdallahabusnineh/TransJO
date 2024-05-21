import 'package:dartz/dartz.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/repository/rout_repo.dart';

class AddRouteToFavUsecase {
  final BaseRoutsRepositories baseRoutsRepositories;

  AddRouteToFavUsecase({required this.baseRoutsRepositories});

  Future<Either<Failure, String>> call(int id) async {
    return await baseRoutsRepositories.addRouteToFav(id);
  }
}
