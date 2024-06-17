import 'package:client_flutter/shared/service/animate_service.dart';
import 'package:client_flutter/shared/widgets/my_button_text.dart';
import 'package:client_flutter/shared/widgets/my_nes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class CardCopy extends StatelessWidget {
  
  final String? option;
  final String? paramImage;
  final VoidCallback? onPressed;

  CardCopy({
    super.key, 
    this.option,
    this.paramImage,
    this.onPressed,
  });

  final labelController = TextEditingController();
  final secretController = TextEditingController();

  Widget _editor(BuildContext context) {

    return Column(

      children: [

        const SizedBox(width: 320),

        const Column(
          children: [
            // MyTextField(labelText: 'Password', padding: 2),
            SizedBox(height: 10),
            // MyTextField(labelText: 'Confirm Password', padding: 2,),
            SizedBox(height: 10),
          ],
        ),

         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButtonText(
              text:  'Update', 
              type: NesButtonType.warning, 
              toggleWidget: () { }
            ),
            
            const SizedBox(width: 20,),
            
            MyButtonText(
              text: 'Delete', 
              type: NesButtonType.error, 
              toggleWidget: () => AnimationService.pop(context)
            ),
          ],
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          NesDialog.show<void>(
            frame: const NesWindowDialogFrame(title: "Edit secret"),
            context: context,
            builder: (_) => _editor(context),
          );
        },
        child: NesContainer(
          backgroundColor: Colors.blueGrey[300],
          width: 400,
          label: option,
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[

              const SizedBox(width: 20,),
              
              Expanded(
                child: Text(
                  '1234567890111213141516171819202122'.substring(0, 33),
                  style: const TextStyle(
                    fontFamily: 'minecraftia', // J4+, 
                    fontSize: 7.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: MyNesIconButton(
                  onPress: () => print("Message"),
                  imagePath: 'assets/images/clipboard.png', 
                ),
              ),
              
            ]
          ),
        ),
      ),
    );
  }
}
