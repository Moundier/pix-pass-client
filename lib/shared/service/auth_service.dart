
import 'dart:convert';

import 'package:client_flutter/shared/models/token_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class SecureStorage {

  final storage = const FlutterSecureStorage();
  
  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value); // encrypt AES
  }

  Future<String> read(String key) async {
    String value = await storage.read(key: key) ?? 'false_'; // 
    return value;
  }

  Future<void> erase() async {
    await storage.delete(key: 'user_id');
    await storage.delete(key: 'access_token');
    await storage.delete(key: 'refresh_token');
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


}