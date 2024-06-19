
import 'dart:convert';

import 'package:client_flutter/screens/tab1/tab1.service.dart';
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

  final _tab1Service = Tab1Service();
  
  bool showTextField = false;
  bool showPlaceholder = false;

  List<Password> passwords = [];

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
    logger.d("_createPassword Flow");
    logger.d(tag + " " + title + " " + widget.storage.toString());

    Response response = await _tab1Service.createPassword(obj);
    logger.d("response");
    logger.d(response);
    
    final json = jsonDecode(response.body);
    Password password = Password.parse(json);
    passwords.add(password);
    
    setState(() {
      showTextField = false;
    });
  }

  Future<void> _locateAllPassword(Storage storage) async {

    Response response = await _tab1Service.locateAllPassword(storage);
    List<dynamic> json = jsonDecode(response.body);

    setState(() {
      for (dynamic e in json) {
        passwords.add(Password.parse(e));
      }  
    });
  }

  Future<void> _updatePassword(Password password) async {

  }

  Future<void> _deletePassword(Password password) async {

    setState(() {
      
    });
  }

  void showInput() {
    setState(() {
      showTextField = !showTextField;
    });
  }

  Color background = const Color.fromARGB(255, 154, 154, 154);

  List<Widget> actionWidget() {

    return [
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/images/pencil.png', width: 30, height: 30,),
        )
      ), 
    ];
  }

  @override
  Widget build(BuildContext context) {

    Color background = const Color.fromARGB(255, 218, 218, 218);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Secret Page'),
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
