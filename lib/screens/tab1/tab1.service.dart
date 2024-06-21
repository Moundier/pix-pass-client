import 'dart:convert';

import 'package:client_flutter/shared/models/password.dart';
import 'package:client_flutter/shared/models/storage.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:http/http.dart';
import 'package:client_flutter/shared/config/constants.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class Tab1Service {

  /// Handling storage-related HTTP requests.

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

  /// Handling password-related HTTP requests.
  
  Future<Response> createPassword(Password password) async {
    final response = await post(
      Uri.parse('$url:9090/password'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(password),
    );

    logger.d("create password");

    return response;
  }

  Future<Response> locateAllPassword(Storage storage) async {
    final response = await post(
      Uri.parse('$url:9090/password/all'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(storage)
    );

    return response;
  }

  Future<Response> updatePassword(Password password) async {
    return await post(Uri());
  }

  Future<Response> deletePassword(Password password) async {
    final response = await delete(
      Uri.parse('$url:9090/storage'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(password),
    );
  
    return response;
  }
}