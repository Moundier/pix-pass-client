import 'package:client_flutter/shared/styles/my_small_text_style.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class AboutPage extends StatelessWidget {
  
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

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

            const SizedBox(height: 8,),
            const MyBoldTextStyle("ORIGIN: Brazil, Rio Grande do Sul"),
            const SizedBox(height: 8,),
            const MyBoldTextStyle("MANTAINER: Gabriel Vieira Casanova"),
            const SizedBox(height: 8,),
            const MyBoldTextStyle("CONTACT: garamoundier.developer@protonmail.com"),
            const SizedBox(height: 10),

            NesButton(type: NesButtonType.normal, child: Text('Donate'), onPressed: () => {} ,),

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

