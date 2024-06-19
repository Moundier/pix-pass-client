import 'dart:convert';
import 'package:client_flutter/screens/tab1/tab1.service.dart';
import 'package:client_flutter/shared/models/storage.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:client_flutter/shared/widgets/my_button.dart';
import 'package:client_flutter/shared/widgets/my_card_storage.dart';
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
  final _tab1service = Tab1Service();
  final authService = AuthService();

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
    logger.w("Initial state");
    _locateAllStorage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _createStorage(String tag, String title) async {
    User? user = await authService.getUserData();
    final obj = Storage(tag: tag, title: title, user: user!);
    Response response = await _tab1service.createStorage(obj);
    
    final json = jsonDecode(response.body);
    Storage storage = Storage.parse(json);

    setState(() {
      storages.add(storage);
      showTextField = false;
      showPlaceholder = storages.isEmpty;
    });
  }

  Future<void> _locateAllStorage() async {
    User? user = await authService.getUserData();
    Response response = await _tab1service.locateAllStorage(user!);
    List<dynamic> json = jsonDecode(response.body);

    setState(() {
      storages = json.map((e) => Storage.parse(e)).toList();
      showPlaceholder = storages.isEmpty;
    });
  }

  Future<void> _deleteStorage(Storage storage) async {
    logger.f(storage);
    setState(() {
      storages.remove(storage);
      showPlaceholder = storages.isEmpty;
    });

    await _tab1service.deleteStorage(storage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset('assets/images/lock.gif'),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 218, 218, 218),
      body: showPlaceholder 
          ? const MyDummy() 
          : ListView.builder(
              itemCount: storages.length,
              itemBuilder: (context, index) {
                return MyCardStorage(
                  paramImage: 'assets/images/key.png',
                  storage: storages[index],
                  onDelete: _deleteStorage,
                );
              },
            ),
      bottomSheet: showTextField 
          ? MyInputContainer(
              context: context, 
              inputTextLabel: "Label", 
              valueTextLabel: "Email", 
              toggleWidget: showInput,
              onCreate: _createStorage,
            ) 
          : MyButton(showInput),
      bottomNavigationBar: const MyNavbar(),
    );
  }
}
