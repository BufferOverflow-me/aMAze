import 'package:fitness_app/src/screens/home/homepage.dart';
import 'package:flutter/material.dart';

import 'current_screen_provider.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key, required this.currentScreenState}) : super(key: key);

  final ApplicationScreenState currentScreenState;
  @override
  Widget build(BuildContext context) {
    switch (currentScreenState) {
      case ApplicationScreenState.home:
        return const HomePage();
      case ApplicationScreenState.stats:
        return const Center(child: Text('stats'));
      case ApplicationScreenState.hots:
        return const Center(child: Text('hots'));
      case ApplicationScreenState.store:
        return const Center(child: Text('store'));
      default:
        return const HomePage();
    }
  }
}
