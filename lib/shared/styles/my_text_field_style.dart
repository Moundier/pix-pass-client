import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyTextFieldStyle {

  static InputDecoration build(String labelText) {
    return InputDecoration(
      border: const NesInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      focusedBorder: const  NesInputBorder(    
        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 4),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10.0, // Change horizontal padding here
      ),
      labelText: labelText, 
      helperStyle: const TextStyle(
        fontFamily: 'minecraftia',
        color: Color.fromARGB(255, 0, 0, 0)
      ),
      hintStyle: const TextStyle(
        fontFamily: 'minecraftia',
        color: Color.fromARGB(255, 0, 0, 0)
      ),
      labelStyle: const TextStyle(
        fontFamily: 'minecraftia',
        color: Color.fromARGB(255, 0, 0, 0)
      ),
      floatingLabelStyle: const TextStyle(
        fontFamily: 'minecraftia',
        color: Color.fromARGB(255, 0, 0, 0)
      ),
      errorStyle: const TextStyle(
        fontFamily: 'minecraftia',
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 190, 0, 0)
      ),
    );
  }

}