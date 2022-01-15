import 'package:flutter/material.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({
    Key? key,
    this.id = 'workout',
  }) : super(key: key);
  static const routeName = '/workout';
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(id),
      ),
    );
  }
}
