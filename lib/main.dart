
import 'package:client_flutter/screens/login/login.page.dart';
import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

void main() {
  runApp(const MyApp());
  testLoggerPackage();
  testSecureStorage();
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: flutterNesTheme(),
      home: LoginPage(),
    );
  }
}

void testLoggerPackage() {
  logger.d('Debug message');
  logger.i('Info message');
  logger.w('Warning message');
  logger.e('Error message');
  logger.f('WTF message');
}

void testSecureStorage() async {
  // Set a test value
  AuthService().getData('testKey');
  AuthService().cleanStorage('testKey');
  AuthService().setData('testKey', 'testValue');
}
