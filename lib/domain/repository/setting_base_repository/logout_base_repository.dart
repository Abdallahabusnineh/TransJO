import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';

abstract class LogOutBaseRepository{
  Future<Either<Failure,String>> logOut(NoParameters  parameters);

}