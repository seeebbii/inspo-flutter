import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/data/source/local/hive_database.dart';
import 'package:inspo/presentation/notifiers/connection.notifier.dart';
import 'package:inspo/utils/logger.dart';

import 'api_config.dart';
import 'api_paths.dart';

enum RequestMethod {
  post,
  get,
  put,
  patch,
  delete,
}

class ApiService {
  static late dio.CancelToken cancelToken;

  static Future<Map<String, dynamic>?> request(String path, {required RequestMethod method, data, queryParameters, Function(int sent, int total)? onProgress, bool requestWithRefreshToken = false}) async {

    Log.i('method: ${describeEnum(method)}\nqueryParameters: $queryParameters\ndata: $data\nURL: $path\n${requestWithRefreshToken ? "Refresh Token" : "Access Token"}: ${requestWithRefreshToken ? HiveDatabase.getValue(HiveDatabase.accessToken) : HiveDatabase.getValue(HiveDatabase.accessToken)}', );

    try {
      if(requestWithRefreshToken){
        ApiConfig().dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer ${HiveDatabase.getValue(HiveDatabase.refreshToken)}";
      }else{
        ApiConfig().dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer ${HiveDatabase.getValue(HiveDatabase.accessToken)}";
      }
      ApiConfig().dio.options.method = describeEnum(method);
      cancelToken = dio.CancelToken();

      // dio.Response res = ApiConfig().dio.get(path)

      dio.Response response = await ApiConfig().dio.request(
            path,
            data: data,
            queryParameters: queryParameters,
            onSendProgress: onProgress ?? (int sent, int total) => Log.d("SENT: $sent TOTAL: $total"),
            cancelToken: cancelToken,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  Log.d("Validate Status API SERVICE: $status");
                  return status! < 500;
                },
                headers: {
                  HttpHeaders.contentTypeHeader: data is FormData ? "multipart/form-data" : "application/x-www-form-urlencoded",
                }),
          );

      // Log.e("From the api service class: ${response.data} and the status code: ${response.statusCode}");
      if (response.statusCode == 200) {
        return response.data;
      } else if(response.statusCode == 401){
        return response.data;
      } else {
        return response.data;
      }
    } on dio.DioException catch (e) {

      Log.e("Exception Type: ${e.type}");
      Log.e("DioException $path: $e");
      Log.e("Status Code: ${e.response?.statusCode}");

      // If the status code of new access token is 401, then redirect the user to the login screen
      if(e.response?.statusCode == 401){
        Log.d('User is not authenticated, redirecting to login screen');
      }

      if (e.response?.statusCode != 500) {
        return e.response?.data;
      }
    }

    return null;
  }
}
