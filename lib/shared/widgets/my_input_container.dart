import 'package:client_flutter/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyInputContainer extends StatelessWidget {

  final String? inputTextLabel;
  final String? valueTextLabel;

  final VoidCallback? toggleWidget; // Function

  const MyInputContainer({
    super.key,     
    this.inputTextLabel, 
    this.valueTextLabel, 
    this.toggleWidget, 
  });

  InputDecoration inputDecorationWithLabel(String? labelText) {
    return InputDecoration(
      border: const NesInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      focusedBorder: const  NesInputBorder(    
        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 4),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8.0, // Change vertical padding here
        horizontal: 10.0, // Change horizontal padding here
      ),
      labelText: labelText, 
      labelStyle: const TextStyle(
        fontFamily: 'minecraftia',
        color: Color.fromARGB(255, 0, 0, 0)
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {

    final labelController = TextEditingController();
    final inputController = TextEditingController();
    
    EdgeInsets padding = const EdgeInsets.all(8);

    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(

        mainAxisSize: MainAxisSize.min, /// Minimum column size
        children: [

          Row(
            children: [
          
              Expanded(
                child: Container(
                  padding: padding,
                  child: TextField(
                    cursorColor: Colors.red, // Defina a cor do cursor aqui
                    controller: labelController,
                    decoration: MyTheme.inputDecorationWithLabel(inputTextLabel)
                  )
                ),
              ),

              Container(
                padding: padding,
                child: NesButton(
                  onPressed: () { },
                  type: NesButtonType.success, 
                  child: NesIcon(
                    iconData: NesIcons.check, 
                    size: const Size.fromHeight(16)
                  ),
                ),
              ),

              Container(
                padding: padding,
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
                  padding: padding,
                  child: TextFormField(
                    cursorColor: Colors.red,
                    controller: inputController,
                    decoration: inputDecorationWithLabel(valueTextLabel)
                  ),
                ) 
              ),
            ],
          ),
          
        ],
      )
    );
  }

}