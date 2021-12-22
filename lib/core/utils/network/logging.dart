import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
        'METHOD[${options.method}] => PATH: ${options.uri}\nREQUEST: ${options.data} ');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => DATA: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => MESSAGE: ${err.message}',
    );
    return super.onError(err, handler);
  }
}
