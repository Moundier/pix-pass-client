
import 'dart:convert';

import 'package:client_flutter/shared/models/user.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:client_flutter/shared/config/config_ambient.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class Tab2Service {

  Future<Response> updateUser(User user) async {
    
    final response = await put(
      Uri.parse('$url:9090/user'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(user),
    );
    
    return response;
  }

}