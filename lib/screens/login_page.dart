import 'package:client_flutter/main.dart';
import 'package:client_flutter/shared/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:client_flutter/shared/service/navigation_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 218, 218),
      
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              // logo
              // Image.asset('lib/images/key_turning.gif', width: 200, height: 200,),
              Image.asset('assets/images/safe.gif', width: 200, height: 200,),

              const SizedBox(height: 10),

              // text fields
              const MyTextField(labelText: 'Email', padding: 16),
              const SizedBox(height: 10),
              const MyTextField(labelText: 'Password', padding: 16),

              const SizedBox(height: 10),

              // forgot password?
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 99, 180),
                        fontSize: 10
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              NesButton(
                type: NesButtonType.primary, 
                child: const Text('Sign In'),
                onPressed: () { 
                  NavigationService.push(context, MainPage());
                },
              ),

              const SizedBox(height: 20),

              // or continue with
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: const Row(
                  children: [

                    Expanded(
                      child: Divider(
                        thickness: 4,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 10),
                      ),
                    ),

                    Expanded(
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
                  NesButton(type: NesButtonType.primary, child: Image.asset('assets/images/face_id.png', width: 50, height: 50,), onPressed: () {  } ,),
                  const SizedBox(width: 25),
                  NesButton(type: NesButtonType.primary, child: Image.asset('assets/images/touch_id.png', width: 50, height: 50,), onPressed: () {  } ,),
                ],
              ),

              const SizedBox(height: 20),

              // not a member? register now
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 10),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Register now',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 99, 180),
                      fontSize: 10
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}