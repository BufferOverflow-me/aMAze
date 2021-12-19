import 'package:flutter/material.dart';

const double constRadius = 10.0;
const double constPadding = 5.0;

Gradient myGradient(BuildContext context) {
  return LinearGradient(
    colors: [
      Theme.of(context).primaryColor,
      Theme.of(context).primaryColorLight,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
  );
}
