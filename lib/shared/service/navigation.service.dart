import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class NavigationService extends StatelessElement {
  
  NavigationService(super.widget,);

  static void push(BuildContext context, dynamic page) {
    dynamic animation = transitionHorizontal(page);
    Navigator.of(context).push(animation);
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop(true); 
  }

  static PageRouteBuilder transitionFill(page) {
    return NesFillTransition.route<void>(
      pageBuilder: (_, __, ___) { return page; }
    );
  }

  static transitionHorizontal(page) {
    return NesHorizontalCloseTransition.route<void>(
      pageBuilder: (_, __, ___) { return page; }
    );
  }

  static void transitionGrid(page) {
    NesHorizontalGridTransition.route<void>(
      pageBuilder: (_, __, ___) {
        return page;
      }
    );
  }

}

