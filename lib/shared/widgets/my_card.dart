import 'package:client_flutter/pages/page_secret.dart';
import 'package:client_flutter/shared/events/event_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class CardCustom extends StatelessWidget {
  final String paramImage;
  final VoidCallback onPressed;

  const CardCustom({
    super.key,
    required this.paramImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          print("Are you stupid? yes");
          CustomTransition.push(context, const SecretPage());
        },
        child: NesContainer(
          width: 400,
          label: 'Label',
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[
              Image.asset(
                paramImage,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Text(
                  'garamoundier.developer@protonmail.com'.substring(0, 33) + '...',
                  style: const TextStyle(
                    fontFamily: 'minecraftia',
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
