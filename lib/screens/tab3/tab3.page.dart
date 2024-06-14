import 'package:client_flutter/shared/styles/my_text.style.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class Tab3Page extends StatelessWidget {

  final String? now = DateTime.now().toString(); 

  Tab3Page({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NesIconButton(
            icon: NesIcons16.leftArrowIndicator,
            onPress: () => Navigator.of(context).pop(),
          )
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Information divider

            const Row(
              children: [
                SizedBox(height: 30,),
                Text('Information', 
                  style: TextStyle(
                    fontFamily: 'minecraftia', 
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            MyTextStyle(text: "Developed by Garamoundier"),

            const SizedBox(height: 10),
            MyTextStyle(text: "Pix Pass simplifies password management"),

            const SizedBox(height: 10),
            MyTextStyle(text: "Includes encryption and biometric security"),

            const SizedBox(height: 10),
            MyTextStyle(text: "Thank you for choosing Pix Pass"),
            const SizedBox(height: 10),

            MyTextStyle(text: "garamoundier.developer@protonmail.com"),
            const SizedBox(height: 10),

            NesButton(type: NesButtonType.normal, child: const Text('Donate'), onPressed: () => {} ,),

            const SizedBox(height: 20,),

            const Row(
              children: [
                SizedBox(height: 30,),
                Text('Feedback', 
                  style: TextStyle(
                    fontFamily: 'minecraftia', 
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10,),

            Container(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              width: 400,
              child: Row(
                children: [

                  NesButton(
                    onPressed: () => {},
                    type: NesButtonType.error, 
                    child: NesIcon(
                      iconData: NesIcons.flag, 
                      size: const Size.fromHeight(16)
                    ),
                  ),

                  const SizedBox(width: 10,),

                  const Text(
                    "Report a Bug", style: TextStyle(
                      fontFamily: 'minecraftia', 
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 10,),

            Container(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              width: 400,
              child: Row(
                children: [

                  NesButton(
                    onPressed: () => { },
                    type: NesButtonType.warning, 
                    child: NesIcon(
                      iconData: NesIcons.handPointingRight, 
                      size: const Size.fromHeight(16)
                    ),
                  ),

                  const SizedBox(width: 10,),

                  const Text(
                    "Send Feedback", style: TextStyle(
                      fontFamily: 'minecraftia', 
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(width: 40,),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

