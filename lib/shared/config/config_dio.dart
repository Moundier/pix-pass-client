import 'package:client_flutter/shared/config/config_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:client_flutter/shared/config/config_app.dart';

class DioSingleton {

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: url, 
    // connectTimeout: const Duration(seconds: 5),
    // receiveTimeout: const Duration(seconds: 3),
  ))
  ..interceptors.add(DioInterceptor());

  static Dio get dio => _dio;
}