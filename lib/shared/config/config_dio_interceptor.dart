import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class DioInterceptor extends Interceptor {
  
  final _secureStorage = SecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    String accessToken = await _secureStorage.read('access_token');
    logger.f('access_token: $accessToken');

    options.headers['Authorization'] = 'Bearer $accessToken';
    logger.i('Request url: ${options.path.substring(26, options.path.length)}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('Response.status ${response.statusCode}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.i('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return handler.next(err); 
  }
}