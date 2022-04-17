// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void initDio(String baseUrl) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 20000,
        receiveTimeout: 40000,
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
  }

  static void setDioHeader(String token) {
    dio!.options.headers = {HttpHeaders.authorizationHeader: "Bearer $token"};
  }

  static void setDioInterceptor(String baseUrl) {
    dio!.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, responseInterceptorHandler) {
          print("${response.statusCode} | ${response.data.toString()}");
          return responseInterceptorHandler.next(response);
        },
        onRequest: (request, requestInterceptorHandler) {
          print("${request.method} | ${request.path}");
          return requestInterceptorHandler.next(request);
        },
        onError: (DioError e, errorInterceptor) {
          print(e.message);
          return errorInterceptor.next(e);
        },
      ),
    );
  }
}
