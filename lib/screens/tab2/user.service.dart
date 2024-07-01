
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

  final options = Options(headers: {'Content-type': 'application/json; charset=UTF-8'});

  Future<Response> updateUser(User user) async {
    
    final endpoint = '$url:9090/user'; 

    final response = await _dio.put(
      endpoint,
      data: user,
      options: options,
    );
    
    return response;
  }

  Future<Response> getUserById(User user) async {

    final endpoint = '$url:9090/user';

    final response = await _dio.post(
      endpoint,
      data: user, 
      options: options
    );

    return response;
  }

}