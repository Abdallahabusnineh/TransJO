import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/data/datasource/feedback_datasource.dart';
import 'package:transjo/domain/repository/setting_base_repository/feedback_base_repository.dart';

class FeedBackRepository extends FeedBackBaseRepository{
 final FeedBackBaseDataSource feedBackBaseDataSource;

  FeedBackRepository(this.feedBackBaseDataSource);

  @override
  Future<Either<Failure, String>> feedBack(FeedBackParameter parameters) async {
    final result=await feedBackBaseDataSource.feedBack(parameters);
    try{
      return Right("abod${result.toString()}");
    }on ServerExceptions catch(failure){
      return Left(ServerFailure('abdallah'));
    }
  }

}