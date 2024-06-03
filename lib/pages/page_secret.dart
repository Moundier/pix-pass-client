
import 'package:client_flutter/shared/widgets/my_button.dart';
import 'package:client_flutter/shared/widgets/my_card_copy.dart';
import 'package:client_flutter/shared/widgets/my_dialog.dart';
import 'package:client_flutter/shared/widgets/my_input_container.dart';
import 'package:client_flutter/shared/widgets/my_list_view.dart';
import 'package:client_flutter/shared/widgets/my_navbar.dart';
import 'package:client_flutter/shared/widgets/my_dummy.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class SecretPage extends StatefulWidget {
  const SecretPage({super.key});
  @override
  State<SecretPage> createState() => OptionPageState();
}

class OptionPageState extends State<SecretPage> {
  
  bool showTextField = false;
  bool showPlaceholder = false;

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

      body: showPlaceholder ? const MyDummy() : MyListView(

        widgetList: [
          const SizedBox(height: 10),

          CardCopy(
            option: 'Facebook',
            paramImage: 'assets/key.png',
            onPressed: () => const MyDialog(widget: Text('Hello World')).show(context),
          ),

          CardCopy(
            option: 'Youtrack',
            paramImage: 'assets/key.png', 
            onPressed: () => MyDialog(widget: widget).show(context),
          ),

        ]
      ),
      bottomSheet: showTextField ? MyInputContainer(inputTextLabel: "Label", valueTextLabel: "Password", toggleWidget:  showInput,) : MyButton(showInput,),
      bottomNavigationBar: const MyNavbar(),
    );
  }
}

class Edit extends StatelessWidget {
  
  const Edit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
