
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MenuPage extends StatelessWidget {
  
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NesIconButton(
            icon: NesIcons16.leftArrowIndicator,
            onPress: () => {Navigator.pushNamed(context, '/')},
          )
        ),
      ),
      body: const NesScaffold(
        body: Center(),
      )
    );
  }
}
