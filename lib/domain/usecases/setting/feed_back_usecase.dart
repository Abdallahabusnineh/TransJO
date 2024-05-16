import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/domain/repository/setting_base_repository/change_password_repository.dart';
import 'package:transjo/domain/repository/setting_base_repository/feedback_base_repository.dart';

class FeedBackUseCase extends BaseUseCase<String,FeedBackParameter>{
  FeedBackBaseRepository feedBackBaseRepository;
  FeedBackUseCase(this.feedBackBaseRepository);
  @override
  Future<Either<Failure, String>> call( FeedBackParameter parameters) async {
    return await feedBackBaseRepository.feedBack(parameters);
  }
}