import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/data/datasource/remote_datasource.dart';
import 'package:transjo/domain/entites/login_succes_entities.dart';
import 'package:transjo/domain/repository/base_trasnsjo_repository.dart';

class Repository extends BaseRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  Repository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, String>> loginApp(LoginParameter parameters) async {
    final result=await baseRemoteDataSource.loginApp(parameters);
 try{
   return Right(result );
 }on ServerExceptions catch(failure){
   return Left(ServerFailure(failure.errorMessageModel.message));
 }
  }
}
