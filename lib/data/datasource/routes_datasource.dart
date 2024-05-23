import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/network/apis.dart';
import 'package:transjo/core/network/error_message_model.dart';
import 'package:transjo/core/utils/app_constanse.dart';
import 'package:transjo/core/utils/dio_helper.dart';
import 'package:transjo/data/modules/BusLocationModel.dart';
import 'package:transjo/data/modules/buses_model.dart';
import 'package:transjo/data/modules/routes_details_model.dart';
import 'package:transjo/data/modules/routs_model.dart';
import 'package:transjo/domain/entites/routs.dart';

abstract class BaseRoutesDatasource {
  Future<List<RoutsModel>> getAllRouts();

  Future<RoutesDetailModel> getRouteById(int id);

  Future<String> addRouteToFav(int id);

  Future<String> deleteRouteFromFav(int id);

  Future<List<Routs>> getAllFavRoutes();

  Future<BusLocationModel> getBusLocation(int busId);
}

class RoutesDatasource extends BaseRoutesDatasource {
  @override
  Future<List<RoutsModel>> getAllRouts() async {
    print('the token we want is teee ${token}');
    try {
      final res =
          await DioHelper.getdata(url: AppURLs.getAllRouts(), token: token);
      print('i9sweeeeeeeeeee here dkdk ${res!.realUri}');
      return List<RoutsModel>.from(
          (res.data as List).map((e) => RoutsModel.fromJson(e)));
    } on DioException catch (e) {
      print('the dddsscccsscc ${e.message}');
      print('the dddsscccsscc ${e.response!.statusCode}');
      print('the dddsscccsscc ${e.response!.data}');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<RoutesDetailModel> getRouteById(int id) async {
    try {
      print('the id is ${id}');
      final res =
          await DioHelper.getdata(url: AppURLs.getRoutById(id), token: token);
      log('the data we want it is ${res!.data}');
      return RoutesDetailModel.fromJson(res!.data);
    } on DioException catch (e) {
      print('the errror we dekdkdk ${e.message}');
      print('the errror we dekdkdk ${e.response!.data}');
      print('the errror we dekdkdk ${e.response!.realUri}');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<String> addRouteToFav(int id) async {
    try {
      final result = await DioHelper.postData(
          url: AppURLs.favoriteRoute(id), data: {}, token: token);
      return "Add Successfully";
    } on DioException catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<List<Routs>> getAllFavRoutes() async {
    try {
      final result = await DioHelper.getdata(
          url: AppURLs.getAllFavRoute(), token: token);
      print('thedddkdkd dddfhjdkd awsddfkj d ${result!.statusCode}');
      print('thedddkdkd dddfhjdkd awsddfkj d ${result!.data}');
      return List<RoutsModel>.from(
          (result.data as List).map((e) => RoutsModel.fromJson(e)));
    } on DioException catch (e) {
      print('the eroro in dkdkdk ${e.message}');
      print('the eroro in dkdkdk ${e.response!.statusCode}');
      print('the eroro in dkdkdk ${e.response!.data}');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<String> deleteRouteFromFav(int id) async {
    try {
      final result = await DioHelper.deleteData(
          url: AppURLs.favoriteRoute(id), data: {}, token: token);
      return "Add Successfully";
    } on DioException catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<BusLocationModel> getBusLocation(int busId) async {
    try {
      final res = await DioHelper.getdata(
          url: AppURLs.getBusLocation(busId), token: token);
      print('the res of data is ${res!.data}');
      return BusLocationModel.fromJson(res!.data);
    } on DioException catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }
}
