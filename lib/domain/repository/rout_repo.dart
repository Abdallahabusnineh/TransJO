import 'package:dartz/dartz.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/entites/bus_location.dart';
import 'package:transjo/domain/entites/routs.dart';

abstract class BaseRoutsRepositories {
  Future<Either<Failure, List<Routs>>> getAllRouts();

  Future<Either<Failure, Routs>> getRouteById(int id);
  Future<Either<Failure, String>> addRouteToFav(int id);
  Future<Either<Failure, String>> deleteRouteToFav(int id);
  Future<Either<Failure, List<Routs>>> getAllFavRoutes();
  Future<Either<Failure, BusLocation>> getBusLocation(int busId);

}
