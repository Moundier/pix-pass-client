import 'package:client_flutter/shared/styles/my_text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

enum MyInputContainerType {
  storageInput,
  passwordInput,
}

class MyInputContainer extends StatelessWidget {

  final BuildContext? context;
  final String? inputTextLabel;
  final String? valueTextLabel;
  final VoidCallback? toggleWidget; // Function
  final Function(String, String)? onCreate; // Function to handle form submission

  const MyInputContainer({
    super.key,     
    this.context,
    this.inputTextLabel, 
    this.valueTextLabel, 
    this.toggleWidget, 
    this.onCreate,
  });

  TextStyle font() => const TextStyle(fontFamily: 'minecraftia'); 

  @override
  Widget build(BuildContext context) {

    final tagCtrl = TextEditingController();
    final titleCtrl = TextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min, /// Minimum column size
      
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  cursorColor: Colors.red, // Defina a cor do cursor aqui
                  controller: tagCtrl,
                  decoration: MyTextFieldStyle.build(inputTextLabel ?? ''),
                  style: font()
                )
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: NesButton(
                onPressed: () =>  onCreate!(tagCtrl.text, titleCtrl.text),
                type: NesButtonType.success, 
                child: NesIcon(
                  iconData: NesIcons.check, 
                  size: const Size.fromHeight(16)
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: NesButton(
                type: NesButtonType.error, 
                onPressed: toggleWidget,
                child: NesIcon(
                  iconData: NesIcons.close, 
                  size: const Size.fromHeight(16)
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.red,
                  controller: titleCtrl,
                  decoration: MyTextFieldStyle.build(valueTextLabel ?? ''),
                  style: font()
                ),
              ) 
            ),
          ],
        ),
      ],
    );
  }
}