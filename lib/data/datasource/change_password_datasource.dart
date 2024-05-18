import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/network/apis.dart';
import 'package:transjo/core/network/error_message_model.dart';
import 'package:transjo/core/utils/app_constanse.dart';
import 'package:transjo/core/utils/dio_helper.dart';

abstract class ChangePasswordBaseDataSource {
  Future<String> changePasswordSendCode(NoParameters parameters);

  Future<String> changePasswordVerificationCode(ChangePasswordVerificationParameter  parameters);
  Future<String> ChangePasswordUpdated(ChangePasswordUpdatedParameter  parameters);
}

class ChangePasswordDataSource extends ChangePasswordBaseDataSource {
  @override
  Future<String> changePasswordSendCode(NoParameters parameters) async {
    try {
      final result = await DioHelper.postData(
          url: AppURLs.changePasswordSendCode, data: {}, token: token);

      if (result.statusCode == 200) {
        return result.data;
      } else {
        print('ffffffffffffffffffffffffffff');
        throw ServerExceptions(
            errorMessageModel:
                ErrorMessageModel.fromJson('abdallah ${result.data}'));
      }
    } on DioException catch (e) {
      log("Testtttttt d ${e.requestOptions.uri}");
      log("Testtttttt d ${e.requestOptions.uri}");
      log("Testttttttw  ${e.response!.statusCode}");
      log("Testttttttd  ${e.response!.data}");
      log("Testttttttddd ${e.requestOptions.uri}");
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      print(' we enter tkdkdk catch ');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<String> changePasswordVerificationCode(ChangePasswordVerificationParameter  parameters) async {
    try {
      final result = await DioHelper.postData(
          url: AppURLs.changePasswordVerificationCode, data: {
            "code":parameters.code
      }, token: token);

      if (result.statusCode == 200) {
        return result.data;
      } else {
        print('ffffffffffffffffffffffffffff');
        throw ServerExceptions(
            errorMessageModel:
                ErrorMessageModel.fromJson('abdallah ${result.data}'));
      }
    } on DioException catch (e) {
      log("Testtttttt d ${e.requestOptions.uri}");
      log("Testtttttt d ${e.requestOptions.uri}");
      log("Testttttttw  ${e.response!.statusCode}");
      log("Testttttttd  ${e.response!.data}");
      log("Testttttttddd ${e.requestOptions.uri}");
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      print(' we enter tkdkdk catch ');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<String> ChangePasswordUpdated(ChangePasswordUpdatedParameter parameters) async {
    try {
      final result = await DioHelper.postData(
          url: AppURLs.changePasswordUpdated, data: {
        "oldPassword":parameters.oldPassword,
        "newPassword":parameters.newPassword,
      }, token: token);

      if (result.statusCode == 200) {
        return result.data;
      } else {
        print('ffffffffffffffffffffffffffff');
        throw ServerExceptions(
            errorMessageModel:
            ErrorMessageModel.fromJson('abdallah ${result.data}'));
      }
    } on DioException catch (e) {
      log("Testtttttt d ${e.requestOptions.uri}");
      log("Testtttttt d ${e.requestOptions.uri}");
      log("Testttttttw  ${e.response!.statusCode}");
      log("Testttttttd  ${e.response!.data}");
      log("Testttttttddd ${e.requestOptions.uri}");
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      print(' we enter tkdkdk catch ');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }
}
