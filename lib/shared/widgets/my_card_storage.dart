import 'package:client_flutter/screens/secret/secret.page.dart';
import 'package:client_flutter/shared/models/storage.dart';
import 'package:client_flutter/shared/styles/my_nes_container_style.dart';
import 'package:client_flutter/shared/widgets/my_nes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class MyCardStorage extends StatelessWidget {

  final Storage storage;
  final String? paramImage;
  final Function(Storage)? onUpdate;
  final Function(Storage)? onDelete;

  const MyCardStorage({
    super.key,
    this.paramImage,
    required this.storage,
    this.onUpdate,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () => Navigator.push(context, NesFillTransition.route<void>(
          duration: Durations.extralong4,
          pageBuilder: (_, __, ___) { return PasswordPage(storage: storage); }
        )),
        child: MyNesContainer(
          width: 400,
          label: storage.tag ?? '',
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[
              
              Image.asset(
                paramImage ?? '',
                height: 60,
                fit: BoxFit.cover,
              ),

              Expanded(
                child: Text(
                  storage.title ?? '',
                  style: const TextStyle(
                    fontFamily: 'minecraftia',
                    fontSize: 12, // Small text constant
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 6, 4, 6),
                  child: MyNesIconButton(
                    image: Image.asset('assets/images/pencil.png', height: 32, width: 28,),
                    onPress: () {
                      onUpdate!(storage);
                    }
                  ),
                )
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: NesIconButton(
                    primaryColor: const Color.fromARGB(255, 130, 9, 0),
                    icon: NesIcons.delete,
                    onPress: () => onDelete!(storage),
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
