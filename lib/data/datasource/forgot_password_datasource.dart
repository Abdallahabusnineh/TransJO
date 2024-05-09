import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/core/network/apis.dart';
import 'package:transjo/core/network/error_message_model.dart';
import 'package:transjo/core/utils/dio_helper.dart';

abstract class BaseForgotPasswordDataSource{
  Future<Either<Failure, String>> sendCode(ForgotPasswordParameter parameters) ;

}
class ForgotPasswordDataSource extends BaseForgotPasswordDataSource{
  @override
  Future<Either<Failure, String>> sendCode(ForgotPasswordParameter parameters) async {
  final result =await DioHelper.postData(url: AppURLs.forgotPassword, data:
  {
    'email': parameters.email,
  });
  print('send code ${result.data}');
  print('send code ${result.statusCode}');
  if(result.statusCode==200) {
    return result.data;
  } else {
    throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }
  }

}