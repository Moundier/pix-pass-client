
import 'package:client_flutter/screens/login/login.page.dart';
import 'package:client_flutter/screens/tab1/tab1.page.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => AuthProvider(),
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: flutterNesTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/tab1': (context) => Tab1Page(),
      },
    );
  }
}

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    if (!authProvider._isAuthenticated) {
      return LoginPage();
    }

    return child;

  }
}

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login(String token) {
    
    // Validate token here
    
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {

    // Invalidate tokens here

    _isAuthenticated = false;
    notifyListeners();
  }
}

