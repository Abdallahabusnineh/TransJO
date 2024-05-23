import 'package:dartz/dartz.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/repository/rout_repo.dart';

class DeleteRouteFromFav {
  final BaseRoutsRepositories baseRoutsRepositories;

  DeleteRouteFromFav(this.baseRoutsRepositories);

  Future<Either<Failure, String>> call(int id) async {
    return await baseRoutsRepositories.deleteRouteToFav(id);
  }
}
