import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:transjo/core/network/apis.dart';
import 'package:transjo/core/utils/app_constanse.dart';

String basicAuth =
    'Basic ${base64.encode(utf8.encode('${email}:${password}'))}';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApisUrl.baseURL,
      receiveDataWhenStatusError: true, //هات الداتا حتى لو ال status ايرور
      /* headers: {
          'Content-Type': 'application/json',// ال headers الثابتة بحطها هون دايما
       //'lang':'en', لو بدي اياه يرد علي بالانجليزي بستحدم هاي
        }),*/
    ));
  }

  static Future<Response?> getdata({
    required String url,
    dynamic query,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': basicAuth
    };

    return await dio?.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    dynamic query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? basicAuth,
    // String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': basicAuth,
      'accept': 'application/json',
    };
    return dio!.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    dynamic query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': basicAuth ?? ''
    };
    return dio!.put(url, queryParameters: query, data: data);
  }
}
