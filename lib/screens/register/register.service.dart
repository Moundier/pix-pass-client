import 'package:client_flutter/screens/register/register.request.dart';
import 'package:client_flutter/shared/auth/tokens.response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterService {
  
  Future<void> registerUser(String email, String password) async {

    final url = Uri.parse('http://localhost:9090/auth/register'); 
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    try {
      
      final obj = RegisterRequest(
        firstName: 'firstName',
        lastName: 'lastName',
        email: email,
        password: password
      );

      final response = await http.post(url, headers: headers, body: jsonEncode(obj));

      if (response.statusCode == 200) {
        var tokensResponse = TokensResponse.fromJson(jsonDecode(response.body));
        print('${tokensResponse.accessToken}');

      } else {
        print('Failed to register user: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  bool isValidEmail() {
    return true;
  }

  bool isValidPassword() {
    return true;
  }
}
