import 'dart:convert';

import 'package:client_flutter/shared/config/config_ambient.dart';
import 'package:client_flutter/shared/models/storage.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class Tab1Service {

  Future<Response> createStorage(Storage storage) async {

    final response = await post(
      Uri.parse('$url:9090/storage'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(storage),
    );

    return response;
  }

  Future<Response> locateAllStorage(User user) async {

    final response = await post(
      Uri.parse('$url:9090/storage/all'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(user)
    );

    return response;
  }

  Future<Response> updateStorage(Storage storage) async {

    final response = await put(
      Uri.parse('$url:9090/storage'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(storage)
    );

    return response;
  }

  Future<Response> deleteStorage(Storage storage) async {
    
    final response = await delete(
      Uri.parse('$url:9090/storage'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(storage),
    );
  
    return response;
  }

}