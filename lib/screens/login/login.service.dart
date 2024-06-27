import 'package:client_flutter/shared/config/config_dio.dart';
import 'package:dio/dio.dart';
import 'package:client_flutter/shared/config/config_app.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class LoginService {

  final Dio _dio = DioSingleton.dio;

  Future<Response> login(String username, String password) async {
    
    final response = await _dio.post(
      '$url:9090/auth/login',
      data: {'email': username, 'password': password},
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
      )
    );

    return response;
  }

}
