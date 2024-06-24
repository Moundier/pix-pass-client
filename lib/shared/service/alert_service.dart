import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

enum AlertType {
  normal,
  success,
  warning,
  error,
}

class AlertService extends StatelessWidget {

  final String text;
  final AlertType type;
  
  const AlertService({
    required this.text,
    this.type = AlertType.normal,
    super.key,
  });

  static Future<void> show(
    BuildContext context, {
    required String text,
    AlertType type = AlertType.normal,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: SizedBox(
          width: double.infinity,
          child: AlertService(
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
      case AlertType.normal:
        color = snackbarTheme.normal;
        break;
      case AlertType.success:
        color = snackbarTheme.success;
        break;
      case AlertType.warning:
        color = snackbarTheme.warning;
        break;
      case AlertType.error:
        color = snackbarTheme.error;
        break;
    }

    return NesContainer(
      padding: EdgeInsets.all(24),
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
