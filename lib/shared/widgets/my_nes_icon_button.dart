import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyNesIconButton extends StatelessWidget {

  const MyNesIconButton({
    super.key,
    required this.imagePath,
    this.onPress,
    this.onPressStart,
    this.onPressEnd,
    this.size,
    this.primaryColor,
    this.secondaryColor,
    this.disabled,
  });

  final String imagePath;
  final VoidCallback? onPress;
  final VoidCallback? onPressStart;
  final VoidCallback? onPressEnd;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Size? size;
  final bool? disabled;

  bool _isDisabled() =>
      (disabled ?? false) ||
      onPress == null && onPressStart == null && onPressEnd == null;

  @override
  Widget build(BuildContext context) {
    return NesPressable(
      onPress: onPress,
      onPressStart: onPressStart,
      onPressEnd: onPressEnd,
      disabled: _isDisabled(),
      child: Opacity(
        opacity: _isDisabled() ? .2 : 1.0,
        child: Image.asset(imagePath, width: 40, height: 40,)
      ),
    );
  }
}
