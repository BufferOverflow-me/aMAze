import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({Key? key, required this.color, required this.onTap})
      : super(key: key);
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const double containerRadius = 15.0;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: containerRadius,
          backgroundColor: Theme.of(context).primaryColor,
          child: Center(
            child: Icon(
              Icons.brightness_1,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
