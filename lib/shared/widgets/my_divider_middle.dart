import 'package:flutter/material.dart';

class MyDividerMiddle extends StatelessWidget {

  final String text;

  const MyDividerMiddle(this.text, { super.key });
  
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 3,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        const SizedBox(width: 10,),
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
