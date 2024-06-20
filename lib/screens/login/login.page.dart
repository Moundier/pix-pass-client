import 'dart:convert';

import 'package:client_flutter/screens/login/login.service.dart';
import 'package:client_flutter/screens/register/register.page.dart';
import 'package:client_flutter/screens/tab1/tab1.page.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:client_flutter/shared/service/alert_service.dart';
import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:client_flutter/shared/styles/my_text_field_style.dart';
import 'package:client_flutter/shared/widgets/my_divider.dart';
import 'package:client_flutter/shared/widgets/my_hyperlink_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:client_flutter/shared/service/animate_service.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter(),
);

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  final _authService = AuthService();
  final _loginService = LoginService();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset(
                  'assets/images/safe.gif',
                  height: 150,
                ),

                const SizedBox(height: 20),
                
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: MyTextFieldStyle.build("Email"),
                  style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Please enter your email';
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                ),

                const SizedBox(height: 12),
                
                TextFormField(
                  focusNode: _passwordFocus,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: MyTextFieldStyle.build("Password"),
                  style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Please enter your password';
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                ),

                const SizedBox(height: 10),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyHyperlinkText(text: 'Forgot Password?'),
                  ],
                ),

                const SizedBox(height: 20),
                
                NesButton(
                  type: NesButtonType.primary,
                  child: const Text('Sign In'),
                  onPressed: () async {

                    if (_formKey.currentState!.validate() == false) return;

                    Response response = await _loginService.login(
                      _emailController.text,
                      _passwordController.text,
                    );

                    if (response.statusCode != 200) {
                      AlertService.show(
                        context,
                        text: "Error: ${response.statusCode} ${response.reasonPhrase}",
                        type: AlertType.error,
                      );

                      // return; 
                    }

                    var json = jsonDecode(response.body);

                    User user = User.parse(json['user']);

                    _authService.setData('user', jsonEncode(user));

                    AnimationService.push(context, Tab1Page());
                  },
                ),

                const SizedBox(height: 20),
                
                const MyDivider("Or continue with"),
                
                const SizedBox(height: 10),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NesButton(
                      type: NesButtonType.primary,
                      child: Image.asset('assets/images/face_id.png', width: 50),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    NesButton(
                      type: NesButtonType.primary,
                      child: Image.asset('assets/images/touch_id.png', width: 50),
                      onPressed: () {},
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?', style: TextStyle(color: Colors.black, fontSize: 10)),
                    const SizedBox(width: 10),
                    MyHyperlinkText(
                      text: 'Register Now',
                      onTap: () => AnimationService.push(context, const RegisterPage()),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
