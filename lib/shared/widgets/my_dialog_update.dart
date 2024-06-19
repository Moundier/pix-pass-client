import 'package:client_flutter/shared/service/animate_service.dart';
import 'package:client_flutter/shared/widgets/my_button_text.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';


class MyDialog {

  final String? title;
  final NesIconData? leftIcon;

  final onConfirm;
  final onCancel;

  const MyDialog({
    this.title,
    this.leftIcon,
    this.onConfirm,
    this.onCancel
  });
  
  Future<void> show(BuildContext context) async {
    
    NesDialog.show<void>(
      context: context,
      builder: (_) => Column(

        children: [

          const SizedBox(width: 220),

          Column(
            children: [
              Text(title ?? 'No text provided'),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButtonText(
                text: 'Yes', 
                type: NesButtonType.warning, 
                toggleWidget: () {
                  
                }
              ),
              
              const SizedBox(width: 20,),
              
              MyButtonText(
                text: 'No', 
                type: NesButtonType.error, 
                toggleWidget: () {
                  AnimationService.pop(context);
                }
              ),
            ],
          ),

        ],
      ),
    );
  }
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
