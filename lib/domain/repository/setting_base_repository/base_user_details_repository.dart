import 'package:dartz/dartz.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/entites/user_details.dart';

abstract class BaseUserDetailsRepository
{
  Future<Either<Failure,UserDetails>>getUserDetails();
}