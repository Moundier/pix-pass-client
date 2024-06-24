import 'package:client_flutter/shared/models/storage.dart';
import 'package:client_flutter/shared/styles/my_text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class StorageUpdate extends StatefulWidget {
  final Storage storage;

  const StorageUpdate({super.key, required this.storage});

  static Future<Storage?> show(BuildContext context, Storage storage) async {
    return await NesDialog.show<Storage>(
      context: context, 
      builder: (context) => StorageUpdate(storage: storage)
    );
  }

  @override
  StorageUpdateState createState() => StorageUpdateState();
}

class StorageUpdateState extends State<StorageUpdate> {
  
  late Storage _storage;

  final formKey = GlobalKey<FormState>();
  late TextEditingController tagController;
  late TextEditingController titleController;

  final titleFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _storage = widget.storage;
    tagController = TextEditingController(text: _storage.tag);
    titleController = TextEditingController(text: _storage.title);
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

    _storage = Storage(
      id: widget.storage.id,
      tag: tagController.text,
      title: titleController.text,
      user: widget.storage.user
    );

    logger.f(_storage.toString());

    Navigator.of(context).pop(_storage);
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
                  child: const Text('Update'),
                  onPressed: _updateStorage,
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
