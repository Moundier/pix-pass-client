import 'dart:convert';

import 'package:client_flutter/shared/models/user.dart';
import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:client_flutter/shared/widgets/my_button_text.dart';
import 'package:client_flutter/shared/widgets/my_form.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class Tab2Edit extends StatefulWidget {
  Tab2Edit({Key? key}) : super(key: key);

  @override
  Tab2EditState createState() => Tab2EditState();
}

class Tab2EditState extends State<Tab2Edit>{

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSelected = false;
  bool enableBiometrics = false;
  bool enableRecognition = false;

  User? user;

  Future<void> _profile() async {
    final userStored = await AuthService().getData('user');
    Map<String, dynamic> attr = jsonDecode(userStored);
    user = User.fromJson(attr);
    setState(() {
      _usernameController.text = user?.firstName ?? '';
      _emailController.text = user?.email ?? '';
      _passwordController.text = user?.password ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _profile();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NesIconButton(
            icon: NesIcons16.leftArrowIndicator,
            onPress: () => Navigator.of(context).pop(),
          )
        ),
      ),

      body: Column(
        children: [
          
          MyForm(
            labelText: "Username", 
            controller: _usernameController, 
            validator: (p0) => null, 
            isPassword: false
          ),
          
          MyForm(
            labelText: "Email", 
            controller: _emailController, 
            validator: (p0) => null, 
            isPassword: false
          ),

          MyForm(
            labelText: "Password", 
            controller: _passwordController, 
            validator: (p0) => null, 
            isPassword: true
          ),

          MyForm(
            labelText: "Confirm Password", 
            controller: _passwordController, 
            validator: (p0) => null, 
            isPassword: true
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                child: MyButtonText(text: 'Confirm', type: NesButtonType.success, toggleWidget: () { }),
              ),

              const SizedBox(width: 10,),

              Flexible(
                flex: 1,
                child: MyButtonText(text: 'Cancel', type: NesButtonType.error, toggleWidget: () {  }),
              ),
            ],
          )

        ],
      )
    ); 
  }

}

