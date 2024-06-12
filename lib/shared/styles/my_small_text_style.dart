import 'package:flutter/material.dart';

class MyBoldTextStyle extends StatelessWidget {

  final String? labelText;

  const MyBoldTextStyle(this.labelText, {super.key});

  @override
  Widget build(BuildContext context) {

    String label = labelText ?? '';

    return Text(
      label, 
      style: const TextStyle(
        fontFamily: 'minecraftia',
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 8,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold
      ),
    );
  }
}