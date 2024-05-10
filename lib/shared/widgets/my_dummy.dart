import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyDummy extends StatelessWidget {
  
  MyDummy({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

        NesPulser(
          interval: const Duration(milliseconds: 1000),
          child: const Text('No passwords created')
        ),

        Image.asset(
          'assets/key.png',
          width: 150,
          height: 150,
        ),

      ]
    );
  }

}