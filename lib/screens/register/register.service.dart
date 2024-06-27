import 'dart:async';
import 'package:client_flutter/shared/config/config_dio.dart';
import 'package:dio/dio.dart';
import 'package:client_flutter/shared/config/config_app.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class RegisterService {  

  final Dio _dio = DioSingleton.dio;

  Future<void> registerUser(String email, String password) async {

    final data = {
      'firstName': '$email',
      'lastName': '$email',
      'email': email,
      'password': password,
    };
  
    final Response response = await _dio.post(
      '$url:9090/auth/register',
      data: data,
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'} 
      ),
    );
    
    logger.i(response.data);
  }

}
