import 'package:client_flutter/screens/storage/storage.widget.dart';
import 'package:client_flutter/screens/storage/storage.service.dart';
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

class StoragePage extends StatefulWidget {

  const StoragePage({super.key});
  
  @override
  State<StoragePage> createState() => StoragePageState();
}

class StoragePageState extends State<StoragePage> {

  final _secureStorage = SecureStorage();
  final _tab1service = Tab1Service();

  bool showPlaceholder = false;
  bool showTextField = false;

  List<Storage> storages = [];

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

  Future<void> _createStorage(String tag, String title) async {
    
    int id =  int.parse(await _secureStorage.read('user_id'));

    User? user = User(id: id);
    Storage storage = Storage(tag: tag, title: title, user: user);
    Response response = await _tab1service.createStorage(storage);
    
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
