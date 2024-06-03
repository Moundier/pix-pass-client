import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';


class MyDialog extends StatelessWidget {

  final Widget widget;
  final String? title;
  final NesIconData? leftIcon;

  const MyDialog({
    super.key, 
    required this.widget,
    this.title,
    this.leftIcon
  });
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> show(BuildContext context) async => NesDialog.show<void>(
    context: context,
    builder: (_) => widget,
  );
}

// TODO: 
// dialog confirm edit, delete secure 
// dialog confirm edit, delete of secret
// dialog confirm edit authentication methods
// dialog confirm log out
