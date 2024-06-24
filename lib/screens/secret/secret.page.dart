
import 'dart:convert';

import 'package:client_flutter/screens/secret/secret.popup.dart';
import 'package:client_flutter/screens/secret/secret.service.dart';
import 'package:client_flutter/shared/models/password.dart';
import 'package:client_flutter/shared/models/storage.dart';
import 'package:client_flutter/shared/widgets/my_button.dart';
import 'package:client_flutter/shared/widgets/my_card_password.dart';
import 'package:client_flutter/shared/widgets/my_input_container.dart';
import 'package:client_flutter/shared/widgets/my_navbar.dart';
import 'package:client_flutter/shared/widgets/my_dummy.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class PasswordPage extends StatefulWidget {
  
  final Storage storage;

  const PasswordPage({required this.storage, super.key});

  @override
  State<PasswordPage> createState() => PasswordPageState();
}

class PasswordPageState extends State<PasswordPage> {

  final _secretService = SecretService();

  bool showTextField = false;
  bool showPlaceholder = false;

  late List<Password> passwords = [];

  @override
  void initState() {
    super.initState();
    _locateAllPassword(widget.storage);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _createPassword(String tag, String title) async {

    final obj = Password(tag: tag, title: title, storage: widget.storage);
    Response response = await _secretService.createPassword(obj);
    
    final json = jsonDecode(response.body);
    Password password = Password.parse(json);
    passwords.add(password);
    
    setState(() {
      showTextField = false;
    });
  }

  Future<void> _locateAllPassword(Storage storage) async {

    Response response = await _secretService.locateAllPassword(storage);
    List<dynamic> json = jsonDecode(response.body);

    if (!mounted) return; // Prevents error: setState called after dispose

    setState(() {
      passwords.clear();
      for (dynamic e in json) {
        passwords.add(Password.parse(e));
      }  
    });
  }

  Future<void> _updatePassword(Password password) async {
    logger.f('Info: Update Password');
  
    Password? updatedPassword = await PasswordUpdate.show(context, password);
    if (updatedPassword == null) {
      logger.d('Process canceled');
      return;
    }

    Response response = await _secretService.updatePassword(updatedPassword);
    if (response.statusCode != 200) return;

    Password newPassword = Password.parse(jsonDecode(response.body));

    setState(() {
      int index = passwords.indexWhere((el) => el.id == newPassword.id);
      if (index != -1) {
        passwords[index] = newPassword;
      }
    });
  }

  Future<void> _deletePassword(Password password) async {

    if (!mounted) return;

    setState(() {
      passwords.remove(password);
      showPlaceholder = passwords.isEmpty;
    });

    await _secretService.deletePassword(password);
  }

  void showInput() {
    setState(() {
      showTextField = !showTextField;
    });
  }

  @override
  Widget build(BuildContext context) {

    Color background = const Color.fromARGB(255, 218, 218, 218);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NesIconButton(
            icon: NesIcons16.leftArrowIndicator,
            onPress: () => Navigator.of(context).pop(),
          )
        ),
      ),

      body: showPlaceholder ? const MyDummy() : ListView.builder(
        itemCount: passwords.length,
        itemBuilder: (context, index) {
          return MyCardPassword(
            password: passwords[index],
            onUpdate: _updatePassword,
            onDelete: _deletePassword,
          );
        }
      ),
      bottomSheet: showTextField ? MyInputContainer(
        context: context, 
        inputTextLabel: "Label", 
        valueTextLabel: "Password", 
        toggleWidget:  showInput,
        onCreate: _createPassword,
      ) : MyButton(showInput,),
      bottomNavigationBar: const MyNavbar(),
    );
  }
}
