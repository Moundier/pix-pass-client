import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyButtonText extends StatelessWidget {
  
  final String text;
  final NesButtonType type;
  final VoidCallback toggleWidget; // Function

  const MyButtonText(this.text, this.type, this.toggleWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(4),
      child: NesButton( 
        type: type,
        
        onPressed: toggleWidget,
        child: Text(
          text, 
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'minecraftia'
          ),
        )
      ),
    );
  }

}