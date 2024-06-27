import 'package:client_flutter/shared/config/config_app.dart';
import 'package:client_flutter/shared/config/config_dio.dart';
import 'package:client_flutter/shared/models/storage.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class Tab1Service {

  final Dio _dio = DioSingleton.dio;

  Future<Response> createStorage(Storage storage) async {

    final response = await _dio.post(
      '$url:9090/storage',
      data: storage,
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'} 
      ),
    );

    return response;
  }

  Future<Response> locateAllStorage(User user) async {

    final response = await _dio.post(
      '$url:9090/storage/all',
      data: user,
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'}, 
      ),
    );

    return response;
  }

  Future<Response> updateStorage(Storage storage) async {

    final response = await _dio.put(
      '$url:9090/storage',
      data: storage,
      options: Options(
        headers:  {'Content-Type': 'application/json; charset=UTF-8'}
      ),
    );

    return response;
  }

  Future<Response> deleteStorage(Storage storage) async {
    
    final response = await _dio.delete(
      '$url:9090/storage',
      data: storage,
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
      ) ,
    );
  
    return response;
  }

}