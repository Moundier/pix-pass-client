import 'package:client_flutter/main.dart';
import 'package:client_flutter/pages/page_secret.dart';
import 'package:client_flutter/pages/page_user.dart';
import 'package:client_flutter/shared/events/event_transition.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyNavbar extends StatelessWidget {
  
  MyNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0), 
      child: NesContainer(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            NesButton(
              type: NesButtonType.normal,
              onPressed: () => CustomTransition.push(context, MainPage()),
              child: Row(
                children: [
                  NesIcon(iconData: NesIcons.hamburgerMenu, size: Size.fromHeight(16),),
                ],
              ),
            ),
            
            const SizedBox(width: 20),
            
            NesButton(
              type: NesButtonType.normal,
              onPressed: () {
                // RouteEvent.openPage(context, SecretPage());
              },
              child: Row(
                children: [
                  NesIcon(iconData: NesIcons.threeHorizontalDots, size: Size.fromHeight(16),),
                ],
              ),
            ),

            const SizedBox(width: 20),

            NesButton(
              type: NesButtonType.normal,
              onPressed: () => CustomTransition.push(context, UserPage()),
              child: Row(
                children: [
                  NesIcon(iconData: NesIcons.user, size: Size.fromHeight(16),),
                ],
              ),
            ),

            const SizedBox(width: 20),
            
            NesButton(
              type: NesButtonType.normal,
              onPressed: () {
                // RouteEvent.openPage(context, UserPage());
              },
              child: Row(
                children: [
                  NesIcon(iconData: NesIcons.questionMark, size: Size.fromHeight(16),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}