import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {

  final String text;

  const MyDivider(this.text, { super.key });
  
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const SizedBox(height: 30,),
        Text(text, 
          style: const TextStyle(
            fontFamily: 'minecraftia', 
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
        ),
        const SizedBox(width: 10,),
        const Expanded(
          child: Divider(
            thickness: 3,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }

}
