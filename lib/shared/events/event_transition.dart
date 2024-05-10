import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class RouteEvent extends StatelessElement {
  
  RouteEvent(super.widget);

  static void openPage(BuildContext context, page) {
    Navigator.of(context).push(
      NesHorizontalCloseTransition.route<void>(
        pageBuilder: (_, __, ___) { return page; }
      )
    );
  }

  static void transitionFill(BuildContext context, page) {
    Navigator.of(context).push(
      NesFillTransition.route<void>(
        pageBuilder: (_, __, ___) { return page; }
      )
    );
  }

  static void transitionGrid(BuildContext context, page) {
    Navigator.of(context).push(
      NesHorizontalGridTransition.route<void>(
        pageBuilder: (x, y, z) { return page; } 
      )
    );
  }

}

