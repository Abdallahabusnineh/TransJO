import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/network/network_model/error_message_model.dart';
import 'package:transjo/core/utils/dio_helper.dart';
import 'package:transjo/data/modules/login_success_model.dart';

abstract class BaseRemoteDataSource{
  Future<LoginSuccessModel?> loginApp(LoginParameter parameters);
}
class RemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<LoginSuccessModel?> loginApp(LoginParameter parameters) async{
   final result =await DioHelper.postData(url: 'login', data: {
     'username':parameters.userName,
     'password':parameters.password,
   });
   if(result.statusCode==200)
     return LoginSuccessModel.fromJson(result?.data);
   else
     throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }
  
}
