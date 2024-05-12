import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyTextField extends StatelessWidget {
  final String labelText;

  const MyTextField({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
            vertical: 8.0, // Change vertical padding here
            horizontal: 10.0, // Change horizontal padding here
          ),
          labelText: labelText, 
          labelStyle: const TextStyle(
            fontFamily: 'minecraftia',
            color: Color.fromARGB(255, 0, 0, 0)
          )
        ),
        style: const TextStyle(fontFamily: 'minecraftia'),
        validator: (value) {
          
          if (value == null || value.isEmpty) return 'Not valid';
          
          return null;
        },
      ),
    );
  }
}