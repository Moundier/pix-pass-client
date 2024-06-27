
import 'package:client_flutter/shared/config/config_app.dart';
import 'package:client_flutter/shared/config/config_dio.dart';
import 'package:client_flutter/shared/models/password.dart';
import 'package:client_flutter/shared/models/storage.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class PasswordService {

  final Dio _dio = DioSingleton.dio;

  Future<Response> createPassword(Password password) async {

    final response = await _dio.post(
      '$url:9090/password',
      data: password,
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'} 
      ),
    );

    return response;
  }

  Future<Response> locateAllPassword(Storage storage) async {

    final response = await _dio.post(
      '$url:9090/password/all',
      data: storage,
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
      )
    );

    return response;
  }

  Future<Response> updatePassword(Password password) async {

    final response = await _dio.put(
      '$url:9090/password',
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
      ),
      data: password
    );

    return response;
  }

  Future<Response> deletePassword(Password password) async {
    
    final response = await _dio.delete(
      '$url:9090/storage',
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      ),
      data: password,
    );
  
    return response;
  }

}
