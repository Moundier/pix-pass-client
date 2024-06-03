import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyButton extends StatelessWidget {
  
  final VoidCallback toggleWidget; // Function

  const MyButton(this.toggleWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(4),
      color: const Color.fromARGB(255, 218, 218, 218),
      child: NesButton( 
        type: NesButtonType.primary,
        onPressed: toggleWidget,
        child: NesIcon(
          iconData: NesIcons.add, 
          size: const Size.fromHeight(16)
        )
      ),
    );
  }

}