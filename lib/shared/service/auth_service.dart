
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class SecureStorage {

  final storage = const FlutterSecureStorage();
  
  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value); // AES encryption
  }

  Future<String> read(String key) async {
    return await storage.read(key: key) ?? 'false_'; // AES dencryption
  }

  Future<void> deleteAll() async {
    storage.deleteAll();
  }

  Future<bool> exists(String key) async {
    String? value = await storage.read(key: key);
    return value != null;
  }
}