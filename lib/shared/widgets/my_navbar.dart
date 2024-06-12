import 'package:client_flutter/main.dart';
import 'package:client_flutter/screens/tab2/tab2.page.dart';
import 'package:client_flutter/screens/tab3/tab3.page.dart';
import 'package:client_flutter/shared/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyNavbar extends StatelessWidget {
  
  const MyNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0), 
      child: NesContainer(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            NesButton(
              type: NesButtonType.normal,
              onPressed: () => NavigationService.push(context, MainPage()),
              child: NesIcon(iconData: NesIcons.hamburgerMenu, size: const Size.fromHeight(16),),
            ),
            

            const SizedBox(width: 20),

            NesButton(
              type: NesButtonType.normal,
              onPressed: () => NavigationService.push(context, UserPage()),
              child: NesIcon(iconData: NesIcons.user, size: const Size.fromHeight(16),),
            ),

            const SizedBox(width: 20),
            
            NesButton(
              type: NesButtonType.normal,
              onPressed: () => NavigationService.push(context, AboutPage()),
              child: NesIcon(iconData: NesIcons.threeHorizontalDots, size: const Size.fromHeight(16),),
            ),

          ],
        ),
      ),
    );
  }

}