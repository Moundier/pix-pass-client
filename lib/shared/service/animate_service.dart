import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

enum AnimationType {
  transitionHorizontal,
  transitionFill,
  transitionGrid,
}

class AnimationService {

  final AnimationType type;
  final dynamic animation;
  final dynamic page;

  AnimationService(this.type, this.page, {this.animation});

  static void push(BuildContext context, dynamic page, {AnimationType? type}) {

    switch (type) {
      case AnimationType.transitionHorizontal:
        Navigator.of(context).push(transitionHorizontal(page));
        return;
      case AnimationType.transitionFill:
        Navigator.of(context).push(transitionFill(page));
        return;
      case AnimationType.transitionGrid:
        Navigator.of(context).push(transitionGrid(page));
        return;
      default:
        Navigator.of(context).push(transitionHorizontal(page));
        return;
    }

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

  static transitionGrid(page) {
    return NesHorizontalGridTransition.route<void>(
      pageBuilder: (_, __, ___) { return page; }
    );
  }
  
}

