import 'package:client_flutter/shared/service/navigation.service.dart';
import 'package:client_flutter/shared/widgets/my_button_text.dart';
import 'package:client_flutter/shared/widgets/my_nes_icon_button.dart';
import 'package:client_flutter/shared/widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class CardCopy extends StatefulWidget {
  
  final String option;
  final String paramImage;
  final VoidCallback onPressed;

  const CardCopy({
    super.key,
    required this.option,
    required this.paramImage,
    required this.onPressed,
  }); 

  @override
  CardCopyState createState() => CardCopyState(option: option, paramImage: paramImage, onPressed: onPressed);

}

class CardCopyState extends State<CardCopy> {
  
  final String option;
  final String paramImage;
  final VoidCallback onPressed;

  CardCopyState({
    required this.option,
    required this.paramImage,
    required this.onPressed,
  });

  final labelController = TextEditingController();
  final secretController = TextEditingController();

  Widget editor() {

    return Column(

      children: [

        const SizedBox(width: 320),

        const Column(
          children: [
            MyTextField(labelText: 'Password', padding: 2),
            SizedBox(height: 10),
            MyTextField(labelText: 'Confirm Password', padding: 2,),
            SizedBox(height: 10),
          ],
        ),

         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButtonText(text:  'Update', type: NesButtonType.warning, toggleWidget: () { }),
            const SizedBox(width: 20,),
            MyButtonText(text: 'Delete', type: NesButtonType.error, toggleWidget: () => NavigationService.pop(context)),
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
            builder: (_) => editor(),
          );
        },
        child: NesContainer(
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
                    fontFamily: 'minecraftia',
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: MyNesIconButton(imagePath: 'assets/images/clipboard.png', onPress: () => print("Message"),),
              ),
              
            ]
          ),
        ),
      ),
    );
  }
}
