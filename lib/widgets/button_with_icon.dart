import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class ButtonWithIcon extends StatelessWidget {
  final Widget nesIconWidget;
  final Widget textWidget;
  final void Function() onPressed;

  const ButtonWithIcon({
    super.key,
    required this.nesIconWidget,
    required this.textWidget,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        NesButton(
          type: NesButtonType.normal,
          onPressed: onPressed,
          child: Row(
            children: [
              nesIconWidget,
              const SizedBox(width: 8), // Adding an 8-pixel space
              textWidget,
            ],
          ),
        ),
      ],
    );
  }
}
