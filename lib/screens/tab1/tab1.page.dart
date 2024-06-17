import 'dart:convert';
import 'dart:ffi';

import 'package:client_flutter/screens/tab1/tab1.service.dart';
import 'package:client_flutter/shared/models/storage.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:client_flutter/shared/widgets/my_button.dart';
import 'package:client_flutter/shared/widgets/my_card.dart';
import 'package:client_flutter/shared/widgets/my_dummy.dart';
import 'package:client_flutter/shared/widgets/my_input_container.dart';
import 'package:client_flutter/shared/widgets/my_navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class Tab1Page extends StatefulWidget {

  const Tab1Page({super.key});
  
  @override
  State<Tab1Page> createState() => MainPageState();
}

class MainPageState extends State<Tab1Page> {

  final Tab1Service _tab1service = new Tab1Service();

  bool showPlaceholder = false;
  bool showTextField = false;


  List<Storage> storages = []; // List<Storage>

  void showInput() {
    setState(() {
      showTextField = !showTextField;
    });
  }

  @override
  void initState() {
    super.initState();
    _locateAllStorage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _createStorage(String label, String note) async {

    User? user = await AuthService().getUserData();
    // logger.f(user);
    Response response = await _tab1service.createStorage(label, note, user!);
    Map<String, dynamic> obj = jsonDecode(response.body);
    // logger.f('Decoded JSON: $obj');
    Storage storage = Storage.fromJson(obj);
    
    setState(() {
      storages.add(storage);
      showTextField = false; // Hide the input container after adding a new storage
    });
  }

  Future<void> _locateAllStorage() async {

    User? user = await AuthService().getUserData();
    logger.f(user);

    Response response = await _tab1service.locateAllStorage(user!);
    logger.f(response);

    List<dynamic> json = jsonDecode(response.body);
    logger.f(json);

    setState(() {
      json.forEach((element) {
        storages.add(Storage.fromJson(element));  
      }); 
    });
  }

  Future<void> _deleteStorage(Storage storage) async {
    await _tab1service.deleteStorage(storage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset('assets/images/lock.gif',  )
        ),
      ),
      // Here is the colors
      backgroundColor: const Color.fromARGB(255, 218, 218, 218),
      body: showPlaceholder ? const MyDummy() : ListView.builder(
        itemCount: storages.length,
        itemBuilder: (context, index) {
          return CardCustom(
            paramImage: 'assets/images/key.png',
            onPressed: () {
              
            },
            label: storages[index].label,
            note: storages[index].note,
          );
        }
      ),
      bottomSheet: showTextField ? MyInputContainer(
        context: context, 
        inputTextLabel: "Label", 
        valueTextLabel: "Email", 
        toggleWidget: showInput,
        onSubmit: _createStorage
      ) : MyButton(showInput,),
      bottomNavigationBar: MyNavbar(),
    );
  }
}

