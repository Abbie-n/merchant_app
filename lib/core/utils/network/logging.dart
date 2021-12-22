import 'package:dio/dio.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        'METHOD[${options.method}] => PATH: ${options.uri}\nREQUEST: ${options.data} ');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => DATA: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => MESSAGE: ${err.message}',
    );
    return super.onError(err, handler);
  }
}
