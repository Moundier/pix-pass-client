

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

    String? jsonString = await storage.read(key: 'user');
    if (jsonString != null) {
      Map<String, dynamic> json = jsonDecode(jsonString);
      return User.parse(json);
    }
    return null; // Handle case where user data is not found or parsing fails
  }

  Future<bool> isLoggedIn() async {
    String? token = await getData("token");
    return token != null;
  }

  cleanStorage(String key) async {
    await storage.delete(key: key);
  }

  cleanAllStorage() async {
    await storage.deleteAll();
  }
}