// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
// import 'package:nes_ui/nes_ui.dart';

class MyNesCheckBox extends StatelessWidget {
  const MyNesCheckBox({
    super.key,
    required this.value,
    this.onChange,
    required this.image
  });

  final bool value;

  final void Function(bool)? onChange;
  final Image image;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        onChange?.call(!value);
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
        ),
        child: value ? Transform.translate(
          offset: const Offset(0, 2),
          child: image,
        ) : null,
      ),
    );
  }
}
