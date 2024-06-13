import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  
  final String _apiUrl = 'http://localhost:9090/';

  bool validateSignIn() {
    return true;
  }

  bool validateEnroll() {
    return true;
  }

  Future<String> signin(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_apiUrl/authenticate'),
      body: jsonEncode({'username': username, 'password': password}),
    );

    return jsonDecode(response.body)['token'];
  }
  
}
