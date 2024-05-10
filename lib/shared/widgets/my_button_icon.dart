import 'package:flutter/material.dart';

class MyButtonIcon extends StatelessWidget {
  
  final VoidCallback onTap;
  final String image;

  const MyButtonIcon(this.onTap, this.image, {super.key,});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            image, 
            width: 30, 
            height: 30, 
          ),
        )
      ),
    );
  }

}