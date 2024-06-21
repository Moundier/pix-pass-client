import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyNesContainer extends StatelessWidget {
  const MyNesContainer({
    super.key,
    this.label,
    this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.padding,
    this.painterBuilder,
  });

  final String? label;
  final Widget? child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final NesContainerPainterBuilder? painterBuilder;

  @override
  Widget build(BuildContext context) {

    final nesContainerTheme = context.nesThemeExtension<NesContainerTheme>();
    const textStyle = TextStyle(fontFamily: 'minecraftia', fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);
    final containerColor = backgroundColor ?? nesContainerTheme.backgroundColor;
    final padding = this.padding ?? nesContainerTheme.padding;
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final pixelSize = nesContainerTheme.pixelSize ?? nesTheme.pixelSize;
    final painter = painterBuilder ?? nesContainerTheme.painter;

    return CustomPaint(
      painter: painter(
        label: label,
        pixelSize: pixelSize,
        textStyle: textStyle,
        backgroundColor: containerColor,
        borderColor: nesContainerTheme.borderColor,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
