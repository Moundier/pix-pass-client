import 'package:client_flutter/screens/login/login.service.dart';
import 'package:client_flutter/screens/register/register.page.dart';
import 'package:client_flutter/screens/tab1/tab1.page.dart';
import 'package:client_flutter/shared/styles/my_input.style.dart';
import 'package:client_flutter/shared/widgets/my_divider.dart';
import 'package:client_flutter/shared/widgets/my_hyperlink_text.dart';
import 'package:client_flutter/shared/widgets/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:client_flutter/shared/service/navigation.service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
        leading: Container(padding: const EdgeInsets.all(8)),
      ),

        body: Center(
          child: Column(
            children: [

              Image.asset(
                'assets/images/safe.gif',
                height: 150,
              ),

              Container(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: MyInputStyle.build("Email"),
                  style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Please enter your email'; // Add more email validation logic if needed

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
                  style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Please enter your password';

                    return null;
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [MyHyperlinkText(text: 'Forgot Password?')],
                ),
              ),

              const SizedBox(height: 20),

              NesButton(
                type: NesButtonType.primary,
                child: const Text('Sign In'),
                onPressed: () async {

                  bool formIsSatisfied = _formKey.currentState != null;
                  bool formIsValidated = _formKey.currentState!.validate();
                  
                  print('Email: ${_emailController.text}');
                  print('Password: ${_passwordController.text}');

                  if (formIsSatisfied && formIsValidated) {

                    Response response = await _loginService.login(
                      _emailController.text, 
                      _passwordController.text
                    );

                    if (response.statusCode == 200) {
                      // Provider.of<AuthProvider>(context, listen: false).isAuthenticated;
                      // Provider.of<AuthProvider>(context, listen: false).login("");
                      print(response.body);
                      NavigationService.push(context, const Tab1Page());                  
                      return;
                    }

                    MyNesSnackbar.show(context, text: "Error: ${response.body}", type: MyNesSnackbarType.error);
                  }
                }
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
                    onPressed: () {  },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
                  const SizedBox(width: 10),
                  MyHyperlinkText(text: 'Register Now', onTap: () => NavigationService.push(context, const RegisterPage()),)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
