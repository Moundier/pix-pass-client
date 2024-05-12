import 'package:client_flutter/shared/widgets/my_button_icon.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          NesDialog.show<void>(
            frame: const NesWindowDialogFrame(),
            context: context,
            builder: (_) => const Text('Hello World'),
          );
        },
        child: NesContainer(
          width: 400,
          label: option,
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[
              // Image.asset(
              //   paramImage,
              //   width: 60,
              //   height: 60,
              //   fit: BoxFit.cover,
              // ),
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
              MyButtonIcon(() => {}, 'assets/images/clipboard.png'),
              // MyButtonIcon(() => {}, 'assets/images/pencil.png'),
              // MyButtonIcon(() => {}, 'assets/images/waste_basket.png'),
            ]
          ),
        ),
      ),
    );
  }
}
