import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/error/failure.dart';
import 'package:transjo/core/network/apis.dart';
import 'package:transjo/core/network/error_message_model.dart';
import 'package:transjo/core/utils/dio_helper.dart';
import 'package:transjo/presentation/screens/forgot_password/forgot_password_content.dart';


abstract class BaseForgotPasswordDataSource{
  Future<String> sendCode(ForgotPasswordParameter parameters) ;
  Future<String> verificationCode(VerificationParameter parameters) ;

}
class ForgotPasswordDataSource extends BaseForgotPasswordDataSource{
  @override
  Future<String> sendCode(ForgotPasswordParameter parameters) async {
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
  @override
  Future<String> verificationCode(VerificationParameter parameters) async {
    final result =await DioHelper.postData(url: AppURLs.verificationCode, data:
    {
      'email': ForgotPasswordContent.email,
      'code':parameters.code,
      'newPassword':parameters.newPassword
    });
    print('vervication ${result.data}');
    print('staus is 200 ?? ${result.statusCode}');
    if(result.statusCode==200) {
      return result.data;
    } else {
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
    }
  }

}