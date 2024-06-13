import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterService {

  final String _apiUrl = 'http://localhost:9090/';

  Future<String> auth(String email, String password) async {
    
    final response = await http.post(
      Uri.parse('$_apiUrl/createAccount'),
      body: jsonEncode({'email': email, 'password': password}),
    );
    
    return 'Account created successfully $response';
  }

  bool isValidEmail() {
    return true;
  }

  bool isValidPassword() {
    return true;
  }
}