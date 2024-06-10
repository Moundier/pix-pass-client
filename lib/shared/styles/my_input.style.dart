import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyInputStyle {
  
  final String? labelText;

  const MyInputStyle(this.labelText);
  
  InputDecoration build(BuildContext context) {
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

}