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
  final Options options = Options(
    headers: {'Content-Type':'application/json; charset=UTF-8'}
  );

  Future<Response> createStorage(Storage storage) async {

    final endpoint = '$url:9090/storage';

    final response = await _dio.post(
      endpoint, 
      data: storage, 
      options: options,
    );

    return response;
  }

  Future<Response> locateAllStorage(User user) async {
    
    final endpoint = '$url:9090/storage/all';

    final response = await _dio.post(
      endpoint, data: user, options: options,
    );

    return response;
  }

  Future<Response> updateStorage(Storage storage) async {

    final endpoint = '$url:9090/storage';

    final response = await _dio.put(
      endpoint, 
      data: storage, 
      options: options,
    );

    return response;
  }

  Future<Response> deleteStorage(Storage storage) async {
    
    final endpoint = '$url:9090/storage';

    final response = await _dio.delete(
      endpoint, 
      data: storage, 
      options: options
    );
  
    return response;
  }

}