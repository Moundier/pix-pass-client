import 'dart:convert';

import 'package:client_flutter/shared/models/user.dart';
import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:client_flutter/shared/widgets/my_appbar_leading.dart';
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

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool isSelected = false;
  bool enableBiometrics = false;
  bool enableRecognition = false;

  User? user;

  Future<void> _profile() async {
    final userStored = await AuthService().getData('user');
    Map<String, dynamic> attr = jsonDecode(userStored);
    user = User.parse(attr);

    setState(() {
      _firstNameController.text = user?.firstName ?? '';
      _lastNameController.text = user?.lastName ?? '';
      _emailController.text = user?.email ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _profile();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        leading: const MyAppBarLeading(),
      ),
      body: Column(
        children: [
          
          MyForm(
            labelText: "First Name", 
            controller: _firstNameController, 
            validator: (p0) => null, 
            isPassword: false
          ),

          MyForm(
            labelText: "Last Name", 
            controller: _lastNameController, 
            validator: (p0) => null, 
            isPassword: false
          ),

          MyForm(
            labelText: "Email", 
            controller: _emailController, 
            validator: (p0) => null, 
            isPassword: false
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
