
import 'package:client_flutter/screens/login/login.page.dart';
import 'package:client_flutter/shared/widgets/my_button.dart';
import 'package:client_flutter/shared/widgets/my_card.dart';
import 'package:client_flutter/shared/widgets/my_input_container.dart';
import 'package:client_flutter/shared/widgets/my_list_view.dart';
import 'package:client_flutter/shared/widgets/my_navbar.dart';
import 'package:client_flutter/shared/widgets/my_dummy.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: flutterNesTheme(),
      home: LoginPage(),
    );
  }
}

class MainPage extends StatefulWidget {

  const MainPage({super.key});
  
  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  bool showPlaceholder = false;
  bool showTextField = false;

  void showInput() {
    setState(() {
      showTextField = !showTextField;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset('assets/images/lock.gif', width: 100, height: 100,)
        ),
      ),
      // Here is the colors
      backgroundColor: const Color.fromARGB(255, 218, 218, 218),
      body: showPlaceholder ? const MyDummy() : MyListView(
        widgetList: [
          
          const SizedBox(height: 10),
          
          CardCustom(
            paramImage: 'assets/images/key.png', 
            onPressed: () => {}
          ),

          CardCustom(
            paramImage: 'assets/images/key.png', 
            onPressed: () => {}
          ),

        ]
      ),
      bottomSheet: showTextField ? MyInputContainer(inputTextLabel: "Label", valueTextLabel: "Email", toggleWidget: showInput,) : MyButton(showInput,),
      bottomNavigationBar: MyNavbar(),
    );
  }
}

