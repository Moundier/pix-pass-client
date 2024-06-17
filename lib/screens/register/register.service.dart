import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:client_flutter/shared/config/constants.dart';

class RegisterService {
  
  Future<void> registerUser(String email, String password) async {

    final obj = {
      'firstName': '$email',
      'lastName': '$email',
      'email': email,
      'password': password,
    };
  
    final Response response = await post(
      Uri.parse('$url:9090/auth/register'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(obj),
    );
    
    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);
  }

}
