import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class MyToggleRow extends StatefulWidget {
  
  final double width;
  final String imageAssetPath;
  final String label;
  final bool currentValue;
  final VoidCallback onPressed;

  const MyToggleRow({
    super.key,
    required this.width,
    required this.imageAssetPath,
    required this.label,
    required this.currentValue,
    required this.onPressed,
  });

  @override
  State<MyToggleRow> createState() => _MyToggleRowState();
}

class _MyToggleRowState extends State<MyToggleRow> {
  
  late bool _currentValue;  // Internal state variable

  @override
  void initState() {
    super.initState();
    _currentValue = widget.currentValue;  // Initialize with the value from the widget
  }

  @override
  Widget build(BuildContext context) {
    return NesContainer(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      width: widget.width,
      child: Row(
        children: [
          Image.asset(
            widget.imageAssetPath,
            height: 40,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.label,
              style: const TextStyle(
                fontFamily: 'minecraftia',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 40),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: NesButton(
                onPressed: () {
                  setState(() {
                    _currentValue = !_currentValue;
                  });
                  widget.onPressed();
                },
                type: _currentValue ? NesButtonType.success : NesButtonType.error,
                child: NesIcon(
                  iconData: _currentValue ? NesIcons.check : NesIcons.remove,
                  size: const Size.fromHeight(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
