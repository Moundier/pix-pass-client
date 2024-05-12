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
    // frame: NesWindowDialogFrame(
    //   title: title,
    //   leftIcon: leftIcon,
    // ),
    context: context,
    builder: (_) => widget,
  );
}

// TODO: 
// dialog confirm delete secure 
// dialog confirm edit secure
// dialog confirm edit and delete of secret
// dialog confirm edit username email and password
// dialog confirm edit authentication methods
// dialog confirm log out
// page update profile
