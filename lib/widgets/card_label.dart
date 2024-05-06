import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class CardCustom extends StatelessWidget {
  final String paramImage;
  final VoidCallback onPressed;

  const CardCustom({
    super.key,
    required this.paramImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return NesContainer(
      width: 400,
      label: 'Label',
      padding: const EdgeInsets.all(0.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            paramImage,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Text(
              'contato.gabrielcasanova@gmail.com'.substring(0, 33),
              style: const TextStyle(
                fontFamily: 'minecraftia',
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: NesIconButton(
                primaryColor: const Color.fromARGB(255, 130, 9, 0),
                icon: NesIcons.delete,
                onPress: () => {},
              ),
            )
          ),
        ]
      ),
    );
  }
}
