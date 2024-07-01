import 'package:client_flutter/screens/tab1/storage.widget.dart';
import 'package:client_flutter/screens/tab1/storage.service.dart';
import 'package:client_flutter/screens/tab2/user.service.dart';
import 'package:client_flutter/shared/models/storage.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:client_flutter/shared/widgets/my_button.dart';
import 'package:client_flutter/shared/widgets/my_card_storage.dart';
import 'package:client_flutter/shared/widgets/my_dummy.dart';
import 'package:client_flutter/shared/widgets/my_input_container.dart';
import 'package:client_flutter/shared/widgets/my_navbar.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class Tab1Page extends StatefulWidget {

  const Tab1Page({super.key});
  
  @override
  State<Tab1Page> createState() => Tab1PageState();
}

class Tab1PageState extends State<Tab1Page> {

  final _secureStorage = SecureStorage();
  final _tab1service = Tab1Service();
  final _userService = UserService();

  bool showPlaceholder = false;
  bool showTextField = false;

  List<Storage> storages = [];
  late User _user;

  void showInput() {
    setState(() {
      showTextField = !showTextField;
    });
  }

  @override
  void initState() {
    super.initState();

    _getUserById();

    _locateAllStorage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getUserById() async {

    User user = User(id: int.parse(await _secureStorage.read('user_id')));
    
    Response response = await _userService.getUserById(user); 

    _user = User.fromJson(response.data);
  }

  Future<void> _createStorage(String tag, String title) async {

    User user = _user;
    user.termsAcceptedDate = null;
    Storage storage = Storage(tag: tag, title: title, user: _user);

    Response response = await _tab1service.createStorage(storage);
    logger.f(response);
    
    final json = response.data;
    storage = Storage.parse(json);

    setState(() {
      storages.add(storage);
      showTextField = false;
      showPlaceholder = storages.isEmpty;
    });
  }

  Future<void> _locateAllStorage() async {

    int id =  int.parse(await _secureStorage.read('user_id'));
    User user = User(id: id);
    Response response = await _tab1service.locateAllStorage(user);

    List<dynamic> json = response.data;

    if (!mounted) return;

    setState(() {
      storages = json.map((e) => Storage.parse(e)).toList();
      showPlaceholder = storages.isEmpty;
    });

  }

  Future<void> _updateStorage(Storage storage) async {

    Storage? updatedStorage = await StorageUpdate.show(context, storage);

    if (updatedStorage == null) return;

    Response response = await _tab1service.updateStorage(updatedStorage);
    if (response.statusCode != 200) return;

    Storage newStorage = Storage.parse(response.data);

    setState(() {
      int index = storages.indexWhere((el) => el.id == newStorage.id);
      if (index != -1) {
        storages[index] = newStorage;
      }
    });
  }

  Future<void> _deleteStorage(Storage storage) async {

    await _tab1service.deleteStorage(storage);

    setState(() {
      storages.remove(storage);
      showPlaceholder = storages.isEmpty;
    });
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
                  onUpdate: _updateStorage,
                  onDelete: _deleteStorage,
                );
              },
            ),
      bottomSheet: showTextField 
        ? MyInputContainer(
            context: context, 
            inputTextLabel: "Tag", 
            valueTextLabel: "Title",
            toggleWidget: showInput,
            onCreate: _createStorage,
          ) 
        : MyButton(showInput), 
      bottomNavigationBar: const MyNavbar(),
    );
  }
}
