import 'package:dartz/dartz.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/entites/bus_location.dart';
import 'package:transjo/domain/repository/rout_repo.dart';

class BusLocationUsecase {
  final BaseRoutsRepositories baseRoutsRepositories;

  BusLocationUsecase(this.baseRoutsRepositories);

  Future<Either<Failure,BusLocation>> call (int busId)async{
    return await baseRoutsRepositories.getBusLocation(busId);
  }

}