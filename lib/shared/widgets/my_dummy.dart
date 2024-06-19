import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyDummy extends StatelessWidget {
  
  const MyDummy({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NesPulser(
        interval: const Duration(milliseconds: 700),
        child: const Text(
          'No passwords created',
          style: TextStyle(
            fontFamily: 'minecraftia',
            fontSize: 20
          ),  
        )
      )
    );
  }

}