import 'package:client_flutter/screens/register/register.page.dart';
import 'package:client_flutter/screens/tab1/tab1.page.dart';
import 'package:client_flutter/shared/styles/my_hyperlink.style.dart';
import 'package:client_flutter/shared/styles/my_input.style.dart';
import 'package:client_flutter/shared/styles/my_text.style.dart';
import 'package:client_flutter/shared/widgets/my_hyperlink_text.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:client_flutter/shared/service/navigation_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  TextStyle textStyle(Color? color) => TextStyle(color: color, fontSize: 10);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [

                Image.asset(
                  'assets/images/safe.gif',
                  width: 200,
                  height: 200,
                ),
                
                Container(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: MyInputStyle.build("Email"),
                    style: MyTextStyle.build(),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your email'; // Add more email validation logic if needed
                      }
                      return null;
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: MyInputStyle.build("Password"),
                    style: MyTextStyle.build(),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?', style: textStyle(const Color.fromARGB(255, 0, 99, 180))),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                NesButton(
                  type: NesButtonType.primary,
                  child: const Text('Sign In'),
                  onPressed: () => {

                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                      // Send data to server or navigate to next screen
                      print('Email: ${_emailController.text}, Password: ${_passwordController.text}'),

                      // Snackbar message
                      // Throw a timeinterval
                      // Go to login

                      NavigationService.push(context, const Tab1Page()),
                    }
                  }
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 4,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: textStyle(const Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 4,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NesButton(
                      type: NesButtonType.primary,
                      child: Image.asset(
                        'assets/images/face_id.png',
                        width: 50,
                        height: 50,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    NesButton(
                      type: NesButtonType.primary,
                      child: Image.asset(
                        'assets/images/touch_id.png',
                        width: 50,
                        height: 50,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?',
                        style: textStyle(const Color.fromARGB(255, 0, 0, 0))),
                    const SizedBox(width: 10),

                    MyHyperlinkText(text: 'Register Now', onTap: () => NavigationService.push(context, const RegisterPage()),)
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
