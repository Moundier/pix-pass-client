import 'package:flutter/widgets.dart';

class MyTextStyle extends StatelessWidget {

  final String? text;

  const MyTextStyle({this.text, super.key});

  @override
  Widget build(BuildContext context) {

    return Text(
      text ?? '', 
      style: const TextStyle(
        fontFamily: 'minecraftia',
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 10,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }
}