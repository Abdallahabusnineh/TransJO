import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/entites/login_succes_entities.dart';

abstract class BaseRepository{
  Future<Either<Failure,String>> loginApp(LoginParameter  parameters);
}