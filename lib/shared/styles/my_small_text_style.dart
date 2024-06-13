import 'package:flutter/material.dart';

class MyBoldTextStyle extends StatelessWidget {

  final String? labelText;

  const MyBoldTextStyle(this.labelText, {super.key});

  @override
  Widget build(BuildContext context) {

    return Text(
      labelText ?? '', 
      style: const TextStyle(
        fontFamily: 'minecraftia',
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold
      ),
    );
  }
}