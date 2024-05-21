import 'package:dartz/dartz.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/data/datasource/routes_datasource.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/domain/repository/rout_repo.dart';

class RoutesRepository extends BaseRoutsRepositories {
  final BaseRoutesDatasource baseRoutesDatasource;

  RoutesRepository(this.baseRoutesDatasource);

  @override
  Future<Either<Failure, List<Routs>>> getAllRouts() async {
    try {
      final result = await baseRoutesDatasource.getAllRouts();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, Routs>> getRouteById(int id) async {
    try {
      final result = await baseRoutesDatasource.getRouteById(id);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> addRouteToFav(int id) async{
     try{
       final result = await baseRoutesDatasource.addRouteToFav(id);
       return Right(result);
     }on ServerExceptions catch(e){
      return Left(ServerFailure(e.errorMessageModel.message));
     }
  }

  @override
  Future<Either<Failure, List<Routs>>> getAllFavRoutes() async{
    try{
      final result = await baseRoutesDatasource.getAllFavRoutes();
      return Right(result);
    }on ServerExceptions catch(e){
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
