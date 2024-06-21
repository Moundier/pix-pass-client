import 'package:client_flutter/screens/login/login.page.dart';
import 'package:client_flutter/shared/service/animate_service.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';


class MyDialogConfirm {

  final String? title;
  final String? extraMessage;
  final NesIconData? leftIcon;

  const MyDialogConfirm({
    this.title,
    this.extraMessage,
    this.leftIcon,
  });

  static Future<void> logout(BuildContext context) async {
    await NesDialog.show<void>(
      context: context,
      builder: (_) => Column(
        children: [
          const Text('Confirm logout?'),

          const SizedBox(height: 20,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                child: NesButton(
                  type: NesButtonType.success,
                  child: const Text('Yes'),
                  onPressed: () {
                    AnimationService.push(context, LoginPage());
                  },
                ),
              ),

              const SizedBox(width: 10,),

              Flexible(
                flex: 1,
                child: NesButton(
                  type: NesButtonType.error,
                  child: const Text('No'),
                  onPressed: () {
                    AnimationService.push(context, LoginPage());
                  },
                ),
              ),
            ],
          )

        ],
      )
    );
  }
  
}