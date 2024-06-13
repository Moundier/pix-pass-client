import 'package:client_flutter/screens/register/register.service.dart';
import 'package:client_flutter/shared/styles/my_input.style.dart';
import 'package:client_flutter/shared/widgets/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class RegisterPage extends StatelessWidget {

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {

  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final RegisterService _registerService = RegisterService();

  TextStyle textStyle() {
    return const TextStyle(fontFamily: 'minecraftia');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Main Page'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NesIconButton(
            icon: NesIcons16.leftArrowIndicator,
            onPress: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Form(
        
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Center(child: Image.asset('assets/images/id_card.png', width: 180, height: 180,),),
            
          const SizedBox(height: 20.0),

          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: MyInputStyle.build("Email"),
            style: TextStyle(),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your email';
              }
              // Add more email validation logic if needed
              return null;
            },
          ),

          const SizedBox(height: 20.0),

          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: MyInputStyle.build("Password"),
            style: TextStyle(),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your password'; // Add more password validation logic if needed
              }
              return null;
            },
          ),

          const SizedBox(height: 20.0),

          TextFormField(
            controller: _confirmController,
            obscureText: true,
            decoration: MyInputStyle.build("Confirm Password"),
            style: TextStyle(),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please confirm your password'; // Add more password validation logic if needed
              }
              if (value != _passwordController.text) {
                return 'Passwords don\'t match';
              }
              return null;
            },
          ),

          const SizedBox(height: 20.0),

          NesButton(
            type: NesButtonType.success,
            onPressed: () {

              if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                 print('Email: ${_emailController.text}, Password: ${_passwordController.text}');
                _registerService.registerUser(_emailController.text, _passwordController.text);

              }

              MyNesSnackbar.show(context, text: "Success", type: MyNesSnackbarType.success);
             
              // Snackbar message
              // Throw a timeinterval
              // Go to login
            },
            child: const Text('Register'),
          ),

        ],
      ),
      ),
    );
  }
}