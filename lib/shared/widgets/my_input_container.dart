import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyInputContainer extends StatelessWidget {
  
  final VoidCallback toggleWidget; // Function

  const MyInputContainer(this.toggleWidget, {super.key});
  
  @override
  Widget build(BuildContext context) {

    final _controller = TextEditingController();
    
    EdgeInsets padding = const EdgeInsets.all(8);

    InputDecoration inputDecoration = const InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: NesInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      focusedBorder: NesInputBorder(    
        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 4),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 10.0, // Change vertical padding here
        horizontal: 10.0, // Change horizontal padding here
      ),
    );

    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Row(
        children: [
          
          Expanded(
            child: Container(
              padding: padding,
              child: TextField(
                cursorColor: Colors.red, // Defina a cor do cursor aqui
                style: const TextStyle(
                  fontFamily: 'minecraftia',
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
                controller: _controller,
                decoration: inputDecoration
              )
            ),
          ),

          Container(
            padding: padding,
            child: NesButton(
              type: NesButtonType.success, 
              child: NesIcon(
                iconData: NesIcons.check, 
                size: const Size.fromHeight(16)
              ),
              onPressed: () {
                // setState(() {
                //   // this.showTextField = false;
                // });
              },
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
    );
  }

}