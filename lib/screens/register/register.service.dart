import 'package:client_flutter/screens/register/register.request.dart';
import 'package:client_flutter/shared/auth/tokens.response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterService {

  Future<void> registerUser(String email, String password) async {
  final url = Uri.parse('http://localhost:9090/auth/register'); // Adjust URL if needed

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(RegisterRequest(firstName: 'firstName', lastName: 'lastName', email: email, password: password)),
    );

    if (response.statusCode == 200) {
      var tokensResponse = TokensResponse.fromJson(jsonDecode(response.body));
      print('Access Token: ${tokensResponse.accessToken}');
      print('Refresh Token: ${tokensResponse.refreshToken}');
      // Handle tokens or navigate to next screen
    } else {
      print('Failed to register user: ${response.statusCode}');
      print(response.body);
      // Handle error, show message to user, etc.
    }
  } catch (e) {
    print('Error registering user: $e');
    // Handle network errors, timeouts, etc.
  }
}

  bool isValidEmail() {
    return true;
  }

  bool isValidPassword() {
    return true;
  }
}