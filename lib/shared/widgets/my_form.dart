import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyForm  extends StatefulWidget {

  final FocusNode? focusNode;
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final void Function()? onEditingComplete;

  const MyForm({
    super.key,
    this.focusNode,
    this.labelText,
    this.controller,
    this.validator,
    this.isPassword,
    this.onEditingComplete
  });

  @override
  State<MyForm> createState() => MyFormState(); 
}

class MyFormState extends State<MyForm> {
  
  bool _isVisible = false;

  IconButton iconButton() {
    return IconButton(
      icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        setState(() {
          _isVisible = !_isVisible;
        });
      },
    );
  } 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
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
        labelText: widget.labelText, 
        labelStyle: const TextStyle(
          fontFamily: 'minecraftia',
          color: Colors.black,
          fontSize: 16,
        ),
        suffixIcon: (widget.isPassword ?? false) ? iconButton() : null,
      ),
      obscureText: (widget.isPassword ?? false) && !_isVisible,
      validator: widget.validator,
      style: const TextStyle(
        fontFamily: 'minecraftia',
        fontSize: 16,
      ),
      onEditingComplete: widget.onEditingComplete,
    );
  }
}