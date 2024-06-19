import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyAppBarLeading extends StatelessWidget {
  
  const MyAppBarLeading({super.key,});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8),
      child: NesIconButton(
        icon: NesIcons16.leftArrowIndicator,
        onPress: () => Navigator.of(context).pop(),
      )
    );
  }

}