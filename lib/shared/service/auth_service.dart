
import 'dart:convert';

import 'package:client_flutter/shared/models/token_dto.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class SecureStorage {

  final storage = const FlutterSecureStorage();
  
  Future<void> setData(String key, String value) async {
    await storage.write(key: key, value: value); // encrypt AES
  }

  Future<String> getData(String key) async {
    String value = await storage.read(key: key) ?? 'No data found';
    return value;
  }

  Future<User?> getUserData() async {
    String? request = await storage.read(key: 'user');
    Map<String, dynamic> json = jsonDecode(request ?? '');
    return User.fromJson(json);
  }

  Future<bool> exists(String key) async {
    String? value = await storage.read(key: key);
    return value != null;
  }

  Future<bool> isEnabled(String key) async {
    String? value = await storage.read(key: key);
    
    if (value == null) return false; // Key not found, consider it disabled

    return value.toLowerCase() == 'true';
  }

  Future<void> toggleOption(String key) async {
    String? currentValue = await storage.read(key: key);
    bool newValue = currentValue != 'true';
    await storage.write(key: key, value: newValue.toString());
  }

  Future<Token?> getTokens() async {
    String? request = await storage.read(key: 'token');

    Map<String, dynamic> json = jsonDecode(request ?? '');

    return Token.fromJson(json);
  }

}