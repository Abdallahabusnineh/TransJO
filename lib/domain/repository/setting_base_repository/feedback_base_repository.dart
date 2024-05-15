import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';

abstract class FeedBackBaseRepository{
  Future<Either<Failure,String>> feedBack(FeedBackParameter  parameters);

}