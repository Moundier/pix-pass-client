import 'package:flutter/widgets.dart';

class MyHyperlinkText extends StatelessWidget {
  final void Function()? onTap;
  final String? text;

  const MyHyperlinkText({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text ?? '',
        style: const TextStyle(color: Color.fromARGB(255, 0, 99, 180), fontSize: 10),
      ),
    );
  }
}
