import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/network/apis.dart';
import 'package:transjo/core/network/error_message_model.dart';
import 'package:transjo/core/utils/app_constanse.dart';
import 'package:transjo/core/utils/dio_helper.dart';

abstract class LogOutBaseDataSource {
  Future<String> logout(NoParameters parameters);
}
class LogOutDataSource extends LogOutBaseDataSource {
  @override
  Future<String> logout(NoParameters parameters) async {
    try {
      final result = await DioHelper.getdata(url: AppURLs.logout, token: token);
      if (result?.statusCode == 200) {
        return result?.data;
      } else {
        print('logout');
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                'updated password datasource ${result?.data}'));
      }
    } on DioException catch (e) {
      log("updated password datasource ${e.requestOptions.uri}");
      log("updated password datasource ${e.requestOptions.uri}");
      log("updated password datasource  ${e.response!.statusCode}");
      log("updated password datasource  ${e.response!.data}");
      log("updated password datasource ${e.requestOptions.uri}");
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      print(' we enter updated password datasource catch ');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }
}
