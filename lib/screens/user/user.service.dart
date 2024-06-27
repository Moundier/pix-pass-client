
import 'package:client_flutter/shared/config/config_dio.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:client_flutter/shared/config/config_app.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class UserService {

  final Dio _dio = DioSingleton.dio;

  Future<Response> updateUser(User user) async {
    
    final response = await _dio.put(
      '$url:9090/user',
      data: user,
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      ),
    );
    
    return response;
  }

}