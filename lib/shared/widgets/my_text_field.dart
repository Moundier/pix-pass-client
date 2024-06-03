import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyTextField extends StatelessWidget {
  
  final String labelText;
  final double padding;

  const MyTextField({
    super.key,
    required this.labelText,
    required this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: const NesInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          focusedBorder: const  NesInputBorder(    
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 4),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0, // Change horizontal padding here
            vertical: 8.0, // Change vertical padding here
          ),
          labelText: labelText, 
          labelStyle: const TextStyle(
            fontFamily: 'minecraftia',
            color: Color.fromARGB(255, 0, 0, 0)
          )
        ),
        style: const TextStyle(fontFamily: 'minecraftia'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            print("Is not valid");
            return 'Not valid';
          } 
          return null;
        },
      ),
    );
  }
}