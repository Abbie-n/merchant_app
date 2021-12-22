import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:merchant_app/core/utils/constants.dart';
import 'package:merchant_app/core/utils/network/logging.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

  Future<Response<dynamic>?> get(url, {Map<String, dynamic>? params}) async {
    try {
      final res = await _dio.get(
        url,
        queryParameters: params ?? {},
      );
      if (res.statusCode! == 200) {
        return res;
      }
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return e.response!;
    }
  }
}
