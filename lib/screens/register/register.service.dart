import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

typedef JSON = Map<String, dynamic>;

class RegisterService {
  
  Future<void> registerUser(String email, String password) async {

    // '192.168.0.5' 

    final obj = {
      'firstName': '',
      'lastName': '',
      'email': email,
      'password': password,
    };
  
    final Response response = await post(
      Uri.parse('http://localhost:9090/auth/register'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(obj),
    );
    
    JSON json = jsonDecode(response.body);
    print(json);
  }

  bool isValidEmail() {
    return true;
  }

  bool isValidPassword() {
    return true;
  }
}
