import 'package:client_flutter/screens/tab1/tab1.next.dart';
import 'package:client_flutter/shared/service/animate_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class CardCustom extends StatelessWidget {
  final String? paramImage;
  final VoidCallback? onPressed;
  final String? label;
  final String? note;

  const CardCustom({
    super.key,
    this.paramImage,
    this.onPressed,
    this.label,
    this.note,
  });

  @override
  Widget build(BuildContext context) {

    // A22, J4+, J5P
    final size = MediaQuery.of(context).size;
    final fontSize = (size.width + size.height) / 2 * 0.018; 

    // logger.i("Component/Device width: ");
    // logger.i(MediaQuery.of(context).size.width);

    return Container(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          logger.i("card clicked");
          AnimationService.push(context, const Tab1Next(), );
        },
        child: NesContainer(
          width: 400,
          label: label,
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[
              
              Image.asset(
                paramImage ?? '',
                height:  MediaQuery.of(context).size.height * .08,
                fit: BoxFit.cover,
              ),

              Expanded(
                child: Text(
                  note ?? '',
                  style: TextStyle(
                    fontFamily: 'minecraftia',
                    fontSize: fontSize, // Small text constant
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(fontSize),
                  child: NesIconButton(
                    primaryColor: const Color.fromARGB(255, 130, 9, 0),
                    icon: NesIcons.delete,
                    onPress: () => {},
                  ),
                )
              ),
              
            ]
          ),
        ), 
      )
    );
  }
}
