import 'package:client_flutter/main.dart';
import 'package:client_flutter/pages/page_profile.dart';
import 'package:client_flutter/shared/events/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyNavbar extends StatelessWidget {
  
  const MyNavbar({super.key});

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
              onPressed: () => NavigationService.push(context, MainPage()),
              child: Row(
                children: [
                  NesIcon(iconData: NesIcons.hamburgerMenu, size: const Size.fromHeight(16),),
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
                  NesIcon(iconData: NesIcons.threeHorizontalDots, size: const Size.fromHeight(16),),
                ],
              ),
            ),

            const SizedBox(width: 20),

            NesButton(
              type: NesButtonType.normal,
              onPressed: () => NavigationService.push(context, UserPage()),
              child: Row(
                children: [
                  NesIcon(iconData: NesIcons.user, size: const Size.fromHeight(16),),
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
                  NesIcon(iconData: NesIcons.questionMark, size: const Size.fromHeight(16),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}