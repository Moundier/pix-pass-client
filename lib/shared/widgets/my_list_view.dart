import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  
  final List<Widget> widgetList;

  const MyListView({super.key, required this.widgetList});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widgetList,
    );
  }
}