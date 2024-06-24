import 'package:client_flutter/shared/models/password.dart';
import 'package:client_flutter/shared/styles/my_text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class PasswordUpdate extends StatefulWidget {
  final Password password;

  const PasswordUpdate({super.key, required this.password});

  static Future<Password?> show(BuildContext context, Password password) async {
    return await NesDialog.show<Password>(
      context: context, 
      builder: (context) => PasswordUpdate(password: password)
    );
  }

  @override
  PasswordUpdateState createState() => PasswordUpdateState();
}

class PasswordUpdateState extends State<PasswordUpdate> {
  
  late Password _password;

  final formKey = GlobalKey<FormState>();
  late TextEditingController tagController;
  late TextEditingController titleController;

  final titleFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _password = widget.password;
    tagController = TextEditingController(text: _password.tag);
    titleController = TextEditingController(text: _password.title);
  }

  @override
  void dispose() {
    tagController.dispose();
    titleController.dispose();
    titleFocus.dispose();
    super.dispose();
  }

  void _updateStorage() {

    if (formKey.currentState?.validate() == false) return;

    _password = Password(
      id: widget.password.id,
      tag: tagController.text,
      title: titleController.text,
      storage: widget.password.storage
    );

    logger.f(_password.toString());

    Navigator.of(context).pop(_password);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: tagController,
              keyboardType: TextInputType.text,
              decoration: MyTextFieldStyle.build("Tag"),
              style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Tag is required';
                return null;
              },
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(titleFocus);
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: titleController,
              focusNode: titleFocus,
              keyboardType: TextInputType.visiblePassword,
              decoration: MyTextFieldStyle.build("Title"),
              style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Title is required';
                return null;
              },
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NesButton(
                  type: NesButtonType.success,
                  onPressed: _updateStorage,
                  child: const Text('Update'),
                ),
                const SizedBox(width: 10),
                NesButton(
                  type: NesButtonType.error,
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
    );
  }
}
