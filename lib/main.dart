
import 'package:client_flutter/screens/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: flutterNesTheme(),
      home: LoginPage(),
    );
  }
}
