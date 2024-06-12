import 'package:client_flutter/shared/widgets/my_button_text.dart';
import 'package:client_flutter/shared/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class Tab2Sequence extends StatelessWidget {

  const Tab2Sequence({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NesIconButton(
            icon: NesIcons16.leftArrowIndicator,
            onPress: () => Navigator.of(context).pop(),
          )
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 10,),
          const MyTextField(labelText: 'Username', padding: 16,),
          const SizedBox(height: 10),
          const MyTextField(labelText: 'Email', padding: 16),
          const SizedBox(height: 10),
          const MyTextField(labelText: 'Password', padding: 16),
          const SizedBox(height: 10),
          const MyTextField(labelText: 'Confirm Password', padding: 16),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButtonText(text: 'Confirm', type: NesButtonType.success, toggleWidget: () { }),
              const SizedBox(width: 20,),
              MyButtonText(text: 'Cancel', type: NesButtonType.error, toggleWidget: () {  }),
            ],
          ),
        ],
      )
    ); 
    
  }
}