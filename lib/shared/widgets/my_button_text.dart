import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyButtonText extends StatelessWidget {
  
  final String? text;
  final NesButtonType? type;
  final VoidCallback? toggleWidget; // Function

  const MyButtonText({this.text, this.type, this.toggleWidget, super.key});

  @override
  Widget build(BuildContext context) {

    String textProvider = text ?? '';

    return NesButton( 
      type: type ?? NesButtonType.normal,
      onPressed: toggleWidget,
      child: Text(
        textProvider, 
        style: const TextStyle(
          color:  Color.fromARGB(255, 0, 0, 0),
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: 'minecraftia'
        ),
      )
    );
  }

}