import 'package:client_flutter/screens/user/user.service.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:client_flutter/shared/styles/my_text_field_style.dart';
import 'package:client_flutter/shared/widgets/my_appbar_leading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';
import 'dart:convert';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class Tab2Edit extends StatefulWidget {

  const Tab2Edit({super.key});

  @override
  Tab2EditState createState() => Tab2EditState();
}

class Tab2EditState extends State<Tab2Edit> {

  final _tab2Service = Tab2Service();
  final authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  bool isSelected = false;
  bool enableBiometrics = false;
  bool enableRecognition = false;

  late User user;

  Future<void> _profile() async {
    final userStored = await authService.getData('user');
    Map<String, dynamic> attr = jsonDecode(userStored);
    user = User.parse(attr);

    setState(() {
      _firstNameController.text = user.firstName ?? '';
      _lastNameController.text = user.lastName ?? '';
      _emailController.text = user.email ?? '';
    });
  }

  void _handleConfirm() async {

    logger.f('Update Confirmed');

    final updatedUser = User(
      id: user.id, 
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      termsAcceptedDate: user.termsAcceptedDate,
      password: user.password,
      role: user.role,
      tutorialComplete: user.tutorialComplete
    );

    logger.f(updatedUser.toString());
    Response response = await _tab2Service.updateUser(updatedUser);

    if (!mounted) return;

    if (response.statusCode != 200) {
      Navigator.pop(context);
    }

    Navigator.pop(context, updatedUser);
  }

  @override
  void initState() {
    super.initState();
    _profile();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        leading: const MyAppBarLeading(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                focusNode: _firstNameFocusNode,
                decoration: MyTextFieldStyle.build("First Name").copyWith(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _firstNameController.clear();
                    },
                  ),
                ),
                style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_lastNameFocusNode);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _lastNameController,
                focusNode: _lastNameFocusNode,
                decoration: MyTextFieldStyle.build("Last Name").copyWith(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _lastNameController.clear();
                    },
                  ),
                ),
                style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: MyTextFieldStyle.build("Email").copyWith(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _emailController.clear();
                    },
                  ),
                ),
                style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 2,
                    child: NesButton(
                      type: NesButtonType.success,
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontFamily: 'minecraftia',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {

                        if (_formKey.currentState!.validate() == false) {
                          logger.f('Values were not provided');
                          return;
                        }

                        _handleConfirm();
                      }
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: NesButton(
                      type: NesButtonType.error,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: 'minecraftia',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        // Handle cancellation
                      },
                    ),
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
