import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

enum MyNesSnackbarType {
  normal,
  success,
  warning,
  error,
}

class MyNesSnackbar extends StatelessWidget {

  final String text;
  final MyNesSnackbarType type;
  
  const MyNesSnackbar({
    required this.text,
    this.type = MyNesSnackbarType.normal,
    super.key,
  });

  static void show(
    BuildContext context, {
    required String text,
    MyNesSnackbarType type = MyNesSnackbarType.normal,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: SizedBox(
          width: double.infinity,
          child: MyNesSnackbar(
            text: text,
            type: type,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final snackbarTheme = context.nesThemeExtension<NesSnackbarTheme>();

    late Color color;

    switch (type) {
      case MyNesSnackbarType.normal:
        color = snackbarTheme.normal;
        break;
      case MyNesSnackbarType.success:
        color = snackbarTheme.success;
        break;
      case MyNesSnackbarType.warning:
        color = snackbarTheme.warning;
        break;
      case MyNesSnackbarType.error:
        color = snackbarTheme.error;
        break;
    }

    return NesContainer(
      backgroundColor: color,
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'minecraftia',
          fontSize: 14,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
