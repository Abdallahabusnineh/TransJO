import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/network/apis.dart';
import 'package:transjo/core/network/error_message_model.dart';
import 'package:transjo/core/utils/dio_helper.dart';

abstract class ChangePasswordBaseDataSource{
  Future<String> changePasswordSendCode(NoParameters parameters) ;

}
class ChangePasswordDataSource extends ChangePasswordBaseDataSource {
  @override
  Future<String> changePasswordSendCode(NoParameters parameters) async {
    final result =await DioHelper.postData(url: AppURLs.changePasswordSendCode, data:
    {
    });
    print('send code from app ${result.data}');
    print('send code from app${result.statusCode}');
    if(result.statusCode==200) {
      return result.data;
    } else {
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
    }
  }
}