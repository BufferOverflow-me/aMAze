import 'package:fitness_app/src/screens/screens.dart';
import 'package:flutter/material.dart';

import 'provider/current_screen_provider.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key, required this.currentScreenState}) : super(key: key);

  final ApplicationScreenState currentScreenState;
  @override
  Widget build(BuildContext context) {
    switch (currentScreenState) {
      case ApplicationScreenState.home:
        return const HomePage();
      case ApplicationScreenState.hots:
        // return const Center(child: Text('hots'));
        return const WorkoutDays();
      case ApplicationScreenState.store:
        return const Center(child: Text('store'));
      default:
        return const HomePage();
    }
  }
}
