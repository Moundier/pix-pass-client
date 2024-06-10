import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StyleService {

  const StyleService();

  get customTextStyle {
    return const TextStyle(
      fontSize: 10.00,
      fontFamily: 'minecraftia',
      fontWeight: FontWeight.bold,
    );
  }

  get customInputStyle {
    return const InputDecoration(

    );
  }



  // Indentation format is good for frontend, not for backend
}