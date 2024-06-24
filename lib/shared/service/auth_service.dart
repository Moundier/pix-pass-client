
import 'dart:convert';

import 'package:client_flutter/shared/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class AuthService {

  final storage = const FlutterSecureStorage();
  
  setData(String key, String value) async {
    await storage.write(key: key, value: value); // encrypt AES
  }

  getData(String key) async {
    String value = await storage.read(key: key) ?? 'No data found';
    return value;
  }

  Future<User?> getUserData() async {
    String? request = await storage.read(key: 'user');

    Map<String, dynamic> json = jsonDecode(request ?? '');

    return User.parse(json);
  }

}