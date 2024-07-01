
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

  WidgetsFlutterBinding.ensureInitialized();

  config();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: flutterNesTheme(),
      home: const LoginPage(),
    );
  }
}



Future<void> config() async {
  final secureService = SecureStorage();
  await secureService.write('biometric_enabled', 'false:');
}