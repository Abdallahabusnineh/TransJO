import 'package:dartz/dartz.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/domain/repository/rout_repo.dart';

class GetRouteByIdUsecase {
  final BaseRoutsRepositories baseRoutsRepositories;

  GetRouteByIdUsecase(this.baseRoutsRepositories);

  Future<Either<Failure,Routs>> call (int id)async{
    return await baseRoutsRepositories.getRouteById(id);
  }

}