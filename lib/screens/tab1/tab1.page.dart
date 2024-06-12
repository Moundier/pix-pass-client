import 'package:client_flutter/shared/widgets/my_button.dart';
import 'package:client_flutter/shared/widgets/my_card.dart';
import 'package:client_flutter/shared/widgets/my_dummy.dart';
import 'package:client_flutter/shared/widgets/my_input_container.dart';
import 'package:client_flutter/shared/widgets/my_list_view.dart';
import 'package:client_flutter/shared/widgets/my_navbar.dart';
import 'package:flutter/material.dart';


class Tab1Page extends StatefulWidget {

  const Tab1Page({super.key});
  
  @override
  State<Tab1Page> createState() => MainPageState();
}

class MainPageState extends State<Tab1Page> {

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

