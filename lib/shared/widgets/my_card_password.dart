import 'package:client_flutter/shared/models/password.dart';
import 'package:client_flutter/shared/styles/my_nes_container_style.dart';
import 'package:client_flutter/shared/widgets/my_dialog_confirm.dart';
import 'package:client_flutter/shared/widgets/my_nes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';

import 'package:flutter/services.dart';

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

  Future<void> _deletePassword() async {

  }

  Future<void> _updatePassword() async {
   
  }

  void _clipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: SizedBox(
          width: double.infinity,
          child: NesSnackbar(
            text: text,
            type: NesSnackbarType.success,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: MyNesContainer(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          width: 400,
          label: password.tag,
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[

              const SizedBox(width: 20,),
              const SizedBox(height: 60,),
              
              Expanded(
                child: Text(
                  password.title ?? 'No title',
                  style: const TextStyle(
                    fontFamily: 'minecraftia', // J4+, 
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
                    onPress: () => const MyDialogConfirm(
                      title: '',
                      extraMessage: '',
                    ).show(context)
                  ),
                )
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: MyNesIconButton(
                    
                    image: Image.asset('assets/images/clipboard.png', height: 34,),
                    onPress: () => _clipboard('Copied to clipboard', context),
                  ),
                )
              ),


              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6, 8, 12, 6),
                  child: NesIconButton(
                    primaryColor: Color.fromARGB(255, 119, 1, 1),
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
    );
  }
}
