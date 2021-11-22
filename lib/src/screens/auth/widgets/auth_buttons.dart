import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(this.heading, {Key? key}) : super(key: key);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          heading,
          style: Theme.of(context).textTheme.headline3,
        ),
      );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content, {Key? key}) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      );
}

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail, {Key? key}) : super(key: key);
  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              detail,
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      );
}

class StyledButton extends StatelessWidget {
  const StyledButton({
    required this.child,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Theme.of(context).primaryColorLight)),
        onPressed: onPressed,
        child: child,
      );
}
