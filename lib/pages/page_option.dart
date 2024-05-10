
import 'package:client_flutter/shared/widgets/my_button.dart';
import 'package:client_flutter/shared/widgets/my_card_copy.dart';
import 'package:client_flutter/shared/widgets/my_input_container.dart';
import 'package:client_flutter/shared/widgets/my_list_view.dart';
import 'package:client_flutter/shared/widgets/my_navbar.dart';
import 'package:client_flutter/shared/widgets/my_dummy.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({super.key});
  @override
  State<OptionPage> createState() => OptionPageState();
}

class OptionPageState extends State<OptionPage> {
  
  bool showPlaceholder = false;
  bool showTextField = false;

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
      // Align(
      //   alignment: Alignment.centerRight,
      //   child: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Image.asset('assets/images/waste_basket.png', width: 30, height: 30,),
      //   )
      // ),   
    ];
  }

  @override
  Widget build(BuildContext context) {

    Color background = Color.fromARGB(255, 218, 218, 218);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Option'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NesIconButton(
            icon: NesIcons16.leftArrowIndicator,
            onPress: () => Navigator.of(context).pop(),
          )
        ),
        actions: actionWidget(),
      ),
      body: showPlaceholder ? MyDummy() : MyListView(
        widgetList: [
          
          const SizedBox(height: 10),

          CardCopy(
            option: 'Facebook',
            paramImage: 'assets/key.png', 
            onPressed: () => {}
          ),

          CardCopy(
            option: 'Youtrack',
            paramImage: 'assets/key.png', 
            onPressed: () => {}
          ),

        ]
      ),
      bottomSheet: showTextField ?  MyInputContainer(showInput) : MyButton(showInput,),
      bottomNavigationBar: MyNavbar(),
    );
  }
}

