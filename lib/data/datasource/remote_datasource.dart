import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/network/apis.dart';
import 'package:transjo/core/network/error_message_model.dart';
import 'package:transjo/core/utils/dio_helper.dart';
import 'package:transjo/data/modules/login_model.dart';

abstract class BaseRemoteDataSource {
  Future<LoginUserDataModel> loginApp(LoginParameter parameters);

  Future<LoginUserDataModel> registerApp(RegisterParameter parameters);
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<LoginUserDataModel> loginApp(LoginParameter parameters) async {
    try {
      final result = await DioHelper.postData(
        url: AppURLs.userLogin,
        data: {
          'email': parameters.email,
          'password': parameters.password,
        },

      );
      print('carlossssssssss ${result.data}');
      print('carlossssssssss ${result.statusCode}');
      if (result.statusCode == 200) {
        return LoginUserDataModel.fromJson(result.data);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(result.data));
      }
    } on DioException catch (e) {
      log('carlossssssssssddddddddddd ${e.response!.data}');
      log('carlossssssssssddddddddddd ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<LoginUserDataModel> registerApp(RegisterParameter parameters) async {
    try {
      final result = await DioHelper.postData(
        url: AppURLs.userRegister,
        data: {
          'password': parameters.password,
          'fullName': parameters.name,
          'email': parameters.email,
        },
      );
      print('register ${result.data}');
      print('register ${result.statusCode}');
      if (result.statusCode == 200) {
        return LoginUserDataModel.fromJson(result.data);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(result.data));
      }
    } on DioException catch (e) {
      print('the dkdkdkdk ${e.message}');
      print('the dkdkdkdk ${e.response!.statusCode}');
      print('the dkdkdkdk ${e.response!.data}');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }
}
