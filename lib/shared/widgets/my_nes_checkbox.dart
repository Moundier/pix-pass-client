// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_check_box}
/// A Check Box widget.
/// {@endtemplate}
class MyNesCheckBox extends StatelessWidget {
  /// {@macro nes_check_box}
  const MyNesCheckBox({
    super.key,
    required this.value,
    this.onChange,
    required this.image
  });

  /// Value (Checked or not)
  final bool value;

  /// Called with the new value and received a change input.
  final void Function(bool)? onChange;
  final Image image;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium ?? const TextStyle();
    final nesTheme = context.nesThemeExtension<NesTheme>();

    return GestureDetector(
      onTap: () {
        onChange?.call(!value);
      },
      child: Container(
        width: 30,
        height: 30,
        
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(10.0), // Adjust the value according to your requirement
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
        ),
        child: value
            ? Transform.translate(
                offset: const Offset(0, 2),
                child: image,
              )
            : null,
      ),
    );
  }
}
