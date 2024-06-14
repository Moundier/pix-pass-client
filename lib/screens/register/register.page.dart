import 'package:client_flutter/screens/login/login.page.dart';
import 'package:client_flutter/screens/register/register.service.dart';
import 'package:client_flutter/shared/service/navigation.service.dart';
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

  final RegisterService _registerService = RegisterService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmFocus = FocusNode();


  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmFocus.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  TextStyle textStyle() {
    return const TextStyle(fontFamily: 'minecraftia');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
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
            focusNode: _emailFocus,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: MyInputStyle.build("Email"),
            style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14, ),
            validator: (value) {

              final text = value ?? '';
              final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
              
              if (text.isEmpty) return 'Please enter your email';

              if (!emailRegex.hasMatch(text)) return 'Invalid email';
              
              return null;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_passwordFocus);
            },
          ),

          const SizedBox(height: 20.0),

          TextFormField(
            focusNode: _passwordFocus,
            controller: _passwordController,
            obscureText: true,
            decoration: MyInputStyle.build("Password"),
            style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14, ),
            validator: (value) {
              
              final text = value ?? '';
              
              if (text.isEmpty) {
                return 'Please enter your password'; // Add more password validation logic if needed
              }

              if (text.length < 2) {
                return 'Password is ${text.length} < 2';
              }

              return null;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_confirmFocus);
            },
          ),

          const SizedBox(height: 20.0),

          TextFormField(
            focusNode: _confirmFocus,
            controller: _confirmController,
            obscureText: true,
            decoration: MyInputStyle.build("Confirm Password"),
            style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14, ),
            validator: (value) {

              final text = value ?? '';

              if (text.isEmpty) {
                return 'Please confirm your password'; // Add more password validation logic if needed
              }

              if (text != _passwordController.text) {
                return 'Passwords don\'t match';
              }

              return null;
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
          ),

          const SizedBox(height: 20.0),

          Row(
            children: <Widget>[
              NesButton(
                type: NesButtonType.success,
                onPressed: () {

                  bool formIsSatisfied = _formKey.currentState != null;
                  bool formIsValidated = _formKey.currentState!.validate();

                  if (formIsSatisfied && formIsValidated) {
                    _registerService.registerUser(_emailController.text, _passwordController.text);
                    print('Email: ${_emailController.text}, Password: ${_passwordController.text}');
                    MyNesSnackbar.show(context, text: "Success", type: MyNesSnackbarType.success);
                    NavigationService.push(context, LoginPage());
                  } 
                },
                child: const Text('Enter'),
              ),

              SizedBox(width: 20,),

              NesButton(
                type: NesButtonType.error,
                child: const Text('Cancel'),
                onPressed: () => { },
              ),

            ],
          )

        ],
      ),
      ),
    );
  }
}