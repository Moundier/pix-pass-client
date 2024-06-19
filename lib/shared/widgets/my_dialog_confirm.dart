import 'package:client_flutter/shared/service/animate_service.dart';
import 'package:client_flutter/shared/widgets/my_button_text.dart';
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
  
  Future<void> show(BuildContext context) async => NesDialog.show<void>(
    frame: NesWindowDialogFrame(title: title),
    context: context,
    builder: (_) => Column(

      children: [

        const SizedBox(width: 220),

        Column(
          children: [
            Text(extraMessage ?? 'No text provided'),
          ],
        ),

        const SizedBox(height: 20),

         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButtonText(
              text: 'Yes', 
              type: NesButtonType.warning, 
              toggleWidget: () { }
            ),
            
            const SizedBox(width: 20,),
            
            MyButtonText(
              text: 'No', 
              type: NesButtonType.error, 
              toggleWidget: () => AnimationService.pop(context)
            ),
          ],
        ),

      ],
    ),
  );
}

// TODO: 
// dialog confirm edit, delete secure 
// dialog confirm edit, delete of secret
// dialog confirm edit authentication methods
// dialog confirm log out

 /// edit storage password user
 /// delete password
 /// clipboard
 /// biometric
