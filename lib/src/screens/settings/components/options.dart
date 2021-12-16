import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({Key? key, required this.children, required this.text})
      : super(key: key);

  final String text;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
        Row(
          children: children,
        ),
      ],
    );
  }
}
