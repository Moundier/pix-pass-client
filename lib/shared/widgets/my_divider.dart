import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {

  final String text;

  const MyDivider(this.text, { super.key });
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 4,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              text,
              style: const TextStyle(color:Color.fromARGB(255, 0, 0, 0), fontSize: 10),
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 4,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }

}
