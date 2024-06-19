import 'package:client_flutter/shared/models/password.dart';
import 'package:client_flutter/shared/service/animate_service.dart';
import 'package:client_flutter/shared/styles/my_nes_container_style.dart';
import 'package:client_flutter/shared/widgets/my_button_text.dart';
import 'package:client_flutter/shared/widgets/my_nes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class MyCardPassword extends StatelessWidget {
  
  final Password password;
  final Function(Password)? onUpdate;
  final Function(Password)? onDelete;

  MyCardPassword({
    super.key, 
    required this.password,
    this.onUpdate,
    this.onDelete,
  });

  final tagController = TextEditingController();
  final titleController = TextEditingController();

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
        child: MyNesContainer(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          width: 400,
          label: password.tag,
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[

              const SizedBox(width: 20,),
              
              Expanded(
                child: Text(
                  password.title ?? 'No title',
                  style: const TextStyle(
                    fontFamily: 'minecraftia', // J4+, 
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: MyNesIconButton(
                    height: 30,
                    primaryColor: const Color.fromARGB(255, 130, 9, 0),
                    imagePath: 'assets/images/pencil.png',
                    onPress: () {
                      logger.f('Copy to clipboard');
                      // onDelete!(storage); // Http delete request
                    },
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
                    onPress: () {
                      // logger.f(storage.toString());
                      // onDelete!(storage); // Http delete request
                    },
                  ),
                )
              ),
              
            ]
          ),
        ),
      ),
    );
  }
}
