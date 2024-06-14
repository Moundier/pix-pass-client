import 'package:client_flutter/screens/register/register.request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class RegisterService {
  
  Future<void> registerUser(String email, String password) async {

    // Vice Versa 'localhost' to '192.168.0.5' 
    // final url = Uri.parse('http://localhost:9090/auth/register'); 
    final request = RegisterRequest(
      firstName: 'firstName',
      lastName: 'lastName',
      email: email,
      password: password
    );

    final Response response = await http.post(
      Uri.parse('http://localhost:9090/auth/register'), 
      headers: {'Content-Type': 'application/json;'}, 
      body: jsonEncode(request),
    );
    
    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);
  }

  bool isValidEmail() {
    return true;
  }

  bool isValidPassword() {
    return true;
  }
}
