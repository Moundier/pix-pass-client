import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:client_flutter/shared/config/config_ambient.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class RegisterService {
  
  Future<void> registerUser(String email, String password) async {

    final obj = {
      'firstName': '$email',
      'lastName': '$email',
      'email': email,
      'password': password,
    };
  
    final Response response = await post(
      Uri.parse('$url:9090/auth/register'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(obj),
    );
    
    logger.i(response.body);
  }

}
