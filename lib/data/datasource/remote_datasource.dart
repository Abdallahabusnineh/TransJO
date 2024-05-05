import 'package:dartz/dartz.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/network/network_model/error_message_model.dart';
import 'package:transjo/core/utils/dio_helper.dart';
import 'package:transjo/data/modules/login_model.dart';

abstract class BaseRemoteDataSource{
  Future<LoginUserDataModel> loginApp(LoginParameter parameters);
  Future<LoginUserDataModel> registerApp(RegisterParameter parameters);
}
class RemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<LoginUserDataModel> loginApp(LoginParameter parameters) async{
   final result =await DioHelper.postData(url: 'login', data: {
     'username':parameters.userName,
     'password':parameters.password,
   });
   print('carlossssssssss ${result.data}');
   print('carlossssssssss ${result.statusCode}');
   if(result.statusCode==200) {
     return LoginUserDataModel.fromJson(result.data);
   } else {
     throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
   }
  }

  @override
  Future<LoginUserDataModel> registerApp(RegisterParameter parameters) async{
   final result=await DioHelper.postData(url: 'register', data: {
     'username':parameters.userName,
     'password':parameters.password,
     'name':parameters.name,
     'email':parameters.email,
   });
   print('register ${result.data}');
   print('register ${result.statusCode}');
   if(result.statusCode==200) {
     return LoginUserDataModel.fromJson(result.data);
   } else {
     throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
   }

  }
  
}
